require 'rails_helper'

RSpec.describe PostForm do

  describe '#save' do
    let(:attributes){ FactoryGirl.attributes_for :blog }


    context 'when creating' do
      let(:user){ FactoryGirl.create :user }
      let(:form){ PostForm.new user.blogs.new }


      before do
        form.validate attributes
        form.save
      end


      it { expect(Activity.last.action).to eq Activity::ACTION::CREATE }
    end


    context 'when updating' do
      let(:blog){ FactoryGirl.create :blog }
      let(:form){ PostForm.new blog }


      before do
        form.validate attributes
        form.save
      end


      it { expect(Activity.last.action).to eq Activity::ACTION::UPDATE }
    end
  end

end
