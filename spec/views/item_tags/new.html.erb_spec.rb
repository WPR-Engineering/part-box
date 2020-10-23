require 'rails_helper'

RSpec.describe "item_tags/new", type: :view do
  before(:each) do
    assign(:item_tag, ItemTag.new(
      :tag_number => "MyString",
      :container_quantity => 1,
      :auto_removed => false,
      :consumable => nil
    ))
  end

  it "renders new item_tag form" do
    render

    assert_select "form[action=?][method=?]", item_tags_path, "post" do

      assert_select "input[name=?]", "item_tag[tag_number]"

      assert_select "input[name=?]", "item_tag[container_quantity]"

      assert_select "input[name=?]", "item_tag[auto_removed]"

      assert_select "input[name=?]", "item_tag[consumable_id]"
    end
  end
end
