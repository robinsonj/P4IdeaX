class Admin::CurrentsController < Admin::AdminController
  before_action :set_current, only: [:edit, :update, :destroy]
  before_action :set_admin_users, only: [:index, :edit]

  # GET /admin/currents
  # GET /admin/currents.json
  def index
    @current  = Current.new
    @currents = Current.all.order(id: :desc)
  end

  # GET /admin/currents/:id/edit
  def edit
  end

  # POST /admin/currents
  def create
    @current = Current.new(current_params)
    @current.owner = current_user

    respond_to do |format|
      if @current.save
        format.html { redirect_to edit_admin_current_path(@current), notice: 'Current was successfully created.' }
      else
        format.html { render action: 'index', error: 'Current could not be created.' }
      end
    end
  end

  # PATCH/PUT /admin/currents/:id
  def update
    respond_to do |format|
      if @current.update(current_params)
        format.html { redirect_to edit_admin_current_path(@current), notice: 'Current was successfully updated.' }
      else
        format.html { render action: 'edit', error: 'Current could not updated.' }
      end
    end
  end

  # DELETE /admin/currents/:id
  def destroy

    respond_to do |format|
      if @current.destroy
        format.html { redirect_to admin_currents_url, notice: 'Current was successfully deleted.' }
      else
        redirect_to admin_currents_path, error: 'Current could not be deleted.'
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current
      @current = Current.find(params[:id])
    end

    def set_admin_users
      @admin_users = User.where(admin: true).order(name: :desc).map{ |user| [user.name, user.id] }
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def current_params
      params.require(:current).permit(:title, :description)
    end
end
