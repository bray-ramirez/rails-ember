require 'rails_helper'

RSpec.describe Post, type: :model do

  describe '.published' do
    let(:published){ FactoryGirl.create_list :post, 3, :published }
    let(:unpublished){ FactoryGirl.create :post }


    before do
      published
      unpublished
    end


    it { expect(Post.published).to match_array published }
    it { expect(Post.published).not_to include unpublished }
  end


  describe '.latest' do
    let(:recent){ FactoryGirl.create :post, :created_at => DateTime.now }
    let(:oldest){ FactoryGirl.create :post, :created_at => 1.hour.ago }


    before do
      recent
      oldest
    end


    it { expect(Post.latest).to eq [recent, oldest] }
  end

end
