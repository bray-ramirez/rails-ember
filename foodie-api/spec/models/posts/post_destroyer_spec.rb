require 'rails_helper'

RSpec.describe PostDestroyer do

  describe '#initialize' do
    context 'when object is invalid' do
      shared_examples 'no error' do
        it 'does not raise an error' do
          expect { PostDestroyer.new(object) }.to_not raise_error
        end
      end


      context 'when object is blog' do
        let(:object){ FactoryGirl.create :blog }


        it_behaves_like 'no error'
      end


      context 'when object is recipe' do
        let(:object){ FactoryGirl.create :recipe }


        it_behaves_like 'no error'
      end


      context 'when object is review' do
        let(:object){ FactoryGirl.create :review }


        it_behaves_like 'no error'
      end
    end


    context 'when object is invalid' do
      let(:object){ FactoryGirl.create :user }


      it 'raises an error' do
        expect { PostDestroyer.new(object) }.to raise_error
      end
    end
  end


  describe '#destroy' do
    shared_examples 'log deleted object' do
      it {
        expect(Post.where(:id => object.id, :type => object.type).first).
          to be nil
      }
      it { expect(Activity.last.trackable_id).to eq object.id }
      it { expect(Activity.last.trackable_type).to eq object.type }
    end


    context 'when object is blog' do
      let(:object){ FactoryGirl.create :blog }
      let(:destroyer){ PostDestroyer.new(object) }


      before do
        destroyer.destroy
      end


      it { expect(Activity.last.action).to eq Activity::ACTION::DESTROY }


      it_behaves_like 'log deleted object'
    end


    context 'when object is recipe' do
      let(:object){ FactoryGirl.create :recipe }
      let(:destroyer){ PostDestroyer.new(object) }


      before do
        destroyer.destroy
      end


      it_behaves_like 'log deleted object'
    end


    context 'when object is review' do
      let(:object){ FactoryGirl.create :review }
      let(:destroyer){ PostDestroyer.new(object) }


      before do
        destroyer.destroy
      end


      it_behaves_like 'log deleted object'
    end
  end

end
