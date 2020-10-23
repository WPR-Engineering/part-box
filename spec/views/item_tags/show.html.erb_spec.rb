require 'rails_helper'

RSpec.describe "item_tags/show", type: :view do
  before(:each) do
    @item_tag = assign(:item_tag, ItemTag.create!(
      :tag_number => "Tag Number",
      :container_quantity => 2,
      :auto_removed => false,
      :consumable => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tag Number/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
