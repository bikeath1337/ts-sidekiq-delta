require 'thinking_sphinx'

class ThinkingSphinx::Deltas::ActiveJobDelta < ThinkingSphinx::Deltas::DefaultDelta
  JOB_TYPES  = []
  JOB_PREFIX = 'ts-delta'

  def delete(index, instance)
    return if self.class.locked?(index.reference)

    ThinkingSphinx::Deltas::ActiveJobDelta::FlagAsDeletedJob.perform_async(
      index.name, index.document_id_for_key(instance.id)
    )
  end

  def index(index)
    return if self.class.locked?(index.reference)

    ThinkingSphinx::Deltas::ActiveJobDelta::DeltaJob.perform_later(index.name)
  end
end

require 'thinking_sphinx/deltas/active_job_delta/delta_job'
require 'thinking_sphinx/deltas/active_job_delta/flag_as_deleted_job'
