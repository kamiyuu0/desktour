class DesksController < ApplicationController
  def index
    @desks = Desk.includes(:user)
  end

  def new
    @desk = Desk.new
  end

  def create
    @desk = current_user.desks.build(desk_params)
    if @desk.save
      redirect_to desks_path, success: 'デスクの作成に成功しました。'
    else
      flash.now[:danger] = 'デスクの作成に失敗しました。'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @desk = Desk.find(params[:id])
  end

  def edit
    @desk = current_user.desks.find(params[:id])
  end

  def update
    @desk = current_user.desks.find(params[:id])
    if @desk.update(desk_params)
      redirect_to desk_path(@desk), success: 'デスクの編集に成功しました。'
    else
      flash.now[:danger] = 'デスクの編集に失敗しました。'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    desk = Desk.find(params[:id])
    desk.destroy!
    redirect_to desks_path, success: 'デスクの削除に成功しました', status: :see_other
  end

  private

  def desk_params
    params.require(:desk).permit(:title, :content, :desk_image, :desk_image_cache)
  end
end
