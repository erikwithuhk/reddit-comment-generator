class Api::V1::WordsController < ApplicationController
  def index
    set_page
    if @page_number
      word_count = Word.all.count
      words = Word.all.limit(10).offset(@offset)
      render json: { page: @page_number, total: word_count, words: words },
             status: :ok
    else
      render json: { error: "requests must include a page number paramater" },
             status: :bad_request
    end
  end

  def show
    @word = Word.find(params[:id])
    render json: @word
  end

  private

  attr_reader :page_number, :offset

  def set_page
    @page_number = params[:page].to_i
    @offset = (page_number * 10) - 10
  end
end
