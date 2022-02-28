Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def session = { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "build" : "Karate Examples" , "name" : "Karate Favourite Test" , "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESS_KEY"} }
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }



  Scenario: Click on favorites.

    Given driver 'https://www.bstackdemo.com/signin'
    And input('input[id=react-select-2-input]',["fav_user",Key.ENTER])
    And input('input[id=react-select-3-input]',["testingisfun99", Key.ENTER])
    And click('button[id=login-btn]')
    And match driver.title == 'StackDemo'
    And retry(10, 1000).waitFor('#favourites').click()
    * def markTest = 
    """
    function(){
      var BStackRunner = Java.type('examples.favourites.BStackRunner');
      var bStack = new BStackRunner();
      return bStack.markTestStatus(driver)
      }
    """
    * def results = call markTest
    Then print results
