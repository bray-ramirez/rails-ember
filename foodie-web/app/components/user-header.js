import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    save: function(){
      this.get('onSave')();
    },

    showForm: function(){
      this.get('onShowForm')();
    },

    hideForm: function(){
      this.get('onHideForm')();
    }
  }

});
