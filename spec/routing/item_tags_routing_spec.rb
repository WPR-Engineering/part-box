require "rails_helper"

RSpec.describe ItemTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/item_tags").to route_to("item_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/item_tags/new").to route_to("item_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/item_tags/1").to route_to("item_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/item_tags/1/edit").to route_to("item_tags#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/item_tags").to route_to("item_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/item_tags/1").to route_to("item_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/item_tags/1").to route_to("item_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/item_tags/1").to route_to("item_tags#destroy", :id => "1")
    end
  end
end
