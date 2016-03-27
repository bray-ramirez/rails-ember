import Ember from 'ember';
import PostableWithSidebarMixin from 'foodie-web/mixins/postable-with-sidebar';
import { module, test } from 'qunit';

module('Unit | Mixin | postable with sidebar');

// Replace this with your real tests.
test('it works', function(assert) {
  let PostableWithSidebarObject = Ember.Object.extend(PostableWithSidebarMixin);
  let subject = PostableWithSidebarObject.create();
  assert.ok(subject);
});
