require "rails_helper"

RSpec.describe YipsController, type: :controller do

    describe "GET#index" do
        it "renders the yips index" do
            get :index
            # 'response' is a reserved keyword RSpec is providing us
            expect(response).to render_template(:index)
        end
    end

    # describe "GET#new" do
    #     it "renders form to write a new yip" do
    #         # when the #logged_in? method is called, will return true (to mock having a logged in user, like if we had a before_action)
    #         allow(subject).to receive(:logged_in?).and_return(true)
    #         get :new
    #         expect(response).to render_template(:new)
    #     end
    # end

    describe "DELETE#destroy" do

        let!(:test_yip) { create(:yip) }
        before :each do
            allow(subject).to receive(:current_user).and_return(test_yip.author)
            delete :destroy, params: { id: test_yip.id }
        end

        it "destroys the yip" do
            expect(Yip.exists?(test_yip.id)).to be false
        end

        it "redirects to yips_url" do
            expect(response).to have_http_status(302)
            expect(response).to redirect_to(yips_url)
        end

    end

    describe "POST#create" do
        before :each do
            create(:user)
            # current user will be user created above
            allow(subject).to receive(:current_user).and_return(User.last)
        end

        let(:valid_params) { 
            # curly braces below are for hash we're creating (nest params under key of "yip")
            { 
                yip: { 
                    body: "Does writing yips make me a yipper?" 
                } 
            } 
        }
        let(:invalid_params) { { yip: { nada: "" } } }

        context "with valid params" do
            it "should save a new yip to the database" do
                post :create, params: valid_params
                expect(Yip.last.body).to eq(valid_params[:yip][:body])
            end
            
            it "redirects to yip_url" do
                post :create, params: valid_params
                # first make the request (don't have creation in before :each)
                expect(response).to have_http_status(302)
                expect(response).to redirect_to(yip_url(Yip.last.id))
            end
        end

        context "with invalid params" do
            before :each do
                # attempt to create invalid yip before each test
                post :create, params: invalid_params
            end

            it "should have status of 422" do
                expect(response).to have_http_status(422)
            end
            it "should render the error messages as JSON" do
            #     # expect(flash[:errors]).to be_present
                expect(JSON.parse(response.body)).to eq(["Body can't be blank"])
                # JSON.parse converts JSON response body back to array, would only have this error from how we set up request
            end
            it "shouldn't save to the database" do
                # doesn't work if database starts empty
                # expect(Yip.last.body).to_not eq("")

                # only works if test database starts empty
                expect(Yip.last).to eq(nil)

                # could also count yips before & after creation attempt
            end
        end

    end

end