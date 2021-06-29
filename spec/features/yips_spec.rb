require "rails_helper"

feature "Creating a Yip", type: :feature do

    before :each do
        create(:user)
        visit new_yip_url
    end

    scenario "takes a body" do
        # 'page' is keyword referring to actual page content (HTML & CSS)
        expect(page).to have_content "New Yip"
        expect(page).to have_content "Body"
    end

    scenario "takes us to yips show" do
        login_user(User.last)
        create_yip("Some text")
        expect(page).to have_content "One Single Yip"
        expect(page).to have_content "Some text"
        # save_and_open_page
        expect(current_path).to eq(yip_path(Yip.last))
    end



end

feature "De-yipping a Yip", type: :feature do
    before :each do
        create(:user)
        login_user(User.last)
        create_yip("To be deleted")
        click_button("Delete this yip")
    end

    scenario "de-yips a yip" do
        expect(page).to_not have_content("To be deleted")
        expect(page).to have_content("All the yips!")
    end
end