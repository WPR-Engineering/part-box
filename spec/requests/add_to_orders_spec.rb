require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

def login_user
    user = FactoryBot.create(:user)
    #user.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the "confirmable" module
    login_as(user, :scope => :user)
end


#RSpec.describe "OrderButton", type: :feature do
#  describe "Makes a tag, visits that tag, sees if add to order exists" do
#    login_user
#    FactoryBot.create(:asset_tag)
#    it "signs in and creates a tag" do
#      visit asset_tags_path
#      expect(page).to have_text 'TAG-00'
#      expect(page).to_not have_text "Sign up"
#    end
#    it "visits that tag path"

#  end
#end
