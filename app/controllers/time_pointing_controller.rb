class TimePointingController < ApplicationController
  before_action :set_time_pointing

  def index
    @time_pointing.employee = get_employee
    @all = TimePointing.find_by(kind: 0)
  end

  def show
    @time_pointing = TimePointing.where(employee: get_employee, 
      point_registration: (Time.now.midnight )..Time.now.midnight+ 1.day)

  end
  

  def register
    @time_pointing.employee = get_employee
    @time_pointing.point_registration = Time.now

    if count_kind <= 1
      @time_pointing.shift = 0
    else
      if count_kind >= 2  
        @time_pointing.shift = 1
      end
    
    end

    @time_pointing.kind = 0
    
    if count_kind < 4
      if @time_pointing.save
        @time_pointing = TimePointing.where(employee: get_employee, 
                                            point_registration: (Time.now.midnight )..Time.now.midnight+ 1.day)
        #@time_pointing = TimePointing.all
      end
    else
      redirect_to time_pointing_show_path
    end
  end

  private
  
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

    def count_kind
      TimePointing.where(employee: get_employee).length
    end
    
end
