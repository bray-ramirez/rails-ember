require 'rails_helper'

RSpec.describe Activity, type: :model do

  let(:blog){ FactoryGirl.create :blog }


  describe '.by_newest' do
    let(:recent){ FactoryGirl.create :activity, :create, :trackable => blog }
    let(:oldest){ FactoryGirl.create :activity, :create, :trackable => blog }


    before do
      recent
      oldest
    end


    it { expect(Activity.by_newest).to match_array [recent, oldest] }
  end


  describe '.most_recent' do
    let(:activities){
      FactoryGirl.create_list :activity, 30, :create, :trackable => blog
    }


    before do
      activities
    end


    it { expect(Activity.most_recent.count).to eq Activity::RECENT_LIMIT }
  end

end
