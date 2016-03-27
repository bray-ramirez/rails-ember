import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Controller.extend(EmberValidations, {

  isEditable: false,

  showErrors: false,

  bufferedAttributes: function(){
    return {
      title: this.get('model.title'),
      content: this.get('model.content'),
      visible: this.get('model.visible')
    };
  }.property('bufferedAttributes'),

  _setBufferedAttributes: function(){
    this.set('bufferedAttributes', {
      title: this.get('model.title'),
      content: this.get('model.content'),
      visible: this.get('model.visible')
    });
  }.observes('model'),

  validations: {
    'bufferedAttributes.title': {
      presence: true
    }
  },

  actions: {
    updateRecord: function(){
      var _this = this;

      this.validate().then(function(){
        var id = _this.get('model.id'),
            type = _this.get('model.type');

        _this.store.findRecord(type, id).then(function(post){
          post.set('title', _this.get('bufferedAttributes.title'));
          post.set('content', _this.get('bufferedAttributes.content'));
          post.set('visible', _this.get('bufferedAttributes.visible'));

          post.save().then(function(){
            _this.store.unloadAll('activity');
            _this.store.findAll('activity');

            _this.send('_hideAndResetForm');
          }).catch(function(response){
            for (var attr of ['title']){
              var errors = post.get('errors.' + attr);

              if (errors === null || errors === undefined){ continue; }

              var message = errors[0]['message'];

              _this.set('errors.bufferedAttributes.' + attr, message);
              _this.set('showErrors', true);
            }
          });
        });
      }).catch(function(){
        _this.set('showErrors', true);
      });
    },

    deleteRecord: function(){
      var _this = this,
          type = this.get('model.type'),
          id = this.get('model.id');

      this.store.findRecord(type, id).then(function(post){
        post.destroyRecord().then(function(){
          _this.store.unloadAll('activity');
          _this.store.findAll('activity');

          _this.transitionToRoute('activity');
        });
      });
    },

    showForm: function(){
      this.set('isEditable', true);
    },

    hideForm: function(){
      this.send('_hideAndResetForm');
    },

    _hideAndResetForm: function(){
      this.set('bufferedAttributes', {
        title: this.get('model.title'),
        content: this.get('model.content'),
        visible: this.get('model.visible')
      });

      this.set('isEditable', false);
    }
  }

});
