class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def confirm
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.build(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.valid?
      flash.clear
      @reservation.price = @reservation.calculate_total_price
      session[:reservation_data] = reservation_params
      render :confirm
    else
      flash[:notice] = "入力エラーがあります"
      render "rooms/show"
    end
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      session.delete(:reservation_data)
      redirect_to myreservation_path
      flash[:notice] = "作成しました"
    else
      render "rooms/show"
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      redirect_to myreservation_path
      flash[:notice] = "削除しました"
    end
  end

  def myreservation
    @reservations = current_user.reservations
  end

  private

  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :headcount, :user_id, :room_id, :price)
  end
end
