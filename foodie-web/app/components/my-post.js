import Ember from 'ember';

export default Ember.Component.extend({

  isNewFormVisible: false,

  actions: {
    createRecord: function(attributes){
      this.get('onCreate')(attributes);
      this.set('isNewFormVisible', false);
    },

    showNewForm: function(){
      this.set('isNewFormVisible', true);
    },

    hideNewForm: function(){
      this.set('isNewFormVisible', false);
    }
  }

});
