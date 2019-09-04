require 'rails_helper'

RSpec.describe V1::NewsController, type: :controller do
  describe '#index' do
    subject { get :index }
    context 'authorize' do
      it { is_expected.to have_http_status :success }
      it { is_expected.not_to be_unauthorized }
    end
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

  describe '#update' do

  end


  describe '#author_news' do

  end

  describe '#unread_news' do

  end


end
