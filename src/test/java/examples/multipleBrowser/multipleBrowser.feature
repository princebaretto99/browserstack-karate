Feature: sample karate test script

  Scenario Outline: Click on favorites.

    * def data =
      """
      {
      chrome_version_1: { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESSKEY"} },
      chrome_version_2: { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "os" : "Windows", "os_version" : "11", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESSKEY"} }
      }
      """

    * def session = data['<type>']
    Given print session
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }

    Given driver 'https://www.bstackdemo.com/signin'
    And input('input[id=react-select-2-input]',["fav_user",Key.ENTER])
    And input('input[id=react-select-3-input]',["testingisfun99", Key.ENTER])
    And click('button[id=login-btn]')
    And match driver.title == 'StackDemo'
     And retry(10, 1000).waitFor('#favourites').click()
    * def markTest =
      """
      function(){
      var BStackRunner = Java.type('examples.multipleBrowser.BStackRunner');
      var bStack = new BStackRunner();
      return bStack.markTestStatus(driver)
      }
      """
    * def results = call markTest
    Then print results

    Examples:
      | type                  |
      | chrome_version_1      |
      | chrome_version_2      |
