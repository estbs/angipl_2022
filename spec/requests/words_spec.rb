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

  describe 'GET new' do
    before { get :new }

    it 'Assigns @word' do
      expect(assigns(:word)).to be_a_new(Word)
    end

    it 'Renders the new template' do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST create' do
    subject { post :create, params: params }

    context 'Valid params' do
      let(:params) do
        { word: { value: 'cat', language: 'English' } }
      end

      it 'creates a new word' do
        expect{ subject }.to change(Word, :count).from(0).to(1)
      end
    end

    context 'Invalid params' do
      let(:params) do
        { word: { value: 'cat' } }
      end

      it 'does not create a new word' do
        expect{ subject }.not_to change(Word, :count)
      end
    end
  end
end
