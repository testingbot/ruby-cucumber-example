Given /^I am on (.+)$/ do |url|
	@browser.navigate.to "https://testingbot.com"
end

Then /^I should see title "([^"]*)"$/ do |title|
	expect(@browser.title).to eq title
end
