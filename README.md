## TestingBot - Ruby Cucumber

TestingBot provides an online grid of browsers and mobile devices to run Automated tests via Selenium WebDriver.
This example demonstrates how to use Ruby with Cucumber to run a test in parallel, across several browsers in the TestingBot cloud.

### Environment Setup

1. Global Dependencies
    * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
    * Or Install Ruby with [Homebrew](https://brew.sh)
    ```
    $ brew install ruby
    ```
    * Install [Rake](http://docs.seattlerb.org/rake/)
    ```
    $ gem install rake
    ```
    * Install bundler (sudo may be necessary)
    ```
    $ gem install bundler
    ```

2. TestingBot Credentials
    * Add your TestingBot Key and Secret as environmental variables. You can find these in the [TestingBot Dashboard](https://testingbot.com/members).
    ```
    $ export TB_KEY=<your TestingBot Key>
    $ export TB_SECRET=<your TestingBot Secret>
    ```

3. Project Dependencies
    * Install packages (Use sudo if required)
    ```
    $ bundle install
    ```

### Running Tests

* Tests in Parallel:
    ```
    $ bundle exec rake test_testingbot
    ```
You will see the test result in the [TestingBot Dashboard](https://testingbot.com/members)

### Resources
##### [TestingBot Documentation](https://testingbot.com/support/)

##### [SeleniumHQ Documentation](https://www.selenium.dev/documentation)

##### [Cucumber Documentation](https://cucumber.io/docs/reference)

##### [Ruby Documentation](https://ruby-doc.org/)
