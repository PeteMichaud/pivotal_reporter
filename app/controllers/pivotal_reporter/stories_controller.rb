require_dependency "pivotal_reporter/application_controller"

module PivotalReporter
  class StoriesController < ApplicationController
    def index
      @stories = pivotal_project.stories.all(label: pivotal_unique_label)
    end

    def show
      @story = pivotal_project.stories.find(params[:id])
    end

    def new
      @pivotal_unique_label = pivotal_unique_label
    end
  
    def create
      story = PivotalTracker::Story.new(params[:story]).create

      if story.errors.count > 0
        flash[:error] = "Report Submission Failed: #{story.errors}"
      else
        flash[:success] = 'Report Submitted!'
      end

      redirect_to new_story_path
    end

    def accept
      @story = pivotal_project.stories.find(params[:id])
      @story.update({current_state: 'accepted'})

      redirect_to stories_path
    end

    def reject
      @story = pivotal_project.stories.find(params[:id])
      @story.update({current_state: 'rejected'})
      @story.notes.create(:text => URI.decode(params[:reject_message]))

      redirect_to stories_path
    end


  end
end
