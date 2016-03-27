import Ember from 'ember';

export default Ember.Mixin.create({

  model: function(params){
    return Ember.RSVP.hash({
      post: this.store.find(this.get('_type'), params.id),
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
      into: this.get('_type'),
      outlet: 'sidebar',
      model: this.get('activities')
    });
  },

  templateName: 'post',
  controllerName: 'post',

  actions: {
    error: function(error, transition){
      if (error.status === 404){
        this.transitionTo('400');
      }
      else {
        this.transitionTo('500');
      }
    }
  }

});
