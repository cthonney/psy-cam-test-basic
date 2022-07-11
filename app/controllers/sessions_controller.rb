class SessionsController < ApplicationController
  def show
    @consultations = Consultation.all
    @clicked = params[:consultation]
  end
end
