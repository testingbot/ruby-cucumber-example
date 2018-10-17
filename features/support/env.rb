begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'selenium-webdriver'
require 'testingbot'

Before do | scenario |
  capabilities = Selenium::WebDriver::Remote::Capabilities.new
  capabilities['version'] = ENV['version']
  capabilities['browserName'] = ENV['browserName']
  capabilities['platform'] = ENV['platform']
  capabilities['name'] = "#{scenario.feature.name} - #{scenario.name}"

  url = "https://#{ENV['TB_KEY']}:#{ENV['TB_SECRET']}@hub.testingbot.com/wd/hub".strip

  client = Selenium::WebDriver::Remote::Http::Default.new
  client.open_timeout = 180
  @browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities, :http_client => client)
end

After do | scenario |
  sessionid = @browser.send(:bridge).session_id
  jobname = "#{scenario.feature.name} - #{scenario.name}"

  puts "TestingBotSessionId=#{sessionid} job-name=#{jobname}"

  @browser.quit
  api = TestingBot::Api.new(ENV['TB_KEY'], ENV['TB_SECRET'])
  if scenario.passed?
    api.update_test(sessionid, { :success => true })
  else
    api.update_test(sessionid, { :success => false })
  end
end
