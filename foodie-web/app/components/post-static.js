import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),

  isOwner: Ember.computed(function(){
    var session = this.get('session'),
        details = session.get('data').authenticated;

    return this.get('model.user_id') === details.id;
  }),

  actions: {
    postEditable: function(){
      this.get('onEditable')();
    }
  }
});
