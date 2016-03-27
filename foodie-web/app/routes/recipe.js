import Ember from 'ember';
import PostableWithSidebar from '../mixins/postable-with-sidebar';

export default Ember.Route.extend(PostableWithSidebar, {

  _type: 'recipe'

});
