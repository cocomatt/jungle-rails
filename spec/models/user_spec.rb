require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'should add to db if user gives valid credentials' do
      @user = User.new({name: 'testboy', email: "testboy@gmail.com", password_digest: "password"})
      @user.save!
    end

    it 'should throw error if user fails to give name' do
      @user = User.new({email: "testboy@gmail.com", password_digest: "password"})
      expect {  @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should throw error if user fails to give matching passwords' do
      @user = User.new({name: 'testboy', email: "testboy@gmail.com"})
      expect {  @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should throw error if user fails to give email' do
      @user = User.new({name: 'testboy', password_digest: "password"})
      expect {  @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

#    it 'should throw error if user fails to give email' do
#      @user = User.new({name: 'Johnnyboy', password_digest: "passman"})
#      expect {  @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
#    end

    it 'should throw error if user gives too short of a password' do
      @user = User.new({name: 'testboy', email: "testboy@gmail.com", password_digest: "pass"})
      expect {  @user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end