import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    deleteUser: function(user){
      console.log('deleteUser');
      console.log(user.get('id'));
    }
  }

});
