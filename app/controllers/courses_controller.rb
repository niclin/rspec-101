class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.save

    redirect_to courses_path
  end


  protected

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
