import Ember from 'ember';

export default Ember.Component.extend({
  actions: {
    save: function(){
      this.get('onSave')();
    },

    postViewable: function(){
      this.get('onCancel')();
    },
  }

});
