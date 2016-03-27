import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    showForm: function(){
      this.get('onShowForm')();
    }
  }

});
