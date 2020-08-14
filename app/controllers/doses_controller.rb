class DosesController < ApplicationController
  def new
    @dose = Dose.new(@cocktail)
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def edit
    @dose = Dose.find(params[:id])
  end

  def update
    @dose.update(dose_params)
    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private
  
  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end