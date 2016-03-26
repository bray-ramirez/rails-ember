import Ember from 'ember';

export default Ember.Route.extend({

  model: function(params){
    console.log(params);

    return Ember.RSVP.hash({
      post: this.store.find('blog', params.id),
      activities: this.store.findAll('activity')
    });
  },

  setupController: function(controller, model){
    this.set('post', model.post);
    this.set('activities', model.activities);

    controller.set('model', model.post);
  },

  renderTemplate: function(){
    this.render();
    this.render('activity', {
      into: 'blog',
      outlet: 'sidebar',
      model: this.get('activities')
    });
  },

  templateName: 'post',
  controllerName: 'post'

});
