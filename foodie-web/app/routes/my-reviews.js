import Ember from 'ember';
import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin';
import MyPostableWithSidebar from '../mixins/my-postable-with-sidebar';

export default Ember.Route.extend(AuthenticatedRouteMixin, MyPostableWithSidebar, {

  _type: 'review',

  _route: 'my_reviews'

});
