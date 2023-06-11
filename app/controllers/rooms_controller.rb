class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :destroy,]
  before_action :authorize_user, only: [:edit, :update, :destroy, ]
  before_action :authenticate_user!, only: [:myrooms, :new]



  def myrooms
    if current_user
      @rooms = current_user.rooms
    else
      flash[:notice] = "権限がありません"
      redirect_to "/"
    end
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      if @room.image_name.present?
        @room.image_name = "#{@room.id}.jpg"
        @room.save
      end
      flash[:notice] = "作成しました"
      redirect_to "/"
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "編集しました"
      redirect_to room_path(@room)
    else
      render "edit"
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    flash[:notice] = "削除しました"
    redirect_to myrooms_path
  end

  def search
    @rooms = Room.search(params[:address_keyword], params[:details_keyword])
    @address_keyword = params[:address_keyword]
    @details_keyword = params[:details_keyword]
    render "index"
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def authorize_user
    unless current_user == @room.user
      flash[:notice] = "権限がありません"
      redirect_to "/"
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :address, :price, :details, :image_name, :user_id)
  end
end
