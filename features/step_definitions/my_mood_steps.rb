Given /^the following moods exist:$/ do |table|
  table.hashes.each do |mood_point|
    MoodPoint.create!(mood_point)
  end
end

Then /^I should see a graph$/ do
#puts page.html
    page.html.include?("1B").should == true
end
