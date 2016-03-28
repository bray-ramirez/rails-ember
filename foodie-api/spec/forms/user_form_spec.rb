require 'rails_helper'

RSpec.describe UserForm do

  describe '#save' do
    let(:user_attributes){
      FactoryGirl.attributes_for :user,
        :password => 'password',
        :password_confirmation => 'password'
    }


    let(:form){ UserForm.new User.new }


    before do
      form.validate user_attributes
      form.save
    end


    it { expect(User.last.auth_token).to be_present }
  end

end
