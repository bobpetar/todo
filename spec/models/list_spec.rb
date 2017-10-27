require 'rails_helper'

RSpec.describe List, type: :model do
  context 'validation tests' do
    before(:each) do
      User.new(email: 'email@example.com', password: 'password', password_confirmation: 'password').save
      @user = User.where(email: 'email@example.com').take
    end
    
    it 'ensures presence of description' do
      list = List.new(description: '', user: @user).save
      expect(list).to eq(false)
    end

    it 'ensures presence of user' do
      list = List.new(description: 'List desc').save
      expect(list).to eq(false)
    end

    it 'should save successfuly' do
      list = List.new(description: 'List decs', user: @user).save
      expect(list).to eq(true)
    end
  end
end
