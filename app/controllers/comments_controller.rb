class CommentsController < ApplicationController
  before_action :authenticate, only: [:create]
  before_action :current_user, only: [:create]

  def show
    @comment = Comment.find(params[:id])
    render :show
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    @plant = Plant.find(params[:plant_id])
    @comment.plant_id = @plant.id
    @comment.datetime = Time.zone.now
    if @comment.save
      render json: {comment_id: @comment.id, username: @current_user.username, plant: @plant.common_name, body: @comment.body, datetime: @comment.datetime},  status: :created
    else
      render json: {errors: @comment.errors}, status: :bad_request
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:user_id, :plant_id, :body, :datetime)
    end
end
