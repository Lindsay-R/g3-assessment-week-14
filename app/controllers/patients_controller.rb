class PatientsController < ApplicationController
  def show
    @patient = Patient.find(params[:id])
    @medications = Medication.order(:name)
    @prescriptions = Prescription.all
  end

  def new
    @patient = Patient.new
  end


end