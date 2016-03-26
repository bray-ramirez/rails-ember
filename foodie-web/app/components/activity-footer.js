import Ember from 'ember';

export default Ember.Component.extend({

  session: Ember.inject.service('session'),

  isViewable: Ember.computed(function(){
    var session = this.get('session'),
        details = session.get('data').authenticated;

    if (!this.get('activity.is_active')) return false;
    if (this.get('activity.is_visible')) return true;

    return this.get('activity.user_id') === details.id;
  })

});
