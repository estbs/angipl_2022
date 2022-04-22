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
      let(:language) { create(:language) }
      let(:params) do
        { word: { content: 'cat', language_id: language.id } }
      end

      it 'creates a new word' do
        expect{ subject }.to change(Word, :count).from(0).to(1)
      end
    end

    context 'Invalid params' do
      let(:params) do
        { word: { content: '' } }
      end

      it 'does not create a new word' do
        expect{ subject }.not_to change(Word, :count)
      end
    end
  end

  describe 'GET show' do
    before { get :show, params: params }

    let(:params) do
      { id: word.id }
    end

    let(:word) { create(:word) }

    it 'Assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'Renders the show template' do
      expect(response).to render_template(:show)
    end
  end

  describe 'GET edit' do
    before { get :edit, params: params }

    let(:params) do
      { id: word.id }
    end

    let(:word) { create(:word) }

    it 'Assigns @word' do
      expect(assigns(:word)).to eq(word)
    end

    it 'Renders the edit template' do
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT update' do
    subject { put :update, params: params }
    let(:word) { create(:word, content: 'cat', language: language_en) }
    let(:language_en) { create(:language, name: 'English') }
    let(:language_es) { create(:language, name: 'Spanish') }

    context 'Valid params' do
      let(:params) do
        { id: word.id, word: { content: 'gato', language_id: language_es.id } }
      end

      it 'updates word' do
        expect{ subject }.to change { word.reload.content }
          .from('cat').to('gato')
          .and change { word.reload.language }
          .from(language_en).to(language_es)
      end
    end

    context 'Invalid params' do
      let(:params) do
        { id: word.id, word: { content: '' } }
      end

      it 'does not update word' do
        expect{ subject }.not_to change { word.reload.content }
      end
    end
  end
end
