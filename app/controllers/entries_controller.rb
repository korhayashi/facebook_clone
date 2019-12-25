class EntriesController < ApplicationController
  before_action :set_entry, only: [:edit, :update, :destroy]
  before_action :authenticate_user
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @all_entry = Entry.all
    @entries = @all_entry.where(parent_entry_id: nil).order(created_at: :desc)
    @child_entries = @all_entry.where.not(parent_entry_id: nil)
    # 親記事を持たない投稿を全て取得
    if params[:back]
      @entry = Entry.new(entry_params)
    else
      @entry = Entry.new
    end
  end

  def confirm
    @entries = Entry.where(parent_entry_id: nil).order(created_at: :desc)
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

  def edit

  end

  def update
    if @entry.update(entry_params)
      redirect_to entries_path, notice: '投稿を編集しました'
    else
      render :edit
    end
  end

  def destroy
    @entry.destroy
    redirect_to entries_path, notice:'投稿を削除しました'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:content, :parent_entry_id, :image, :image_cache)
  end

  def ensure_correct_user
    unless current_user.id == params[:id]
      redirect_to entries_path
    end
  end
end
