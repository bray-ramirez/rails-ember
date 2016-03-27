import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    save: function(){
      this.get('onSave')();
    },

    hideForm: function(){
      this.get('onHideForm')();
    }
  }

});
