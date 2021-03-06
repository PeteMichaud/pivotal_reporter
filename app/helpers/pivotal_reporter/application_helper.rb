module PivotalReporter
  module ApplicationHelper

    def pivotal_labels
      "#{@pivotal_unique_label}, remote_user_#{requested_by.gsub(' ', '').underscore}"
    end

    def requested_by
      PivotalReporter::Engine.config.request_user || current_user.full_name
    end


  end
end
