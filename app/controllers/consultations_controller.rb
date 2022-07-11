class ConsultationsController < ApplicationController
  before_action :set_consultation, only: %i[ show edit update destroy ]

  # GET /consultations
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1
  def show
  end

  # GET /consultations/new
  def new
    @consultation = Consultation.new
  end

  # GET /consultations/1/edit
  def edit
  end

  # POST /consultations
  def create
    @consultation = Consultation.new(consultation_params)

    if @consultation.save
      redirect_to @consultation, notice: "Consultation was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consultations/1
  def update
    if @consultation.update(consultation_params)
      redirect_to @consultation, notice: "Consultation was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /consultations/1
  def destroy
    @consultation.destroy
    redirect_to consultations_url, notice: "Consultation was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consultation
      @consultation = Consultation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consultation_params
      params.require(:consultation).permit(:psy, :specialties)
    end
end
