class CitizensController < ApplicationController
  def edit
    @citizen = current_user.citizen || current_user.create_citizen!
    @bank = @citizen.bank || @citizen.create_bank!
  end

  def update
    citizen.update!(citizen_params)
    citizen.bank.update!(bank_params)
    redirect_to citizen_user_path(current_user)
  end

  def create
    @citizen = current_user.create_citizen!(citizen_params)
    redirect_to citizen_user_path(current_user)
  end

  private

  def citizen_params
    params.require(:citizen).permit(:name, :last_name, :middle_name, :address, :inn, :phone)
  end

  def bank_params
    params.require(:bank).permit(:name, :bic, :bank_order, :order)
  end

  def citizen
    @citizen ||= Citizen.find(params[:id])
  end
end
