class Admin::PurveyorController < ApplicationController
	before_action :set_purveyor

	def edit
	end

  def update
    if @purveyor.update(purveyor_params)
      flash[:notice] = "Реквізити постачальника відредаговані" 
      redirect_to consumers_path
    else
      render :edit
    end
  end


	private

	def set_purveyor
    @purveyor = Purveyor.first
    @purveyor ||= Purveyor.create(full_name: '')
  end

  def purveyor_params
  	params.require(:purveyor).permit(:full_name, :director, :edrpou, :inn,
  																	 :account, :bank, :mfo, :address, 
  																	 :phone, :mail)
  end
end
