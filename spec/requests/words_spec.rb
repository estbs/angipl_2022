require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET /words' do
    context 'When some words present' do
      it 'Assigns @words' do
        word = create(:word)
        get :index
        expect(assigns(:words)).to eq([word])
      end
    end

    context 'When no words' do
      it 'Assigns @words' do
        get :index
        expect(assigns(:words)).to eq([])
      end
    end

    it 'Renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
