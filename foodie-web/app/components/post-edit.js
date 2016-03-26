import Ember from 'ember';

export default Ember.Component.extend({

  bufferedAttributes: function(){
    return {
      title: this.get('model.title'),
      content: this.get('model.content'),
      visible: this.get('model.visible')
    };
  }.property('bufferedAttributes'),

  actions: {
    updateRecord: function(){
      var model = this.get('model'),
          attributes = this.get('bufferedAttributes');

      for (var key in attributes){
        if (attributes.hasOwnProperty(key)){
          model.set(key, attributes[key]);
        }
      }

      this.get('onUpdate')();
    },

    cancelUpdate: function(){
      this.get('onCancel')();
    }
  }

});
