import Ember from 'ember';

export default Ember.Controller.extend({
  sortProperties: ['created_at:desc'],
  sortedActivities: Ember.computed.sort('model', 'sortProperties')
});
