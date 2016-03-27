import Ember from 'ember';
import MyPostsMixin from 'foodie-web/mixins/my-posts';
import { module, test } from 'qunit';

module('Unit | Mixin | my posts');

// Replace this with your real tests.
test('it works', function(assert) {
  let MyPostsObject = Ember.Object.extend(MyPostsMixin);
  let subject = MyPostsObject.create();
  assert.ok(subject);
});
