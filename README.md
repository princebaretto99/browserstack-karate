![Logo](https://www.browserstack.com/images/static/header-logo.jpg)
# Integrating Karate <a href="https://github.com/karatelabs/karate/tree/master/karate-core"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Karate_software_logo.svg/1200px-Karate_software_logo.svg.png" alt="Node.js" height="22" /></a> with BrowserStack <a href="https://browserstack.com"><img src="https://www.browserstack.com/blog/favicon.png" alt="Node.js" height="22" /></a>

## Introduction

Karate is the only open-source tool to combine API test-automation, mocks, performance-testing and even UI automation into a single, unified framework. The BDD syntax popularized by Cucumber is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

## Integration with BrowserStack

Add the below snippet with your capabilities
```
    * def session = { capabilities: { browserName: 'chrome' }, desiredCapabilities: { "os" : "Windows", "os_version" : "10", "browserName" : "Chrome", "browserstack.user" : "BROWSERSTACK_USERNAME", "browserstack.key" : "BROWSERSTACK_ACCESS_KEY"} }
    
    * configure driver = { type: 'chromedriver', webDriverSession: '#(session)', start: false, webDriverUrl: 'http://hub-cloud.browserstack.com/wd/hub' }
```
Note: Capabilities can be generated using : https://www.browserstack.com/automate/capabilities

## Running one feature on BrowserStack Automate

You can execute anyone of the below tests.
<ul>
    <li><a href="src/test/java/examples/login/LoginRunner.java">LoginRunner.java</a></li>
    <li><a href="src/test/java/examples/favourites/FavouriteRunner.java">FavouriteRunner.java</a></li>
</ul>


## Running one feature on multiple browsers on BrowserStack

In this case we can use the example table and configure individual drivers based on the value of the example table.
Please refer to [multipleBrowser.feature](src/test/java/examples/multipleBrowser/multipleBrowser.feature)

File to be executed: [MulitpleBrowser.java](src/test/java/examples/multipleBrowser/MultipleBrowser.java)

## Running all features in parallel on BrowserStack

In this case, we can use the karate runner and execute all the feature files in a directory as mentioned below:

```
    Results results = Runner.path("classpath:examples").parallel(5);
```
File to be executed: [ExamplesTest.java](src/test/java/examples/ExamplesTest.java)

## Running features using Local Testing on BrowserStack

<b>Note:</b> For this example we will be using [this](https://github.com/browserstack/browserstack-demo-app) demo application for verifying Local Testing. Please refer to the README.md file for steps to set up.

In this case, we can use the `browserstack-local` language bindings to start and stop the Local Instance:

Please refer to [localLogin.feature](src/test/java/examples/localTests/localLogin.feature)<br>
File to be executed: [LocalLoginRunner.java](src/test/java/examples/localTests/LocalLoginRunner.java)



