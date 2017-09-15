require "rails_helper"

RSpec.describe "TodosController Request", type: :request do
  describe "GET #index" do
    subject { get "/todos" }

    before { subject }

    it "ステータスコードは 200 を返す" do
      expect(response.status).to eq(200)
    end

    it "当該ページのビューが表示される" do
      expect(response).to render_template(:index)
    end
  end
end
