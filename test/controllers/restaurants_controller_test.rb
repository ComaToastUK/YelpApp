require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  RSpec.describe Restaurant, :type => :model do
    it "is valid with valid attributes" do
      expect(Restaurant.new).to be_valid
    end

    it "is not valid without a name" do
      expect(Restaurant.new(name: '')).to_not be_valid
    end

    it "is not valid with a title shorter than 5 characters" do
      expect(Restaurant.new(name: 'Dine')).to_not be_valid
    end

    it "is not valid without a description" do
      expect(Restaurant.new(description: '')).to_not be_valid
    end

    it "is not valid without a location" do
      expect(Restaurant.new(location: '')).to_not be_valid
    end
  end
end
