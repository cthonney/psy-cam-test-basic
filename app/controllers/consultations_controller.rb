require 'faraday'
require 'faraday/net_http'
require 'date'
# require 'pry-byebug'
Faraday.default_adapter = :net_http

class ConsultationsController < ApplicationController
  before_action :set_consultation, only: %i[ show edit update destroy ]

  # GET /consultations
  def index
    @consultations = Consultation.all
  end

  # GET /consultations/1
  def show
    @room_link = @consultation.room_link
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
    @consultation.room_link = create_room
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
    params.require(:consultation).permit(:psy, :specialties, :room_url)
  end

  def create_room
    res = Faraday.post "https://api.daily.co/v1/rooms/" do |req|
      req.body = { properties: { enable_chat: true, enable_people_ui: false, enable_pip_ui: true }}.to_json
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = 'Bearer 2c4c1fe6ffda1be878ba3c870d9112ab328210186ad230755c003c6973e9fa12'
    end
    return JSON.parse(res.body)["url"] if res.status == 200
  end

end
