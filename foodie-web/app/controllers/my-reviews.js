import Ember from 'ember';

export default Ember.Controller.extend({

  header: 'Reviews',

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

      var review = this.store.createRecord('review', data);

      review.save().then(function(){
        _this.store.unloadAll('activity');
        _this.store.findAll('activity');
      });
    }
  }

});
