class TimePointingController < ApplicationController
  before_action :set_time_pointing

  def index
    @time_pointing.employee = Employee.find_by(id: current_user.id)
  end

  def register
    @time_pointing.point_registration = Time.now
    @time_pointing.shift = 0
    @time_pointing.kind = 0
    @time_pointing.save

  end

  def create
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_pointing
      @time_pointing = TimePointing.new
      #@time_pointing = TimePointing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def time_pointing_params
      params.require(:time_pointing)
            .permit(:employee, 
                    :point_registration, 
                    :shift,
                    :kind
      )
    end
end
