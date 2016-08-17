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

    let(:user) { FactoryGirl.create(:user) }
    let(:course) { course = FactoryGirl.build(:course) }

    context "when user login" do

      before do
        sign_in_user
        get :new
      end

      it "assign @course" do
        expect(assigns(:course)).to be_new_record
        expect(assigns(:course)).to be_instance_of(Course)
      end

      it "render templete" do
        expect(response).to render_template("new")
      end
    end


    it_behaves_like "require_sign_in" do
      let (:action) {
        get :new
      }
    end
  end

  context "when user not login" do
    it "redirect_to new_user_session_path" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
  end

  describe "POST create" do
    let(:user) { FactoryGirl.create(:user) }

    context "when course dosen't have a title" do
      before { sign_in_user }


      it "dosen't create a record" do
        expect{ post :create, course: {:description => "bar"} }.to change{ Course.count}.by(0)
      end

      it "render new template" do
        post :create, course: {:description => "bar"}
        expect(response).to render_template("new")
      end
    end

    context "when course have a title" do
      before { sign_in_user }

      it "create a new course record" do
        course = FactoryGirl.build(:course)
        expect{ post :create, :course => FactoryGirl.attributes_for(:course)}.to change{ Course.count }.by(1)
      end

      it "redirect to course_path" do
        course = FactoryGirl.build(:course)
        post :create, :course => FactoryGirl.attributes_for(:course)
        expect(response).to redirect_to courses_path
      end

      it "create a course for user" do
        course = FactoryGirl.build(:course)
        post :create, course: FactoryGirl.attributes_for(:course)
        expect(Course.last.user).to eq(user)
      end
    end

    it_behaves_like "require_sign_in" do
      let (:action) {
        course = FactoryGirl.build(:course)
        post :create, course: FactoryGirl.attributes_for(:course)
      }
    end

  end

  describe "GET edit" do
    it "assign course" do
      course = FactoryGirl.create(:course)
      get :edit, :id => course.id
      expect(assigns[:course]).to eq(course)
    end

    it "render template" do
      course = FactoryGirl.create(:course)
      get :edit, :id => course.id
      expect(response).to render_template("edit")
    end
  end

  describe "PUT update" do

    context "when course have title" do
      it "assign @course" do
        course = FactoryGirl.create(:course)
        put :update, id: course.id, course: { title: "Title", description: "Description" }
        expect(assigns[:course]).to eq(course)
      end

      it "change value" do
        course = FactoryGirl.create(:course)
        put :update, id: course.id, course: { title: "Title", description: "Description" }
        expect(assigns[:course].title).to eq("Title")
        expect(assigns[:course].description).to eq("Description")
      end

      it "redirect_to course_path" do
        course = FactoryGirl.create(:course)
        put :update, id: course.id, course: { title: "Title", description: "Description" }
        expect(response).to redirect_to course_path(course)
      end
    end

    context "when course doesn't have title" do
      it "doesn't update a record" do
        course = FactoryGirl.create(:course)
        put :update, id: course.id, course: { title: "", description: "Description" }
        expect(course.title).not_to eq("")
      end

      it "render edit template" do
        course = FactoryGirl.create(:course)
        put :update, id: course.id, course: { title: "", description: "Description" }
        expect(response).to render_template("edit")
      end
    end

    describe "DELETE dstroy" do
      it "assigns @course" do
        course = FactoryGirl.create(:course)
        delete :destroy, id: course.id
        expect(assigns[:course]).to eq(course)
      end

      it "delete a record" do
        course = FactoryGirl.create(:course)
        expect { delete :destroy, id: course.id }.to change{ Course.count }.by(-1)
      end

      it "redirect to courses_path" do
        course = FactoryGirl.create(:course)
        delete :destroy, id: course.id
        expect(response).to redirect_to courses_path
      end
    end

    describe "Homepage" do
      it "route root path to course #index" do
        expect(get: "/").to route_to(controller: "courses", action: "index")
      end
    end

  end


end
