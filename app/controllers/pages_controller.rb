class PagesController < ApplicationController
  def profile
    respond_to do |format|
      format.html { render :profile }
    end
  end

  def profile_courses
    respond_to do |format|
      format.html { render :profile_courses }
    end
  end

  def calendar
    respond_to do |format|
      format.html { render :calendar }
    end
  end
end
