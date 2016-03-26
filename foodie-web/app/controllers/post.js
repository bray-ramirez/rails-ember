import Ember from 'ember';

export default Ember.Controller.extend({

  actions: {
    updateRecord: function(){
      var _this = this,
          type = this.get('model.type'),
          id = this.get('model.id');

      this.store.findRecord(type, id).then(function(post){
        post.set('title', _this.get('model.title'));
        post.set('content', _this.get('model.content'));

        post.save();
      });
    },

    deleteRecord: function(){
      var _this = this,
          type = this.get('model.type'),
          id = this.get('model.id');

      this.store.findRecord(type, id).then(function(post){
        post.destroyRecord().then(function(){
          _this.transitionToRoute('activity');
        });
      });
    }
  }

});
