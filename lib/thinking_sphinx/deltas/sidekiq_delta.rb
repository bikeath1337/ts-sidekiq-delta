require 'thinking_sphinx'

class ThinkingSphinx::Deltas::SidekiqDelta < ThinkingSphinx::Deltas::DefaultDelta
  def delete(index, instance)
    puts "Deleting #{index} in background"
    ThinkingSphinx::Deltas::SidekiqDelta::FlagAsDeletedJob.perform_later(
      index.name, index.document_id_for_key(instance.id)
    )
  end

  def index(index)
    puts "INDEXING #{index} in background"
    ThinkingSphinx::Deltas::SidekiqDelta::DeltaJob.perform_later(index.name)
  end
end

require 'thinking_sphinx/deltas/sidekiq_delta/delta_job'
require 'thinking_sphinx/deltas/sidekiq_delta/flag_as_deleted_job'
