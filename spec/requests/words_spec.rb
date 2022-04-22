require 'rails_helper'

RSpec.describe WordsController, type: :controller do
  describe 'GET /words' do
    before { get :index }

    context 'When some words present' do
      let(:word) { create(:word) }

      it 'Assigns @words' do
        expect(assigns(:words)).to eq([word])
      end

      it 'Renders the index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'When no words' do
      it 'Assigns @words' do
        expect(assigns(:words)).to eq([])
      end
    end

    it 'Renders the index template' do
      expect(response).to render_template(:index)
    end
  end
end
