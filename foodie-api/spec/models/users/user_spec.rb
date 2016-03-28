require 'rails_helper'

RSpec.describe User, type: :model do

  describe '.alphabetical' do
    let(:superman){ FactoryGirl.create :user, :name => 'Superman' }
    let(:batman){ FactoryGirl.create :user, :name => 'Batman' }
    let(:wonderwoman){ FactoryGirl.create :user, :name => 'Wonder Woman '}


    before do
      superman
      batman
      wonderwoman
    end


    it { expect(User.alphabetical).to eq [batman, superman, wonderwoman] }
  end


  describe '.non_admin' do
    let(:admin){ FactoryGirl.create :user, :admin }
    let(:non_admin){ FactoryGirl.create_list :user, 3 }


    before do
      admin
      non_admin
    end


    it { expect(User.non_admin).to match_array non_admin }
    it { expect(User.non_admin).not_to include admin }
  end

end
