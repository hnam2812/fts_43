class QuestionsController < ApplicationController
  load_and_authorize_resource

  def new
    @subjects = Subject.all
    @question.answers.build
  end

  def create
    if @question.save
      flash[:sucess] = t "questions.success"
    else
      flash[:danger] = t "questions.fail"
    end
    redirect_to :back
  end

  def index
    @questions = current_user.questions
  end

  def edit
    @subjects = Subject.all
    @question.answers.build
  end

  def update
    if @question && @question.update_attributes(question_params)
      flash[:sucess] = t "questions.success"
      redirect_to user_questions_path current_user
    else
      flash[:danger] = t "questions.fail"
      render :edit
    end
  end

  def destroy
    if @question.destroy
      flash[:success] = t "questions.success"
    else
      flash.now[:danger] = t "questions.fail"
    end
    redirect_to :back
  end

  private
  def question_params
    params.require(:question).permit :content, :subject_id, :user_id,
      answers_attributes: [:id, :content, :is_correct]
  end
end
