class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render "index.json.jb"
  end

  def create
    @comment = Comment.new(
      text: params[:text],
      event_id: params[:event_id],
      user_id: params[:user_id],
    )
    if @comment.save
      render "show.json.jb"
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    @comment.text = params[:text] || @comment.text
    if @comment.save
      render "show.json.jb"
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    comment.destroy
    render json: { message: "Comment successfully destroyed" }
  end

  # comments = []
  # @event.comments.each do |comment|
  #   comment[‘user’] = comment.user
  #   comments << comment
  # end
end
