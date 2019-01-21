require 'rails_helper'

def setup
  sign_in FactoryBot.create(:user)
end

RSpec.describe "GetOrders", type: :request do
  describe "GET /orders, make sure we can visit the right path" do
    setup
    it "works! (now write some real specs)" do
      get orders_path
    end
  end
end

RSpec.describe "GetConsumables", type: :request do
  describe "Boom"
end
