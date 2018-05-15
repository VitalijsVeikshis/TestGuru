class Admin::BadgeForTestLevelsController < ApplicationController
  def new
    @badge = BadgeForTestLevel.new
  end

  def create
    @badge = BadgeForTestLevel.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge_for_test_level)
          .permit(:name, :picture_url, :type, params: [:level])
  end
end
