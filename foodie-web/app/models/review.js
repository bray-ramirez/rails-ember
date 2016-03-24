import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  content: DS.attr('string'),
  user_id: DS.attr('number'),
  author: DS.attr('string'),
  type: DS.attr('string')
});
