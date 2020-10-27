require 'rails_helper'

RSpec.describe "ItemTags", type: :request do
  describe "GET /item_tags" do
    it "works! (now write some real specs)" do
      get item_tags_path
      expect(response).to have_http_status(200)
    end
  end
end
