class ExaminationsController < ApplicationController
  def index
    @examinations = Examination.all
  end

  def show
    @examination = Examination.find(params[:id])
  end

  def new
    @examination = Examination.new
  end

  def edit
    @examination = Examination.find(params[:id])
  end

  def create
    @examination = Examination.new(examination_params)

    respond_to do |f|
      if @examination.save
        f.html { redirect_to @examination, notice: 'Examination was successfully created.' }
      else
        f.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @examination = Examination.find(params[:id])

    respond_to do |f|
      if @examination.update(examination_params)
        f.html { redirect_to @examination, notice: 'Examination was successfully updated.' }
      else
        f.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @examination = Examination.find(params[:id])
    @examination.destroy

    redirect_to examinations_path
  end

  def check
    @examination = Examination.find(params[:id])
    @answers = params[:examination][:answer]

    correct = 0
    @answers.each do |k, v|
      @check = Answer.find(k)
      @check.correct && v['title'] == '1' && correct += 1
    end
    respond_to do |f|
      f.html { redirect_to @examination, notice: "#{correct} of #{@examination.questions.length}" }
    end
  end

  private

  def examination_params
    params.require(:examination).permit(:title)
  end
end
