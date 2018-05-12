class Admin::BadgesController < ApplicationController
  before_action :set_badge, only: %i[show edit update destroy update_inline]

  def show; end

  def index
    @badges = Badge.all
  end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path(@badge)
    else
      render :edit
    end
  end

  def update_inline
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :index
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(ActiveModel::Naming.singular(@badge).to_sym)
          .permit(:name, :picture_url, :type, :params)
  end
end
