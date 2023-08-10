require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/clothes', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Cloth. As you add validations to Cloth, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Cloth.create! valid_attributes
      get clothes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      cloth = Cloth.create! valid_attributes
      get cloth_url(cloth)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_cloth_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      cloth = Cloth.create! valid_attributes
      get edit_cloth_url(cloth)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new cloth' do
        expect do
          post clothes_url, params: { cloth: valid_attributes }
        end.to change(cloth, :count).by(1)
      end

      it 'redirects to the created cloth' do
        post clothes_url, params: { cloth: valid_attributes }
        expect(response).to redirect_to(cloth_url(Cloth.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new cloth' do
        expect do
          post clothes_url, params: { cloth: invalid_attributes }
        end.to change(Cloth, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post clothes_url, params: { cloth: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_cloth)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested cloth' do
        cloth = Cloth.create! valid_attributes
        patch cloth_url(cloth), params: { cloth: new_attributes }
        cloth.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the cloth' do
        cloth = Cloth.create! valid_attributes
        patch cloth_url(cloth), params: { cloth: new_attributes }
        cloth.reload
        expect(response).to redirect_to(cloth_url(cloth))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        cloth = Cloth.create! valid_attributes
        patch cloth_url(cloth), params: { cloth: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_cloth)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested cloth' do
      cloth = Cloth.create! valid_attributes
      expect do
        delete cloth_url(cloth)
      end.to change(Cloth, :count).by(-1)
    end

    it 'redirects to the clothes list' do
      cloth = Cloth.create! valid_attributes
      delete cloth_url(cloth)
      expect(response).to redirect_to(clothes_url)
    end
  end
end
