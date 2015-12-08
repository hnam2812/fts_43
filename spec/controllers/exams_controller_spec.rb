require "rails_helper"

describe ExamsController do
  user = User.first
  subject = Subject.first
  first_exam = Exam.first
  before{sign_in user}

  describe "can GET #index" do
    it "render index success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end

  describe "can GET #show" do
    before{get :show, id:first_exam}
    it "render show success" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
  end

  describe "can POST #create" do
    before{post :create}
    context "can create a exam" do
      let(:exam_params){FactoryGirl.attributes_for(:exam)}
      it{expect(response).to have_http_status(200)}
    end
  end
end

