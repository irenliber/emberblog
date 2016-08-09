import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType,
  rootURL: config.rootURL
});

Router.map(function() {
  this.route('articles');
  this.route('articles.new', { path: 'articles/new' });

  this.route('/')
});

export default Router;
