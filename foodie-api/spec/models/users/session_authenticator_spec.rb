require 'rails_helper'

RSpec.describe SessionAuthenticator do

  let(:user){
    FactoryGirl.create :user,
      :email => 'user@email.com',
      :password => 'password'
  }


  context 'when credentials are valid' do
    let(:session_auth){
      SessionAuthenticator.new(
        :email => 'user@email.com',
        :password => 'password')
    }


    before do
      user
    end


    describe '#user' do
      it { expect(session_auth.user).to eq user }
    end


    describe '#valid?' do
      it { expect(session_auth.valid?).to be true }
    end


    describe '#invalid?' do
      it { expect(session_auth.invalid?).to be false }
    end
  end


  context 'when credentials are invalid' do
    shared_examples 'valid is false' do
      it { expect(auth.valid?).to be false }
    end


    shared_examples 'invalid is true' do
      it { expect(auth.invalid?).to be true }
    end


    context 'with invalid email' do
      let(:session_auth){
        SessionAuthenticator.new(
          :email => 'invalid@email.com',
          :password => 'password'
        )
      }


      before do
        user
      end


      describe '#user' do
        it { expect(session_auth.user).to eq nil }
      end


      describe '#valid?' do
        it_behaves_like 'valid is false' do
          let(:auth){ session_auth }
        end
      end


      describe '#invalid?' do
        it_behaves_like 'invalid is true' do
          let(:auth){ session_auth }
        end
      end
    end


    context 'with invalid password' do
      let(:session_auth){
        SessionAuthenticator.new(
          :email => 'user@email.com',
          :password => 'wrongpassword'
        )
      }


      before do
        user
      end


      describe '#valid?' do
        it_behaves_like 'valid is false' do
          let(:auth){ session_auth }
        end
      end


      describe '#invalid?' do
        it_behaves_like 'invalid is true' do
          let(:auth){ session_auth }
        end
      end
    end
  end



end
