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


end
