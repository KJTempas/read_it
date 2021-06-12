require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    def setup  #create a category to be used for each test
        @category = Category.new(name: "Historical Fiction")
    end

    test "category should be valid" do
        assert @category.valid?
    end

    test "name should be present" do
        @category.name =" "
        assert_not @category.valid?
    end

    test "name should be unique" do
        @category.save
        #create second category w same name should be rejected du to unique constraint
        @category2 = Category.new(name: "Historical Fiction")
        assert_not @category2.valid?
    end

    test "name should not be too long" do
        @category.name = "a" *26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "aa"  #minimum length for a category is 3
        assert_not @category.valid?
    end
    
end
