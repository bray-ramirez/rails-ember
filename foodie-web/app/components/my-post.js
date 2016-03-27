import Ember from 'ember';

export default Ember.Component.extend({

  isNewFormVisible: false,

  actions: {
    createRecord: function(){
      this.get('onCreate')();
    },

    showForm: function(){
      this.get('onShowForm')();
    },

    hideForm: function(){
      this.get('onHideForm')();
    }
  }

});
