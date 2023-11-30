class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  before_action :index_params, only: %i[index show]

  def index
  end

  def show
    @messages = @room.messages.all.order('Created_at Asc')
    @message = Message.new
    render 'index'
  end

  def new
  end

  def edit
  end

  def create
    @room = Room.new(room_params)
    respond_to do |format|
      if @room.save
        format.turbo_stream { flash.now[:notice] = "Room added successfully." }
      else
        format.html { redirect_to inbox_path, notice: "Room name can't be blank" }
      end
    end
  end

  def update
    respond_to do |format|
      if @room.update(room_params)
        ActionCable.server.broadcast 'room_channel', {room_id: @room.id, room_name: @room.name }
        format.turbo_stream { flash.now[:notice] = "Room has been updated." }        
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @room.destroy!
    respond_to do |format|
        format.turbo_stream {flash.now[:notice] = "Room destroyed successfully." }

    end
  end

  private

    def index_params 
      @rooms = Room.order("Created_at Desc")
      @new_room = Room.new
      user_online = Kredis.unique_list "users_online"
      @users = User.find(user_online.elements)
    end
    
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:name)
    end
end
