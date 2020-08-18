When /^I run the smart indexer$/ do
<<<<<<< HEAD
  ThinkingSphinx::Deltas::SidekiqDelta::CoreIndex.new.smart_index(:verbose => false)
=======
  ThinkingSphinx::Deltas::ActiveJobDelta::CoreIndex.new.smart_index(:verbose => false)
>>>>>>> c3e53d5... Round 1
end
