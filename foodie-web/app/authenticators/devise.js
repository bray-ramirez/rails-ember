import Devise from 'ember-simple-auth/authenticators/devise';
import ENV from 'foodie-web/config/environment';

export default Devise.extend({
  serverTokenEndpoint: ENV.APP.DEVISE_END_POINT,
  tokenAttributeName: 'auth_token'
});
