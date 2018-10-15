Given /^I am on (.+)$/ do |url|
	@browser.navigate.to "http://www.google.com/ncr"
end
 
When /^I fill in "([^"]*)" found by "([^"]*)" with "([^"]*)"$/ do |value, type, keys|
	@browser.find_element(name: 'q').send_keys keys
end
 
When /^I submit$/ do
	@browser.find_element(name: 'q').send_key(:return)
	sleep 1
end
 
Then /^I should see title "([^"]*)"$/ do |title|
	expect(@browser.title).to eq title
end