class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]
  PER = 18
  def index
    @users = User.all.page(params[:page]).per(PER)
  end
  def show
    @user=User.find(params[:id])
    @reviews = @user.reviews
    @review = @user.reviews.build
    @favorites  = Favorite.where("user_id = ?", @user)
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
end
