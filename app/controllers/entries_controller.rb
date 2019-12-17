class EntriesController < ApplicationController
  def index
    @entries = Entry.order(created_at: :desc)
    if params[:back]
      @entry = Entry.new(entry_params)
    else
      @entry = Entry.new
    end
  end

  def confirm
    @entries = Entry.order(created_at: :desc)
    @entry = current_user.entries.build(entry_params)
    # @entry = Entry.new(entry_params)
    # @entry.user_id = current_user.id
    # この2行が上記になる
    render 'index' if @entry.invalid?
  end

  def create
    @entry = current_user.entries.build(entry_params)
    # @entry = Entry.new(entry_params)
    # @entry.user_id = current_user.id
    # この2行が上記になる
    if @entry.save
      redirect_to entries_path
    end
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:content, :image, :image_cache)
  end
end
