import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    delete: function(user){
      this.get('onDelete')(user.get('id'));
    }
  }

});
