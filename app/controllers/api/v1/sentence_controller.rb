require 'byebug'

class Api::V1::SentenceController < ApplicationController
  def index
    length = params[:length].to_i || 10
    new_sentence = Sentence.new(length)
    render json: new_sentence
  end
end
