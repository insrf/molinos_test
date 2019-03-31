require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category) }

  before { sign_in(user) }

  describe 'GET #index' do
    let(:categories) { create_list(:category, 2) }

    before { get :index }

    it 'populates an array of all categories' do
      expect(assigns(:categories)).to match_array(categories)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before do
      get :show, params: {id: category}
    end

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Category to @category' do
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    before do
      get :edit, params: {id: category}
    end

    it 'assigns the requested category to @category' do
      expect(assigns(:category)).to eq category
    end

    it 'render show view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new category in database' do
        expect { post :create, params: {category: attributes_for(:category)} }.to change(Category, :count).by(1)
      end

      it 'redirects to show view' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to category_path(assigns(:category))
      end
    end

    context 'with invalid attributes' do
      it 'saves the new category in database' do
        expect { post :create, params: {category: attributes_for(:invalid_category)} }.to_not change(Category, :count)
      end

      it 're render to new view' do
        post :create, params: { category: attributes_for(:invalid_category) }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'valid attributes' do
      it 'assings the requested category to @category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq category
      end

      it 'changes category attributes' do
        patch :update, params: { id: category.id, category: { name: 'new name', parent_id: 2 } }
        category.reload
        expect(category.name).to eq 'new name'
        expect(category.parent_id).to eq 2
      end

      it 'redirects to the updated category' do
        patch :update, params: { id: category, category: attributes_for(:category) }
        expect(response).to redirect_to category
      end
    end

    context 'invalid attributes' do
      before do
        patch :update, params: { id: category, category: { name: nil, parent_id: nil} }
      end

      it 'does not change category attributes' do
        category.reload
        expect(category.name).to eq 'MyString'
        expect(category.parent_id).to eq 1
      end

      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    before { category }
    context 'delete category' do
      it 'deletes category' do
        expect { delete :destroy, params: { id: category } }.to change(Category, :count).by(-1)
      end

      it 'redirect to index view' do
        delete :destroy, params: { id: category }
        expect(response).to redirect_to categories_path
      end
    end
  end
end
