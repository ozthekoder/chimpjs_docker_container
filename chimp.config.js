module.exports = {
  path: './spec/',
  chai: true,
  mocha: true,
  mochaTimeout: 200000,
  browser: 'chrome',
  screenshotsOnError: true,
  // - - - - WEBDRIVER-IO  - - - -
  webdriverio: {
    maxInstances: 1,
    desiredCapabilities: {
      perfLoggingPrefs: {
        enableNetwork: true,
        traceCategories: 'v8,blink.console,devtools.timeline,disabled-by-default-devtools.timeline'
      },
      loggingPrefs: {
        // make sure network logging is enabled
        performance: 'ALL'
      }
    }
  },
};
