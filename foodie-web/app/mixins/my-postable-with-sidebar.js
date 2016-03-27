import Ember from 'ember';

export default Ember.Mixin.create({

  model: function(){
    var type = this.get('_type');

    this.store.unloadAll(type);

    return Ember.RSVP.hash({
      posts: this.store.findAll(type),
      activities: this.store.findAll('activity')
    });
  },

  setupController: function(controller, model){
    this.set('posts', model.posts);
    this.set('activities', model.activities);

    controller.set('model', model.posts);
  },

  renderTemplate: function(){
    this.render();
    this.render('activity', {
      into: this.get('_route'),
      outlet: 'sidebar',
      model: this.get('activities')
    });
  },

  templateName: 'my-posts'

});
