import Ember from 'ember';

export default Ember.Component.extend({

  hasError: false,

  hasErrorClass: '',

  _setHasError: function(){
    var errors = this.get('errors');

    if (errors === null || errors === undefined){
      this.set('hasError', false);
      return;
    }

    var hasError = this.get('showErrors') && errors.length > 0,
        errorClass = '';

    this.set('hasError', hasError);
    if (hasError){ errorClass = 'has-error'; }

    this.set('hasErrorClass', errorClass);
  }.observes('showErrors', 'errors'),

});
