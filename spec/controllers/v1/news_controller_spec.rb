require 'rails_helper'

RSpec.describe V1::NewsController, type: :controller do
  describe '#index' do
    let!(:post) { build :post}
    # subject { get :index }

    it 'response' do
      get news_index_path
      json = JSON.parse(response.body)
      expect(json['users'].count).to eq(1)
    end

    context 'authorize' do
      it { is_expected.to     have_http_status :success }
      it { is_expected.not_to be_unauthorized }
    end
  end


  describe '#show' do
    subject { get :show}
    context ''
  end

  describe '#create' do
    subject { create :news }

    context 'as unauthorized' do

    end

    context 'as authorized' do
      context 'with invalid params' do

      end
      context 'with valid params' do

      end
    end
  end
end
