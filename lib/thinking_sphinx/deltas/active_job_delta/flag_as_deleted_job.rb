class ThinkingSphinx::Deltas::ActiveJobDelta::FlagAsDeletedJob

  # Runs Sphinx's indexer tool to process the index. Currently assumes Sphinx
  # is running.
  sidekiq_options lock: :until_executed, retry: true, queue: 'ts_delta', unique_prefix: "tsflagasdeleted"

  def perform(index, document_id)
    ThinkingSphinx::Deltas::DeleteJob.new(index, document_id).perform
  rescue Mysql2::Error => error
    # This isn't vital, so don't raise the error
  end
end

ThinkingSphinx::Deltas::ActiveJobDelta::JOB_TYPES <<
  ThinkingSphinx::Deltas::ActiveJobDelta::FlagAsDeletedJob
