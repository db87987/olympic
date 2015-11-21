class FrequentQuestionsController < ApplicationController
  def index
    @frequent_questions = FrequentQuestion.published.order('sn ASC')
  end
end