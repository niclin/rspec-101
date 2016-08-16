require 'rails_helper'

RSpec.describe CoursesController, type: :controller do


  describe "GET index" do
    it "assigns @courses and render template" do
      course1 = FactoryGirl.create(:course)
      course2 = FactoryGirl.create(:course)
      get:index
      expect(assigns[:courses]).to eq([course1, course2])
    end

    it "render template" do
      course1 = FactoryGirl.create(:course)
      course2 = FactoryGirl.create(:course)
      get:index
      expect(response).to render_template("index")
    end
  end

  describe "Get show" do
    it "assigns @course" do
      course = FactoryGirl.create(:course)
      get :show, :id => course.id
      expect(assigns[:course]).to eq(course)
    end

    it "render templete" do
      course = FactoryGirl.create(:course)
      get :show, :id => course.id
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "assign @course" do
      course = FactoryGirl.build(:course)
      get :new
      expect(assigns(:course)).to be_new_record
      expect(assigns(:course)).to be_instance_of(Course)
    end

    it "render templete" do
      course = FactoryGirl.build(:course)
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create a new course record" do
      course = FactoryGirl.build(:course)
      expect{ post :create, :course => FactoryGirl.attributes_for(:course)}.to change{ Course.count }.by(1)
    end

    it "" do
      course = FactoryGirl.build(:course)
      post :create, :course => FactoryGirl.attributes_for(:course)
      expect(response).to redirect_to courses_path
    end

  end


end
