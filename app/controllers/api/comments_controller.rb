class Api::CommentsController < ApplicationController
  def index
    @comments = Comment.all
    render "index.json.jb"
  end

  def create
  end
end
