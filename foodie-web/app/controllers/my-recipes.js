import Ember from 'ember';
import MyPosts from '../mixins/my-posts';

export default Ember.Controller.extend(MyPosts, {

  header: 'Recipes',

  _model: 'recipe'

});
