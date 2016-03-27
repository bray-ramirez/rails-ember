import Ember from 'ember';

export default Ember.Component.extend({
  session: Ember.inject.service('session'),

  isOwner: Ember.computed(function(){
    var session = this.get('session'),
        details = session.get('data').authenticated;

    return this.get('model.user_id') === details.id;
  }),

  actions: {
    showForm: function(){
      this.get('onShowForm')();
    },

    deleteRecord: function(){
      this.get('onDelete')();
    }
  }
});
