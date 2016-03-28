require 'rails_helper'

RSpec.describe Recipe, type: :model do

  describe 'default scope' do
    let(:blog){ FactoryGirl.create :blog }
    let(:recipe){ FactoryGirl.create :recipe }
    let(:review){ FactoryGirl.create :review }


    before do
      blog
      recipe
      review
    end


    it { expect(Recipe.all).to include recipe }
    it { expect(Recipe.all).to_not include blog, review }
  end

end
