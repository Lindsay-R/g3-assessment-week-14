class PrescriptionsController < ApplicationController

  def new
    @patient = Patient.find(params[:patient_id])
    @prescription = Prescription.new
    @medications = Medication.order(:name)
  end

  def create
    date_start = Date.new(
      params[:prescription]["date_start(1i)"].to_i,
      params[:prescription]["date_start(2i)"].to_i,
      params[:prescription]["date_start(3i)"].to_i
    )
    date_end = Date.new(
      params[:prescription]["date_end(1i)"].to_i,
      params[:prescription]["date_end(2i)"].to_i,
      params[:prescription]["date_end(3i)"].to_i
    )


    @prescription = Prescription.new(

      dosage: params[:prescription][:dosage],
      schedule: params[:prescription][:schedule],
      date_start: date_start,
      date_end: date_end,
      patient_id: params[:patient_id],
      medication_id: params[:medication_id]
    )


    if @prescription.save
      redirect_to root_path

      flash[:notice]= "Prescription was created successfully!"

    else
      @patient = Patient.find(params[:patient_id])
      @prescription.errors[:base] << "Your prescription could not be created"
      render :new
    end
  end

end