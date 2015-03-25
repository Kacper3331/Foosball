Given(/^I am on Home Page$/) do
  visit "/"
end

Then(/^I should see "(.*?)"$/) do |content|
  expect(page).to have_content(content)
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |element, value|
  fill_in element, with: value
end

When(/^I press "(.*?)"$/) do |button|
  click_on button
end

Given(/^there's a player with email: "(\S+)" and password: "(.*?)"$/) do |email, password|
  @player = FactoryGirl.create(:player, email: email, password: password)
end

Given(/^I sign in using email: "(\S+)" and password: "(.*?)"$/) do |email, password| 
  @player = FactoryGirl.create(
    :player,
    email: email,
    password: password,
    firstname: "Jan",
    lastname: "Nowak"
  )
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign in'
end

When(/^I press link: "(.*?)"$/) do |logout|
  click_link "#{logout}"
end

Given(/^I am on "(.*?)" page$/) do |sign_up|
  visit "/"
  click_on sign_up
end

Given(/^I am new player/) do
  FactoryGirl.build(:player)
end

