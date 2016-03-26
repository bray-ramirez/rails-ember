import Ember from 'ember';

export default Ember.Route.extend({

  model: function(params){
    return this.store.find('blog', params.id);
  },

  templateName: 'post',
  controllerName: 'post'

});
