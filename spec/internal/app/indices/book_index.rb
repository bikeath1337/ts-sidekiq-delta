<<<<<<< HEAD
ThinkingSphinx::Index.define :book, :with => :active_record, :delta => ThinkingSphinx::Deltas::SidekiqDelta do
=======
ThinkingSphinx::Index.define :book, :with => :active_record, :delta => ThinkingSphinx::Deltas::ActiveJobDelta do
>>>>>>> c3e53d5... Round 1
  indexes title, author
end
