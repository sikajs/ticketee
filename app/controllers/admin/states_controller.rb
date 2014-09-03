class Admin::StatesController < Admin::BaseController

  def index
    @states = State.all
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:notice] = "State has been created."
      redirect_to admin_states_path
    else
      flash[:error] = "State has not been created."
      render :new
    end
  end

  private
    def state_params
      params.require(:state).permit(:name)
    end
end
