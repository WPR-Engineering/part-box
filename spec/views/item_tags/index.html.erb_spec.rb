require 'rails_helper'

RSpec.describe "item_tags/index", type: :view do
  before(:each) do
    assign(:item_tags, [
      ItemTag.create!(
        :tag_number => "Tag Number",
        :container_quantity => 2,
        :auto_removed => false,
        :consumable => nil
      ),
      ItemTag.create!(
        :tag_number => "Tag Number",
        :container_quantity => 2,
        :auto_removed => false,
        :consumable => nil
      )
    ])
  end

  it "renders a list of item_tags" do
    render
    assert_select "tr>td", :text => "Tag Number".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
