import Ember from 'ember';
import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  content: DS.attr('string'),
  user_id: DS.attr('number'),
  author: DS.attr('string'),
  type: DS.attr('string'),
  visible: DS.attr('boolean'),
  created_at: DS.attr('date'),

  isPublished: Ember.computed('visible', function(){
    return this.get('visible') ? '(Published)' : '';
  })
});
