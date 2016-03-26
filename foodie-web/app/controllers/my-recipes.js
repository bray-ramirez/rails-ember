import Ember from 'ember';

export default Ember.Controller.extend({

  header: 'Recipes',

  sortProperties: ['created_at:desc'],
  sortedRecord: Ember.computed.sort('model', 'sortProperties'),

  actions: {
    createRecord: function(attributes){
      var data = {};

      for (var key in attributes){
        if (attributes.hasOwnProperty(key)){
          data[key] = attributes[key];
        }
      }

      var blog = this.store.createRecord('recipe', data);

      blog.save();
    }
  }

});
