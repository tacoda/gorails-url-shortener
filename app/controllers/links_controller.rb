class LinksController < ApplicationController
  include Pagy::Backend

  before_action :set_link, only: [ :show, :edit, :update, :destroy ]
  before_action :check_if_editable, only: [ :edit, :update, :destroy ]

  def index
    @pagy, @links = pagy(Link.recent_first)
    @link ||= Link.new
  rescue Pagy::OverflowError
    redirect_to root_path
  end

  def show
  end

  def create
    @link = Link.new(link_params.with_defaults(user: current_user))
    if @link.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream { render turbo_stream: [
          turbo_stream.prepend("links", @link)
          # turbo_stream.replace("link_form", partial: "links/form", locals: { link: Link.new })
        ]
        }
      end
    else
      @pagy, @links = pagy(Link.recent_first)
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @link.update(link_params)
      redirect_to @link
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to root_path, notice: "Link has been deleted."
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def set_link
    @link = Link.find_by_short_code(params[:id])
  end

  def check_if_editable
    redirect_to @link, alert: "You aren't allowed to do that." unless @link.editable_by?(current_user)
  end
end
