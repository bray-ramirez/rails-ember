import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    createRecord: function(){
      this.get('onCreate')();
    },

    hideForm: function(){
      this.get('onHideForm')();
    }
  }

});
