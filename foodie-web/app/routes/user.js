import Ember from 'ember';

export default Ember.Route.extend({

  session: Ember.inject.service('session'),

  model: function(){
    return this.store.findAll('user');
  },

  beforeModel: function(){
    var session = this.get('session'),
        details = session.get('data').authenticated;

    if (details.admin){ return; }

    this.transitionTo('activity');
  }

});
