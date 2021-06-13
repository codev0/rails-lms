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

    respond_to do |format|
      if @examination.save
        format.html { redirect_to @examination, notice: 'Exam was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    @examination = Examination.find(params[:id])

    respond_to do |format|
      if @examination.update(examination_params)
        format.html { redirect_to @examination, notice: 'Exam was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @examination.destroy
    respond_to do |format|
      format.html { redirect_to examination_url, notice: 'Examination was successfully destroyed.' }
    end
  end

  private

  def examination_params
    params.require(:examination).permit(:title)
  end

  def set_examination
    @examination = Examination.find(params[:id])
  end
end
