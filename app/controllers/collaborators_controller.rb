class CollaboratorsController < ApplicationController
  def index
    @collaborators = Wiki.find(params[:wiki_id]).collaborators
  end

  def create
    # Waht needs to be accomplished?
    Collaborator.create(params[:collaborator].permit!)
    redirect_to :back
  end

end
