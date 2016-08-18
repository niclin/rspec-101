class CoursesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

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
    @course.user = current_user
    if @course.save

      redirect_to courses_path
    else
      render :new
    end
  end

  def edit
    @course = current_user.courses.find(params[:id])
  end

  def update
    @course = current_user.courses.find(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course = current_user.courses.find(params[:id])
    @course.destroy

    redirect_to courses_path
  end


  protected

  def course_params
    params.require(:course).permit(:title, :description)
  end
end
