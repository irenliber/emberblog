require 'rails_helper'
require 'spec_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  before :each do
    request.accept = 'application/json'
  end

  describe 'GET index' do
    let!(:article){create :article}

    before(:each) {get :index}

    it {expect((assigns :articles).to_a).to eq [article]}
  end

  describe 'POST create' do
    subject{post :create, article: attributes}

    context 'valid attributes' do
      let(:attributes){ {title: 'text', body: 'title'} }

      it {expect{subject}.to change{Article.count}.by(1)}
      it 'status is ok' do
        subject
        expect(response.status).to eq 201
      end
    end

    context 'invalid attributes' do
      let(:attributes){ { text: 'title'} }

      it {expect{subject}.not_to change{Article.count}}
      it 'status is 422' do
        subject
        expect(response.status).to eq 422
      end
    end
  end

  describe 'GET show' do

    before(:each) {@article = create(:article)}
    it "should assign @article to the article" do
      get :show, id: @article.id
      expect(response.status).to eq 200
      assigns(:article).id.should eq(@article.id)
    end
  end

  describe 'PUT update' do
    before(:each) {@article = create(:article)}

    let(:attr) do
      { :title => 'new title', :body => 'new content' }
    end

    before(:each) do
      put :update, :id => @article.id, :article => attr
      @article.reload
    end

    it 'status is ok' do
          subject
          expect(response.status).to eq 204
        end
    it { expect(@article.title).to eql attr[:title] }
    it { expect(@article.body).to eql attr[:body] }
  end

  describe 'DELETE destroy' do
    before(:each) {@article = create(:article)}
    it "destroys the requested article" do
      expect {delete :destroy, id: @article.id}.to change(Article, :count).by(-1)
      expect(response.status).to eq 204
      end
  end

end