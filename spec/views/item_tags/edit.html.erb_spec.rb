require 'rails_helper'

RSpec.describe "item_tags/edit", type: :view do
  before(:each) do
    @item_tag = assign(:item_tag, ItemTag.create!(
      :tag_number => "MyString",
      :container_quantity => 1,
      :auto_removed => false,
      :consumable => nil
    ))
  end

  it "renders the edit item_tag form" do
    render

    assert_select "form[action=?][method=?]", item_tag_path(@item_tag), "post" do

      assert_select "input[name=?]", "item_tag[tag_number]"

      assert_select "input[name=?]", "item_tag[container_quantity]"

      assert_select "input[name=?]", "item_tag[auto_removed]"

      assert_select "input[name=?]", "item_tag[consumable_id]"
    end
  end
end
