Then(/^there should be no links$/) do
  expect(page.has_xpath? '//section/ul').to be_true
  expect(page.has_xpath? '//seciton/ul/li').to be_false

end