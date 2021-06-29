class YipsController < ApplicationController
    # if no method for RESTful action, rails assumes method exists with only render :template_name
    def index
        @yips = Yip
            .includes(:author)
            .left_outer_joins(:likes)
            .select("yips.*, COUNT(likes.id) as num_likes")
            .group(:id)
        
        # render json: @yips
        render :index
    end

    def new
        render :new
    end

    def show
        #wildcards exist in params object
        #params give us access to: path, query string, and request body
        @yip = Yip.find(params[:id])
        
        render :show
    end

    def create
        @yip = Yip.new(yip_params)
        @yip.author_id = current_user.id
        
        if @yip.save
            #better to use @yip.save instead of @yip.save! (this stop execution)
            
            redirect_to yip_url(@yip)
            #yips_url(@yip) brings us to localhost:3000/yips/@yip.id
        else
            # flash[:errors] = @yip.errors.full_messages
            render json: @yip.errors.full_messages, status: 422
        end
    end

    def update
        @yip = Yip.find(params[:id])
        
        if @yip.update(yip_params)
            redirect_to yip_url(@yip)
        else
            render json: @yip.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @yip = Yip.find(params[:id])
        @yip.destroy
        redirect_to yips_url
    end

    def yip_params
        #requires that all data sent by user is under key of "yip"
        params.require(:yip).permit(:body, :author_id)
    end

end