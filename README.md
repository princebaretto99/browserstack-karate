![Logo](https://www.browserstack.com/images/static/header-logo.jpg)
# Integrating Karate <a href="https://github.com/karatelabs/karate/tree/master/karate-core"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Karate_software_logo.svg/1200px-Karate_software_logo.svg.png" alt="Node.js" height="22" /></a> with BrowserStack <a href="https://browserstack.com"><img src="https://www.browserstack.com/blog/favicon.png" alt="Node.js" height="22" /></a>

## Introduction

Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

## Integration with BrowserStack

Add the below snippet with your capabilities
```
    * def session = { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESSKEY"} }
    
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }
```
Note: Capabilities can be generated using : https://www.browserstack.com/automate/capabilities


