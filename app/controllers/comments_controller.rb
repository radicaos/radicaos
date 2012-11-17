class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order_by([:created_at, :desc]).limit(20)
    respond_with(@comments)
  end

  def create
    @comment = Comment.new(params[:comment])

    @comment.ip = request.remote_ip

    @comment.save

    respond_with(@comment)
  end
end
