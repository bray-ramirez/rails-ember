import Ember from 'ember';
import EmberValidations from 'ember-validations';

export default Ember.Mixin.create(EmberValidations, {

  sortProperties: ['created_at:desc'],
  sortedRecord: Ember.computed.sort('model', 'sortProperties'),

  isNewFormVisible: false,

  showErrors: false,

  bufferedAttributes: function(){
    return {
      title: '',
      content: '',
      visible: false
    };
  }.property('bufferedAttributes'),

  validations: {
    'bufferedAttributes.title': {
      presence: true
    }
  },

  actions: {
    createRecord: function(){
      var _this = this;

      this.validate().then(function(){
        var data = {},
            attributes = _this.get('bufferedAttributes');

        for (var key in attributes){
          if (attributes.hasOwnProperty(key)){
            data[key] = attributes[key];
          }
        }

        var post = _this.store.createRecord(_this.get('_model'), data);

        post.save().then(function(){
          _this.store.unloadAll('activity');
          _this.store.findAll('activity');

          _this.send('_hideAndClearForm');
        }).catch(function(response){
          for (var attr of ['title']){
            var errors = post.get('errors.' + attr);

            if (errors === null || errors === undefined){ continue; }

            var message = errors[0]['message'];

            _this.set('errors.bufferedAttributes.' + attr, message);
            _this.set('showErrors', true);
          }

          // Remove temporary record
          _this.store.unloadRecord(post);
        });
      }).catch(function(){
        _this.set('showErrors', true)
      });
    },

    showForm: function(){
      this.set('isNewFormVisible', true);
    },

    hideForm: function(){
      this.send('_hideAndClearForm');
    },

    _hideAndClearForm: function(){
      this.set('bufferedAttributes', {
        title: '',
        content: '',
        visible: false
      });

      this.set('isNewFormVisible', false);
    }
  }

});
