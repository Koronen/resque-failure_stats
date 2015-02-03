require 'resque/server'

module Resque
  module Plugins
    module FailureStats
      # Server for handling the failure stats tab.
      module Server
        VIEW_PATH = File.join(File.dirname(__FILE__), 'views')

        class << self
          def registered(app)
            app.get '/failure_stats' do
              failures = Resque::Failure.all(0, -1).each_with_index.map { |ex, i| ex['id'] = i; ex }
              @fbe = Hash.new { |h, k| h[k] = Array.new }
              @fbc = Hash.new { |h, k| h[k] = Array.new }
              failures.each { |ex| @fbe[ex['exception']] << ex; @fbc[ex['payload']['class']] << ex }
              erb(File.read(File.join(VIEW_PATH, 'failure_stats.erb')))
            end

            app.tabs << 'Failure_Stats'
          end
        end
      end
    end
  end
end

Resque::Server.register Resque::Plugins::FailureStats::Server
