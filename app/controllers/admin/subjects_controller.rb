class Admin::SubjectsController < ApplicationController
  def index
    @subjects = Subject.page(params[:page])
      .per Settings.pagination.subjects_per_page
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "admin.subject.add.success"
      redirect_to admin_subjects_path
    else
      flash.now[:danger] = t "admin.subject.add.fail"
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name
  end
end
