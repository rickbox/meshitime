# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def show
    @comments = Comment.all.order(created_at: "DESC")
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

