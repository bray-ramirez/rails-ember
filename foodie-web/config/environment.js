/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'foodie-web',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  ENV['ember-simple-auth'] = {
    routeAfterAuthentication: 'activity',
    routeIfAlreadyAuthenticated: 'activity',
    authorizer: 'authorizer:devise'
  }


  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
    ENV.APP.HOST = 'http://localhost:3000'
    ENV.APP.DEVISE_END_POINT = 'http://localhost:3000/api/login'
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {
    ENV.APP.HOST = 'https://pure-waters-41744.herokuapp.com/'
    ENV.APP.DEVISE_END_POINT = 'https://pure-waters-41744.herokuapp.com/api/login'
  }

  return ENV;
};
