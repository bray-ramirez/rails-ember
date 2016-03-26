import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';

export default Ember.Route.extend(AuthenticatedRouteMixin, {

  model: function(){
    return Ember.RSVP.hash({
      posts: this.store.findAll('blog'),
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
      into: 'my_blogs',
      outlet: 'sidebar',
      model: this.get('activities')
    });
  },

  templateName: 'my-posts'

});
