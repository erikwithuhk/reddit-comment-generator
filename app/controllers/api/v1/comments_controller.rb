class Api::V1::CommentsController < ApplicationController
  def index
    number_of_comments = params[:n] ? params[:n].to_i : 1
    comments = get_comments(number_of_comments)
    render json: { total: number_of_comments, comments: comments }
  end

  def get_comments(number_of_comments)
    comments = []
    number_of_comments.times do
      comment = Comment.new
      comments.push(comment.text)
    end
    comments
  end
end
