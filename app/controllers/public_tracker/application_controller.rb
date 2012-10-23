module PublicTracker
  class ApplicationController < ActionController::Base

    PivotalTracker::Client.token = PublicTracker::Engine.config.token

    def pivotal_project
      PivotalTracker::Project.find(PublicTracker::Engine.config.project_id)
    end

    def pivotal_unique_label
      "public_tracker_#{PublicTracker::Engine.config.project_id}"
    end

  end

end
