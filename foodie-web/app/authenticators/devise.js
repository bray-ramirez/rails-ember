import Devise from 'ember-simple-auth/authenticators/devise';

export default Devise.extend({
  serverTokenEndpoint: 'http://localhost:3000/api/login',
  tokenAttributeName: 'auth_token'
});
