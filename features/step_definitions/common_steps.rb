Before do
  $queries_executed = []
<<<<<<< HEAD
<<<<<<< HEAD
  ThinkingSphinx::Deltas::SidekiqDelta.clear!
=======
  ThinkingSphinx::Deltas::ActiveJobDelta.clear!
>>>>>>> c3e53d5... Round 1
=======
>>>>>>> 5047362... Get rid of Queue clearing
  @model      = nil
  @method     = :search
  @query      = ""
  @conditions = {}
  @with       = {}
  @without    = {}
  @with_all   = {}
  @options    = {}
  @results    = nil
end

Given "Sphinx is running" do
  ThinkingSphinx::Configuration.instance.controller.should be_running
end

Given /^I am searching on (.+)$/ do |model|
  @model = model.gsub(/\s/, '_').singularize.camelize.constantize
end

Given "I have data" do
  DelayedBeta.create(:name => "one")
  DelayedBeta.create(:name => "two")
  DelayedBeta.create(:name => "three")
  DelayedBeta.create(:name => "four")
  DelayedBeta.create(:name => "five")
  DelayedBeta.create(:name => "six")
  DelayedBeta.create(:name => "seven")
  DelayedBeta.create(:name => "eight")
  DelayedBeta.create(:name => "nine")
  DelayedBeta.create(:name => "ten")
end

Given "I have indexed" do
<<<<<<< HEAD
<<<<<<< HEAD
  ThinkingSphinx::Deltas::SidekiqDelta.clear!
=======
  ThinkingSphinx::Deltas::ActiveJobDelta.clear!
>>>>>>> c3e53d5... Round 1
=======
>>>>>>> 5047362... Get rid of Queue clearing
  ThinkingSphinx::Configuration.instance.controller.index
  sleep(1.5)
end

Given "I have data and it has been indexed" do
  step "I have data"
  step "I have indexed"
end

When "I wait for Sphinx to catch up" do
  sleep(0.5)
end

When /^I search for (\w+)$/ do |query|
  @results = nil
  @query = query
end

Then /^I should get (\d+) results?$/ do |count|
  results.length.should == count.to_i
end

Then /^I debug$/ do
  debugger
  0
end

def results
  @results ||= (@model || ThinkingSphinx).send(
    @method,
    @query,
    @options.merge(
      :conditions => @conditions,
      :with       => @with,
      :without    => @without,
      :with_all   => @with_all
    )
  )
end
