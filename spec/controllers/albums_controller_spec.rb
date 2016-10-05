require 'rails_helper'
RSpec.describe AlbumsController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:album)
  }

  let(:invalid_attributes) {
    attributes_for(:album, name: nil)
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    login_admin

    it "redirects to login when user unauthorised" do
      sign_out @admin
      album = create(:album)
      get :index, params: {}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns all albums as @albums" do
      album = create(:album)
      get :index, params: {}, session: valid_session
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe "GET #show" do
    login_admin

    it "redirects to login when user unauthorised" do
      sign_out @admin
      album = create(:album)
      get :show, params: {id: album.to_param}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns the requested album as @album" do
      album = create(:album)
      get :show, params: {id: album.to_param}, session: valid_session
      expect(assigns(:album)).to eq(album)
    end
  end

  describe "GET #new" do
    login_admin

    it "redirects to login when user unauthorised" do
      sign_out @admin
      get :new, params: {}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns a new album as @album" do
      get :new, params: {}, session: valid_session
      expect(assigns(:album)).to be_a_new(Album)
    end
  end

  describe "GET #edit" do
    login_admin

    it "redirects to login when user unauthorised" do
      sign_out @admin
      album = create(:album)
      get :edit, params: {id: album.to_param}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns the requested album as @album" do
      album = create(:album)
      get :edit, params: {id: album.to_param}, session: valid_session
      expect(assigns(:album)).to eq(album)
    end
  end

  describe "POST #create" do

    it "redirects to login when user unauthorised" do
      post :create, params: {album: valid_attributes}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    context "with valid params" do
      login_admin

      it "creates a new Album" do
        expect {
          post :create, params: {album: valid_attributes}, session: valid_session
        }.to change(Album, :count).by(1)
      end

      it "assigns a newly created album as @album" do
        post :create, params: {album: valid_attributes}, session: valid_session
        expect(assigns(:album)).to be_a(Album)
        expect(assigns(:album)).to be_persisted
      end

      it "creates photos passed to album" do
        image1 = fixture_file_upload("images/test_img.png", 'image/png')
        image2 = fixture_file_upload("images/test_img.png", 'image/png')
        image3 = fixture_file_upload("images/test_img.png", 'image/png')
        images = [image1, image2, image3]
        post :create, params: {album: valid_attributes, images: images}, session: valid_session
        expect(Album.last.photos.count).to eq 3
      end

      it "sets first photo as cover" do
        image1 = fixture_file_upload("images/test_img.png", 'image/png')
        image2 = fixture_file_upload("images/test_img.png", 'image/png')
        images = [image1, image2]
        post :create, params: {album: valid_attributes, images: images}, session: valid_session
        photo_id = Photo.first.id
        expect(Album.last.cover_photo_id).to eq photo_id
      end

      it "redirects to the created album" do
        post :create, params: {album: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Album.last)
      end
    end

    context "with invalid params" do
      login_admin

      it "assigns a newly created but unsaved album as @album" do
        post :create, params: {album: invalid_attributes}, session: valid_session
        expect(assigns(:album)).to be_a_new(Album)
      end

      it "re-renders the 'new' template" do
        post :create, params: {album: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do

    it "redirects to login when user unauthorised" do
      album = create(:album)
      put :update, params: {id: album.to_param, album: valid_attributes}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    context "with valid params" do
      login_admin
      let(:new_attributes) {
        attributes_for(:album, name: "Different Name")
      }

      it "updates the requested album" do
        album = create(:album)
        put :update, params: {id: album.to_param, album: new_attributes}, session: valid_session
        album.reload
        new_attributes.each_pair do |k, v|
          expect(album[k]).to eq new_attributes[k]
        end
      end

      it "assigns the requested album as @album" do
        album = create(:album)
        put :update, params: {id: album.to_param, album: valid_attributes}, session: valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "redirects to the album" do
        album = create(:album)
        put :update, params: {id: album.to_param, album: valid_attributes}, session: valid_session
        expect(response).to redirect_to(album)
      end

      it "adds new photos to existing album collection" do
        album = create(:album_with_photo)
        image = fixture_file_upload("images/test_img1.png", 'image/png')
        expect{
          put :update, params: {id: album.to_param, album: valid_attributes, images: [image]}, session: valid_session
          }.to change(album.photos, :count).by(1)
      end

      it "doesn't add existing photos to album collection" do
        album = create(:album_with_photo)
        image = fixture_file_upload("images/test_img.png", 'image/png')
        expect{
          put :update, params: {id: album.to_param, album: valid_attributes, images: [image]}, session: valid_session
          }.not_to change(album.photos, :count)
      end

      it "sets cover photo if nil previously" do
        album = create(:album)
        expect(album.cover_photo_id).to eq nil
        image = fixture_file_upload("images/test_img.png", 'image/png')
        put :update, params: {id: album.to_param, album: valid_attributes, images: [image]}, session: valid_session
        expect(assigns(:album).cover_photo_id).to eq Photo.last.id
      end
    end

    context "with invalid params" do
      login_admin

      it "assigns the album as @album" do
        album = create(:album)
        put :update, params: {id: album.to_param, album: invalid_attributes}, session: valid_session
        expect(assigns(:album)).to eq(album)
      end

      it "re-renders the 'edit' template" do
        album = create(:album)
        put :update, params: {id: album.to_param, album: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    login_admin

     it "redirects to login when user unauthorised" do
      sign_out @admin
      album = create(:album)
       delete :destroy, params: {id: album.to_param}, session: valid_session
      expect(response).to redirect_to new_admin_session_path
    end

    it "destroys the requested album" do
      album = create(:album)
      expect {
        delete :destroy, params: {id: album.to_param}, session: valid_session
      }.to change(Album, :count).by(-1)
    end

    it "redirects to the albums list" do
      album = create(:album)
      delete :destroy, params: {id: album.to_param}, session: valid_session
      expect(response).to redirect_to(admin_albums_url)
    end

    it "destroys all photos belonging to album" do
      album = create(:album_with_photo)
      expect {
        delete :destroy, params: {id: album.to_param}, session: valid_session
      }.to change(Photo, :count).by(-1)
    end
  end
end
