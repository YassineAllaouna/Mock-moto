class MotosController < ApplicationController
  def index
    @motos = Moto.all
    @markers = @motos.geocoded.map do |moto|
      {
        lat: moto.latitude,
        lng: moto.longitude
      }
    end
  end

  def show
    @moto = Moto.find(params[:id])
    @markers = [{
      lat: @moto.latitude,
      lng: @moto.longitude
    }]
  end

  def new
    @moto = Moto.new # needed to instantiate the form_for
  end

  def create
    @moto = Moto.new(moto_params)
    if @moto.save
      redirect_to moto_path(@moto)
    else
      render :new
    end
  end

  def edit
    @moto = Moto.find(params[:id])
  end

  def update
    @moto = Moto.find(params[:id])
    @moto.update(moto_params)
    redirect_to moto_path(@moto)
  end

  def destroy
    @moto = Moto.find(params[:id])
    @moto.destroy
    redirect_to motos_path
  end

  private

  def moto_params
    params.require(:moto).permit(:name, :rating, :address)
  end
end
