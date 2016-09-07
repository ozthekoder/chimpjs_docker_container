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

  seleniumStandaloneOptions: {
    version: '2.53.1',
    baseURL: 'https://selenium-release.storage.googleapis.com',
    drivers: {
      chrome: {
        version: '2.23',
        arch: process.arch,
        baseURL: 'https://chromedriver.storage.googleapis.com'
      },
    }
  },
};
