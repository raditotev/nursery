class PublicPagesController < ApplicationController
  def home
    @closures = Break.where('start_date > ?', Date.today)
                                   .order(start_date: :asc)
    @newsletters = Newsletter.order(created_at: :desc).last(3)
    @awards = Award.last(3)
  end
end
