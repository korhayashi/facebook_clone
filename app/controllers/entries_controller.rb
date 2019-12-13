class EntriesController < ApplicationController
  def index
    @posts = Entry.order(created_at: :desc)
    @entry = Entry.new
  end
end
