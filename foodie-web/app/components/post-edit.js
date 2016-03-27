import Ember from 'ember';

export default Ember.Component.extend({

  actions: {
    updateRecord: function(){
      this.get('onUpdate')();
    },

    cancelUpdate: function(){
      this.get('onCancel')();
    }
  }

});
