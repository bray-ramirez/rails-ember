import Ember from 'ember';
import DS from 'ember-data';

var underscore = Ember.String.underscore;

import { ActiveModelSerializer } from 'active-model-adapter';

// export default DS.JSONAPISerializer.extend({
export default ActiveModelSerializer.extend({
  // keyForAttribute: function(attr){
  //   return underscore(attr);
  // }
});
