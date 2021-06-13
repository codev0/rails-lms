class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.create(answer_params)
    redirect_to question_path(@question)
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])

    respond_to do |format|
      if @examination.update(examination_params)
        format.html { redirect_to @examination, notice: 'Exam was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :correct)
  end
end
