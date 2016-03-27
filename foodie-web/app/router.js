import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('activity', { path: '/' });
  this.route('login', { path: '/login' });
  this.route('blog', { path: '/blogs/:id' });
  this.route('recipe', { path: '/recipes/:id' });
  this.route('review', { path: '/reviews/:id' });
  this.route('my_blogs');
  this.route('my_reviews');
  this.route('my_recipes');
  this.route('user', { path: '/users' });
  this.route('404');
  this.route('500');
  this.route('invalid', { path: '/*path' });
});

export default Router;
