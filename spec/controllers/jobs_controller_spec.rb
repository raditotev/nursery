require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:job){ create(:job) }

  let(:valid_attributes) { attributes_for(:job) }

  let(:invalid_attributes) { attributes_for(:job, title: nil, description: nil) }

  let(:valid_session) { {} }

  describe "unauthorized user" do
    is_redirected :job
  end

  describe "GET #index" do
    login_admin

    it_loads_index_page

    it "assigns all jobs as @jobs" do
      get :index, params: {}, session: valid_session
      expect(assigns(:jobs)).to eq([job])
    end
  end

  describe "GET #show" do
    login_admin

    it_loads_show_page :job

    it "assigns the requested job as @job" do
      get :show, params: {id: job.to_param}, session: valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "GET #new" do
    login_admin

    it_loads_new_page

    it "assigns a new job as @job" do
      get :new, params: {}, session: valid_session
      expect(assigns(:job)).to be_a_new(Job)
    end
  end

  describe "GET #edit" do
    login_admin

    it_loads_edit_page :job

    it "assigns the requested job as @job" do
      get :edit, params: {id: job.to_param}, session: valid_session
      expect(assigns(:job)).to eq(job)
    end
  end

  describe "POST #create" do
    login_admin

    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, params: {job: valid_attributes}, session: valid_session
        }.to change(Job, :count).by(1)
        expect(flash[:success]).to eq "Job was successfully created."
      end

      it "assigns a newly created job as @job" do
        post :create, params: {job: valid_attributes}, session: valid_session
        expect(assigns(:job)).to be_a(Job)
        expect(assigns(:job)).to be_persisted
      end

      it "redirects to the created job" do
        post :create, params: {job: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Job.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved job as @job" do
        post :create, params: {job: invalid_attributes}, session: valid_session
        expect(assigns(:job)).to be_a_new(Job)
      end

      it "re-renders the 'new' template" do
        post :create, params: {job: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    login_admin

    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:job, title: "New title")
      }

      it "updates the requested job" do
        put :update, params: {id: job.to_param, job: new_attributes}, session: valid_session
        job.reload
        expect(flash[:success]).to eq "Job was successfully updated."
        new_attributes.each_pair do |key, value|
          expect(job[key]).to eq new_attributes[key]
        end
      end

      it "assigns the requested job as @job" do
        put :update, params: {id: job.to_param, job: valid_attributes}, session: valid_session
        expect(assigns(:job)).to eq(job)
      end

      it "redirects to the job" do
        put :update, params: {id: job.to_param, job: valid_attributes}, session: valid_session
        expect(response).to redirect_to(job)
      end
    end

    context "with invalid params" do
      it "assigns the job as @job" do
        put :update, params: {id: job.to_param, job: invalid_attributes}, session: valid_session
        expect(assigns(:job)).to eq(job)
      end

      it "re-renders the 'edit' template" do
        put :update, params: {id: job.to_param, job: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

    before :each do
      job
    end

    it "destroys the requested job" do
      expect {
        delete :destroy, params: {id: job.to_param}, session: valid_session
      }.to change(Job, :count).by(-1)
      expect(flash[:success]).to eq "Job was successfully destroyed."
    end

    it "redirects to the jobs list" do
      delete :destroy, params: {id: job.to_param}, session: valid_session
      expect(response).to redirect_to(admin_jobs_url)
    end
  end

end
