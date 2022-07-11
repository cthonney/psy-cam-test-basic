class WelcomeController < ApplicationController
  def index
    @consultations = Consultation.all
  end
end
