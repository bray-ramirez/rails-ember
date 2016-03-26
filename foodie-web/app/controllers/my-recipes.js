import Ember from 'ember';

export default Ember.Controller.extend({

  header: 'Recipes',

  sortProperties: ['created_at:desc'],
  sortedRecord: Ember.computed.sort('model', 'sortProperties'),

  actions: {
    createRecord: function(attributes){
      var _this = this,
          data = {};

      for (var key in attributes){
        if (attributes.hasOwnProperty(key)){
          data[key] = attributes[key];
        }
      }

      var recipe = this.store.createRecord('recipe', data);

      recipe.save().then(function(){
        _this.store.unloadAll('activity');
        _this.store.findAll('activity');
      });
    }
  }

});
