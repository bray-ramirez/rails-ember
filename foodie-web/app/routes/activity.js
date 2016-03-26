import Ember from 'ember';

export default Ember.Route.extend({

  model: function(){
    this.store.unloadAll('activity');

    return this.store.findAll('activity');
  }

});
