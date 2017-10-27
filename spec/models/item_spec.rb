require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'validation tests' do
    before(:each) do
      User.new(email: 'email@example.com', password: 'password', password_confirmation: 'password').save
      @user = User.where(email: 'email@example.com').take
      List.new(description: 'List1', user: @user).save
      @list = List.where(description: 'List1').take
    end

    it 'ensures presence of description' do
      item = Item.new(description: '').save
      expect(item).to eq(false)
    end

    it 'ensures presence of list' do
      item = Item.new(description: 'Item desc').save
      expect(item).to eq(false)
    end

    it 'should save successfuly' do
      item = Item.new(description: 'Item decs', list: @list).save
      expect(item).to eq(true)
    end
  end
end
