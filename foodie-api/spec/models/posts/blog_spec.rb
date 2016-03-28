require 'rails_helper'

RSpec.describe Blog, type: :model do

  describe 'default scope' do
    let(:blog){ FactoryGirl.create :blog }
    let(:recipe){ FactoryGirl.create :recipe }
    let(:review){ FactoryGirl.create :review }


    before do
      blog
      recipe
      review
    end


    it { expect(Blog.all).to include blog }
    it { expect(Blog.all).to_not include recipe, review }
  end

end
