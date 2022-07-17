# frozen_string_literal: true

require 'rake'
Rails.application.load_tasks

#
# Execute rake task
# <https://github.com/ondrejbartas/sidekiq-cron/issues/133#issuecomment-871310016>
#
class InvokeRakeTaskJob < ApplicationJob
  def perform(args)
    Rake::Task[args['task']].execute(args['args'])
  end
end
