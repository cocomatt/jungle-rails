require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should work if it receives all five required validators' do
      cat1 = Category.find_or_create_by! name: 'electronics'
      @product = Product.new({name:  'hotdog', quantity: 0, price: 2483.75, category: cat1})
      @product.save!
    end

    it 'should NOT work if it is missing a name' do
      cat1 = Category.find_or_create_by! name: 'electronics'
      @product = Product.new({description: "described", quantity: 0, price: 2483.75, category: cat1})
      expect {  @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT work if it is missing a price' do
      cat1 = Category.find_or_create_by! name: 'electronics'
      @product = Product.new({name:  'hotdog', quantity: 0, category: cat1})
      expect {  @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT work if it is missing a quantity' do
      cat1 = Category.find_or_create_by! name: 'electronics'
      @product = Product.new({name:  'hotdog', price: 2483.75, category: cat1})
      expect {  @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should NOT work if it is missing a category' do
      cat1 = Category.find_or_create_by! name: 'electronics'
      @product = Product.new({name:  'hotdog', quantity: 0, price: 2483.75})
      expect {  @product.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end