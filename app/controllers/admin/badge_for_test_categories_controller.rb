class Admin::BadgeForTestCategoriesController < ApplicationController
  def new
    @badge = BadgeForTestCategory.new
  end

  def create
    @badge = BadgeForTestCategory.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge)
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge_for_test_category)
          .permit(:name, :picture_url, :type, params: [:category])
  end
end
