class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy update_inline]

  def show; end

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = badge_type.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
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

  def badge_type
    if params[:badge][:type].to_sym.in?(Badge.select_options)
      params[:badge][:type].constantize
    end
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge)
          .permit(:name, :picture_url, params: %i[level attempts category])
  end
end
