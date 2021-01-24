class SuperheroesController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]

  # GET /superheroes
  def index
    @superheroes = if params[:name_q]
      Superhero.search params[:name_q]
    else
      Superhero.all
    end
  end

  # GET /superheroes/1
  def show
  end

  # GET /superheroes/new
  def new
    @superhero = Superhero.new
  end

  # GET /superheroes/1/edit
  def edit
  end

  # POST /superheroes
  def create
    @superhero = Superhero.new(superhero_params)

    if @superhero.save
      redirect_to @superhero, notice: t('.success')
    else
      render :new
    end
  end

  # PATCH/PUT /superheroes/1
  def update
    if @superhero.update(superhero_params)
      redirect_to @superhero, notice: t('.success')
    else
      render :edit
    end
  end

  # DELETE /superheroes/1
  def destroy
    @superhero.destroy
    redirect_to superheroes_url, notice: t('.success')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_superhero
      @superhero = Superhero.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def superhero_params
      params.require(:superhero).permit(I18n.available_locales.map do |l|
        [:"name_#{Mobility.normalize_locale(l)}", :"description_#{Mobility.normalize_locale(l)}"]
      end.flatten)
    end
end
