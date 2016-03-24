import Ember from 'ember';

export default Ember.Controller.extend({
  session: Ember.inject.service('session'),

  actions: {
    authenticate: function(){
      var _this = this;
      var { email, password } = this.getProperties('email', 'password');

      return this.get('session').
        authenticate('authenticator:devise', email, password).
          catch(function(response){
            _this.set("errorMessage", response.message);
          });
    }
  }
});
