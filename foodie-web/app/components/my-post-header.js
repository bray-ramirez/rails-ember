import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    showNewForm: function(){
      this.get('onShowNewForm')();
    }
  }

});
