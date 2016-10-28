class Api::V1::WordsController < ApplicationController
  def index
    get_queries
    if @page_number > 0
      total_words = Word.all.length
      total_pages = ((total_words - 1) / 10) + 1
      if @page_number > total_pages
        out_of_range_error(total_pages)
      else
        words = Word.all.limit(10).offset(@offset)
        render json: {
          page: @page_number,
          total_pages: total_pages,
          total_words: total_words,
          words: words
        },
               status: :ok
      end
    else
      render json: { error: "Requests must include a page number." },
             status: :bad_request
    end
  end

  private

  def out_of_range_error(total_pages)
    if @page_number == 1
      render json: {
        error: "There is only #{total_pages} page of results."
      },
             status: :bad_request
    else
      render json: {
        error: "There are only #{total_pages} pages of results."
      },
             status: :bad_request
    end
  end

  def get_queries
    @page_number = params[:page].to_i
    @offset = (@page_number * 10) - 10
  end
end
