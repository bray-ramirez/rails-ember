import DS from 'ember-data';

export default DS.Model.extend({
  action: DS.attr('string'),
  trackable_id: DS.attr('number'),
  trackable_type: DS.attr('string'),
  created_at: DS.attr('date')
});
