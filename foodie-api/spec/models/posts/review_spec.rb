require 'rails_helper'

RSpec.describe Review, type: :model do

  describe 'default scope' do
    let(:blog){ FactoryGirl.create :blog }
    let(:recipe){ FactoryGirl.create :recipe }
    let(:review){ FactoryGirl.create :review }


    before do
      blog
      recipe
      review
    end


    it { expect(Review.all).to include review }
    it { expect(Review.all).to_not include recipe, blog }
  end

end
