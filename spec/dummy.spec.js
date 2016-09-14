
describe('Chimp Mocha', function() {
  describe('Google Test', function () {
    it('should be able to search stuff', function () {
      browser.url('http://www.google.com');
      expect(browser.getTitle()).to.equal('Google');
      browser.element('#lst-ib').keys('tayyip erdogan');
      browser.element('#lst-ib').keys('Enter');
      browser.waitForVisible('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a', 50000);
      console.log(browser.getText('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a'));
    });
  });

  describe('Another Test', function () {
    it('should be able to login to gitlab', function () {
      browser.url('http://osmanozdem.ir');
      browser.waitForVisible('#user_login', 50000)
      browser.element('#user_login').keys('maestro');
      browser.element('#user_password').keys('AllahVarGamYok19');
      browser.waitForVisible('body > div.page-sidebar-collapsed.page-with-sidebar > div.content-wrapper > div.container-fluid.container-limited > div > div > div.projects-list-holder > ul > li:nth-child(1) > div.title > a > span > span.project-name.filter-title', 50000);
      expect(browser.getText('body > div.page-sidebar-collapsed.page-with-sidebar > div.content-wrapper > div.container-fluid.container-limited > div > div > div.projects-list-holder > ul > li:nth-child(1) > div.title > a > span > span.project-name.filter-title'))).to.equal('generator-pieces');
    });
  });
});
