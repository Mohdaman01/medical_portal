class DoctorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_doctor!

  def index
    @patients_by_day = Patient.group_by_day(:created_at).count
  end

  private

  def authorize_doctor!
    redirect_to root_path, alert: 'Not authorized' unless current_user.doctor?
  end
end

