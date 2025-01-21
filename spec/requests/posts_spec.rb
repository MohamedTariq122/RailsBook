require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    it "allows guest users to view posts index" do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:id" do
    let(:post) { create(:post) }
    
    it "allows guest users to view individual posts" do
      get post_path(post)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /posts" do
    let(:post_attributes) { attributes_for(:post) }
    subject { post posts_path, params: { post: post_attributes } }

    it_behaves_like "guest user restrictions"
  end

  describe "PATCH /posts/:id" do
    let(:existing_post) { create(:post) }
    subject { patch post_path(existing_post), params: { post: { title: "Updated" } } }

    it_behaves_like "guest user restrictions"
  end

  describe "DELETE /posts/:id" do
    let(:existing_post) { create(:post) }
    subject { delete post_path(existing_post) }

    it_behaves_like "guest user restrictions"
  end
end
