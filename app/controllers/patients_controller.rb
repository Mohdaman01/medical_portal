class PatientsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_receptionist!
  
    def index
      @patients = Patient.all
    end
  
    def new
      @patient = Patient.new
    end
  
    def create
      @patient = Patient.new(patient_params)
      if @patient.save
        redirect_to patients_path, notice: 'Patient was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @patient = Patient.find(params[:id])
    end
  
    def update
      @patient = Patient.find(params[:id])
      if @patient.update(patient_params)
        redirect_to patients_path, notice: 'Patient was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @patient = Patient.find(params[:id])
      @patient.destroy
      redirect_to patients_path, notice: 'Patient was successfully deleted.'
    end
  
    private
  
    def patient_params
      params.require(:patient).permit(:name, :age, :phone, :email)
    end
  
    def authorize_receptionist!
      redirect_to root_path, alert: 'Not authorized' unless current_user.receptionist?
    end
  end
  
