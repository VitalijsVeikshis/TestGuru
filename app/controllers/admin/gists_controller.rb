class Admin::GistsController < ApplicationController
  before_action :set_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def destroy
    result = @gist.delete_from_remote

    flash_options = if result
                      @gist.destroy
                      { notice: t('.success', hash: @gist.hash) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to admin_gists_path, flash_options
  end

  private

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
