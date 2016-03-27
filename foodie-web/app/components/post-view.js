import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    updateRecord: function(){
      this.get('onUpdate')();
    },

    deleteRecord: function(){
      this.get('onDelete')();
    },

    showForm: function(){
      this.get('onShowForm')();
    },

    hideForm: function(){
      this.get('onHideForm')();
    }
  }

});
