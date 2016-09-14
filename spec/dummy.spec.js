
describe('Chimp Mocha', function() {
  describe('Page title', function () {
    it('should be set by the Meteor method @watch', function () {
      browser.url('http://www.google.com');
      expect(browser.getTitle()).to.equal('Google');
      browser.element('#lst-ib').keys('tayyip erdogan');
      browser.element('#lst-ib').keys('Enter');
      browser.waitForVisible('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a', 50000);
      console.log(browser.getText('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a'));
    });
  });
});
