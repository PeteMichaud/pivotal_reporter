module PublicTracker
  class ApplicationController < ActionController::Base

    PivotalTracker::Client.token = PivotalReporter::Engine.config.token

    def pivotal_project
      PivotalTracker::Project.find(PivotalReporter::Engine.config.project_id)
    end

    def pivotal_unique_label
      "pivotal_reporter_#{PivotalReporter::Engine.config.project_id}"
    end

  end

end
