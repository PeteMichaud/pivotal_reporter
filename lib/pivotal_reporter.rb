require "pivotal_reporter/engine"
require 'pivotal-tracker'

module PivotalReporter
  class Engine < Rails::Engine

    initializer "pivotal_reporter.configure_rails_initialization" do |app|
      # Engine configures Rails app here, this is not what my question was about
    end

  end

  # This is what I was trying to figure out
  def self.config(&block)
    @@config ||= Engine::Configuration.new

    yield @@config if block

    return @@config
  end
end
