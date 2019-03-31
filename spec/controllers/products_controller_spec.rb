require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:product) { create(:product, category:category) }

  before { sign_in(user) }

  describe 'GET #show' do
    before do
      get :show, params: {id: product}
    end

    it 'populates an array of all products' do
      expect(assigns(:product)).to eq product
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: {id: product}
    end

    it 'assigns the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new product in the database' do
        expect { post :create, params: {product: attributes_for(:product), category_id: category} }.to change(category.products, :count).by(1)
      end

      it 'render create template' do
        post :create, params: { product: attributes_for(:product), category_id: category }
        expect(response).to redirect_to product_path(assigns(:product))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the product' do
        expect { post :create, params: {product: attributes_for(:invalid_product), category_id: category} }.to_not change(Product, :count)
      end

      it 'render new template' do
        post :create, params: { product: attributes_for(:invalid_product), category_id: category }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested product to @product' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(assigns(:product)).to eq product
      end

      it 'changes product attributes' do
        patch :update, params: { id: product.id, product: { name: 'new name'} }
        product.reload
        expect(product.name).to eq 'new name'
      end

      it 'redirects to the updated product' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(response).to redirect_to product.category
      end
    end

    context 'invalid attributes' do
      before do
        patch :update, params: { id: product, product: { name: nil} }
      end

      it 'does not change product attributes' do
        product.reload
        expect(product.name).to eq product.name
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:product) { create(:product, category: category) }

    context 'delete  product' do
      it 'deletes product' do
        expect { delete :destroy, params: { id: product} }.to change(Product, :count).by(-1)
      end

      it 'redirect to category view' do
        delete :destroy, params: { id: product }
        expect(response).to redirect_to category_path(category)
      end
    end
  end
end
