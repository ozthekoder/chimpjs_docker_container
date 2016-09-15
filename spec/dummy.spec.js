
describe('Chimp Mocha', function() {
  describe('Test', function () {
    it('should be able to search stuff', function () {
      browser.url('http://www.google.com');
      expect(browser.getTitle()).to.equal('Google');
      browser.element('#lst-ib').keys('tayyip erdogan');
      browser.element('#lst-ib').keys('Enter');
      browser.waitForVisible('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a', 5000);
      console.log(browser.getText('#rso > div:nth-child(1) > div:nth-child(1) > div > h3 > a'));
    });

    it('should be able to login to gitlab', function () {
      browser.url('http://osmanozdem.ir/users/sign_in');
      browser.waitForVisible('#user_login', 5000)
      browser.element('#user_login').keys('maestro');
      browser.element('#user_password').keys('AllahVarGamYok19');
      browser.click('#new_user > div:nth-child(6) > input');
      browser.url('http://osmanozdem.ir');
      browser.waitForVisible('body > div.page-sidebar-collapsed.page-with-sidebar > div.content-wrapper > div.flash-container > div', 10000);
      expect(browser.getText('body > div.page-sidebar-collapsed.page-with-sidebar > div.content-wrapper > div.flash-container > div')).to.equal('Signed in successfully.');
    });
  });
});
