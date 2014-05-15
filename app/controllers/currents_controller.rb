class CurrentsController < ApplicationController
  before_action :set_current, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /currents
  # GET /currents.json
  def index
    @currents = Current.all
  end

  # GET /currents/:id
  # GET /currents/:id.json
  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_current
    @current = Current.friendly.find(params[:id])
  end
end
