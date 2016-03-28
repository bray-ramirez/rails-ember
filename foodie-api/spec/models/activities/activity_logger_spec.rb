require 'rails_helper'

RSpec.describe ActivityLogger do

  describe '#initilize' do
    shared_examples 'no error' do
      it 'does not raise an error' do
        expect { ActivityLogger.new(object, action) }.
          to_not raise_error
      end
    end


    context 'when object is valid' do
      let(:action){ Activity::ACTION::CREATE }


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


    context 'when action is valid' do
      let(:object){ FactoryGirl.create :blog }


      context 'when action is create' do
        let(:action){ Activity::ACTION::CREATE }


        it_behaves_like 'no error'
      end


      context 'when action is update' do
        let(:action){ Activity::ACTION::UPDATE }


        it_behaves_like 'no error'
      end


      context 'when action is destroy' do
        let(:action){ Activity::ACTION::DESTROY }


        it_behaves_like 'no error'
      end
    end


    context 'when object is invalid' do
      let(:object){ FactoryGirl.create :user }


      it 'raises an error' do
        expect { ActivityLogger.new(object, Activity::ACTION::CREATE) }.
          to raise_error
      end
    end


    context 'when action is invalid' do
      let(:object){ FactoryGirl.create :blog }
      let(:invalid_action){ 4 }


      it 'raise an error' do
        expect { ActivityLogger.new(object, invalid_action) }.
          to raise_error
      end
    end
  end


  describe '#log' do

    shared_examples 'trackable' do
      it { expect(Activity.last.trackable).to eq object }
    end


    shared_examples 'actionable' do
      it { expect(Activity.last.action).to eq action }
    end


    context 'when object is blog' do
      let(:blog){ FactoryGirl.create :blog }


      context 'when action is create' do
        let(:logger){ ActivityLogger.new(blog, Activity::ACTION::CREATE) }


        before do
          logger.log
        end


        it_behaves_like 'trackable' do
          let(:object){ blog }
        end


        it_behaves_like 'actionable' do
          let(:action){ Activity::ACTION::CREATE }
        end


        it { expect(Activity.last.user).to eq blog.user }
      end


      context 'when action is update' do
        let(:logger){ ActivityLogger.new(blog, Activity::ACTION::UPDATE) }


        before do
          logger.log
        end


        it_behaves_like 'actionable' do
          let(:action){ Activity::ACTION::UPDATE }
        end
      end


      context 'when action is destroy' do
        let(:logger){ ActivityLogger.new(blog, Activity::ACTION::DESTROY) }


        before do
          logger.log
        end


        it_behaves_like 'actionable' do
          let(:action){ Activity::ACTION::DESTROY }
        end
      end
    end


    context 'when object is review' do
      let(:review){ FactoryGirl.create :review }
      let(:logger){ ActivityLogger.new(review, Activity::ACTION::CREATE) }


      before do
        logger.log
      end


      it_behaves_like 'trackable' do
        let(:object){ review }
      end
    end


    context 'when object is recipe' do
      let(:recipe){ FactoryGirl.create :recipe }
      let(:logger){ ActivityLogger.new(recipe, Activity::ACTION::CREATE) }


      before do
        logger.log
      end


      it_behaves_like 'trackable' do
        let(:object){ recipe }
      end
    end
  end

end
