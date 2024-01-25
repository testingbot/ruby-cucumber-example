begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'selenium-webdriver'
require 'testingbot'

Before do
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities['version'] = ENV['version']
  capabilities['browserName'] = ENV['browserName']
  capabilities['platform'] = ENV['platform']

  url = "https://#{ENV['TB_KEY']}:#{ENV['TB_SECRET']}@hub.testingbot.com/wd/hub".strip

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 180
  @browser = Selenium::WebDriver.for(:remote, :url => url, :options => capabilities, :http_client => client)
end

After do |test_case|
  sessionid = @browser.session_id
  jobname = test_case.name

  puts "TestingBotSessionId=#{sessionid} job-name=#{jobname}"

  @browser.quit
end
