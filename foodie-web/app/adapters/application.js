import Ember from 'ember';
import DS from 'ember-data';
import ActiveModelAdapter from 'active-model-adapter';

// export default DS.JSONAPIAdapter.extend({
export default ActiveModelAdapter.extend({

  namespace: 'api',
  host: 'http://localhost:3000',
  session: Ember.inject.service('session'),

  headers: Ember.computed('session', function(){
    var session = this.get('session'),
        details = session.get('data').authenticated;

    if (details.auth_token === undefined || details.email === undefined) {
      return {};
    }

    return {
      'X-Authorization-Token': details.auth_token,
      'X-Authorization-Email': details.email
    };
  })

});
