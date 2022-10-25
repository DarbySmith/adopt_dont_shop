class AdminApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pets = @application.pets    
  end
  
  def update
    application = Application.find(params[:id])
    @pet = Pet.find(params[:pet_id])
    @pet.update(adoptable: params[:adoptable])
    redirect_to "/admin/applications/#{application.id}"
  end

end