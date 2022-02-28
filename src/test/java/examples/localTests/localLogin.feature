Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * def startLocal = 
      """
      function(){
        var BStackRunner = Java.type('examples.localTests.BStackRunner');
        return BStackRunner.startLocal()
        }
      """
    * def bsLocal = call startLocal
    * def session = { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "build" : "Karate Examples" , "name" : "Karate Local Test" , "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESS_KEY", "browserstack.local": "true"} }
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }



  Scenario: Login to BstackDemo website.

    Given driver 'http://localhost:3000/signin'
    And input('input[id=react-select-2-input]',["fav_user",Key.ENTER])
    And input('input[id=react-select-3-input]',["testingisfun99", Key.ENTER])
    And click('button[id=login-btn]')
    And match driver.title == 'StackDemo'
    * def markTest = 
    """
    function(){
      var BStackRunner = Java.type('examples.localTests.BStackRunner');
      var bStack = new BStackRunner();
      return bStack.markTestStatus(driver)
      }
    """
    * def results = call markTest
    Then print results
     * def stopLocal = 
      """
      function(){
        var BStackRunner = Java.type('examples.localTests.BStackRunner');
        return BStackRunner.stopLocal()
        }
      """
    * def bsLocal = call stopLocal
