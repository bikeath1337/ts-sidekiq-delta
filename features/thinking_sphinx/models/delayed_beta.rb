class DelayedBeta < ActiveRecord::Base
  define_index do
    indexes :name, :sortable => true
<<<<<<< HEAD
    set_property :delta => ThinkingSphinx::Deltas::SidekiqDelta
=======
    set_property :delta => ThinkingSphinx::Deltas::ActiveJobDelta
>>>>>>> c3e53d5... Round 1
  end
end
