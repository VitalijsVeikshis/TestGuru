class Admin::BadgeForTestAttemptsController < ApplicationController
  def new
    @badge = BadgeForTestAttempt.new
  end

  def create
    @badge = BadgeForTestAttempt.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge_for_test_attempt)
          .permit(:name, :picture_url, :type, params: [:attempts])
  end
end
