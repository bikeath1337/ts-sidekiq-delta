class ThinkingSphinx::Deltas::SidekiqDelta::FlagAsDeletedJob < ActiveJob::Base
  queue_as :ts_delta

  def perform(index, document_id)
    puts "PERFORM FLAG DELETED AS JOB"
    ThinkingSphinx::Deltas::DeleteJob.new(index, document_id).perform
  rescue Mysql2::Error => error
    # This isn't vital, so don't raise the error
  end
end
