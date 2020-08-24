# A simple job class that processes a given index.
#
class ThinkingSphinx::Deltas::SidekiqDelta::DeltaJob < ActiveJob::Base
  # Runs Sphinx's indexer tool to process the index.
  #
  # @param [String] index the name of the Sphinx index
  #
  def perform(index)
    puts "PERFORM INDEX AS JOB"
    ThinkingSphinx::Deltas::IndexJob.new(index).perform
  end
end
