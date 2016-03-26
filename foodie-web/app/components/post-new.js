import Ember from 'ember';

export default Ember.Component.extend({

  bufferedAttributes: function(){
    return {
      title: '',
      content: '',
      visible: false
    }
  }.property('bufferedAttributes'),

  actions: {
    createRecord: function(){
      this.get('onCreate')(this.get('bufferedAttributes'));
    },

    hideNewForm: function(){
      this.get('onHideNewForm')();
    }
  }

});
