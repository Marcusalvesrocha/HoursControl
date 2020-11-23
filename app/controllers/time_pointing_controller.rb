class TimePointingController < ApplicationController
  before_action :set_time_pointing

  def index
    @time_pointing.employee = get_employee
    @all = TimePointing.find_by(kind: 0)
  end

  def register
    @time_pointing.employee = get_employee
    @time_pointing.point_registration = Time.now
    @time_pointing.shift = 0
    @time_pointing.kind = 0
    
    if @time_pointing.save
      @time_pointing = TimePointing.where(employee: get_employee)
      #@time_pointing = TimePointing.all
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_pointing
      @time_pointing = TimePointing.new
      #@time_pointing = TimePointing.find(params[:id])
    end

    def get_employee
      Employee.find_by(id: current_user.employee.id)
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
