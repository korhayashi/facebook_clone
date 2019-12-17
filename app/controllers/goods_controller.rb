class GoodsController < ApplicationController
  def create
    good = current_user.goods.create(entry_id: params[:entry_id])
    redirect_to entries_path, notice: "#{good.entry.user.family_name}さんの投稿をいいね！しました"
  end

  def destroy
    good = current_user.goods.find_by(id: params[:id]).destroy
    redirect_to entries_path, notice: "#{good.entry.user.family_name}さんの投稿のいいね！を取り消しました"
  end
end
