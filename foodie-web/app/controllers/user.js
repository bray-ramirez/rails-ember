import Ember from 'ember';
import EmberValidations, { validator } from 'ember-validations';

export default Ember.Controller.extend(EmberValidations, {

  sortProperties: ['name:asc'],
  sortedUsers: Ember.computed.sort('model', 'sortProperties'),

  isNewFormVisible: false,

  showErrors: false,

  userAttributes: function(){
    return {
      name: '',
      email: '',
      password: '',
      password_confirmation: ''
    };
  }.property('userAttributes'),

  validations: {
    'userAttributes.name': {
      presence: true
    },
    'userAttributes.email': {
      presence: true
    },
    'userAttributes.password': {
      presence: true,
      length: {
        minimum: 8,
        maximum: 72
      }
    },
    'userAttributes.password_confirmation': {
      presence: true,
      inline: validator(function(){
        if (this.get('userAttributes.password') !== this.get('userAttributes.password_confirmation')){
          return 'does not match password';
        }
      })
    }
  },

  actions: {
    save: function(){
      var _this = this;

      this.validate().then(function(){
        var data = {},
            attributes = _this.get('userAttributes');

        for (var key in attributes){
          if (attributes.hasOwnProperty(key)){
            data[key] = attributes[key];
          }
        }

        var user = _this.store.createRecord('user', data);

        user.save().then(function(){
          _this.send('_hideAndClearForm');
        }).catch(function(response){
          for (var attr of ['name', 'email', 'password', 'password_confirmation']){
            var errors = user.get('errors.' + attr);

            if (errors === null || errors === undefined){ continue; }

            var message = errors[0]['message'];

            _this.set('errors.userAttributes.' + attr, message);
            _this.set('showErrors', true);
          }

          // Remove temporary record
            _this.store.unloadRecord(user);
        });
      }).catch(function(){
        _this.set('showErrors', true);
      });
    },

    delete: function(id){
      var _this = this;

      this.store.findRecord('user', id).then(function(user){
        user.destroyRecord();
      });
    },

    showForm: function(){
      this.set('isNewFormVisible', true);
    },

    hideForm: function(){
      this.send('_hideAndClearForm');
    },

    _hideAndClearForm: function(){
      this.set('userAttributes', {
        name: '',
        email: '',
        password: '',
        password_confirmation: ''
      });

      this.set('isNewFormVisible', false);
    }
  }

});
