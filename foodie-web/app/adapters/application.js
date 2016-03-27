import Ember from 'ember';
import ActiveModelAdapter from 'active-model-adapter';
import ENV from 'foodie-web/config/environment';

export default ActiveModelAdapter.extend({

  namespace: 'api',
  host: ENV.APP.HOST,
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
