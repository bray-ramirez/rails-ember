import Ember from 'ember';

export default Ember.Controller.extend({

  header: 'Blogs',

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

      var blog = this.store.createRecord('blog', data);

      blog.save().then(function(blog){
        _this.store.unloadAll('activity');
        _this.store.findAll('activity');
      });
    }
  }

});
