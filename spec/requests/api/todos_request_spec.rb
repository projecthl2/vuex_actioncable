require "rails_helper"

RSpec.describe "Api::TodosController Request", type: :request do
  describe "GET #index" do
    subject { get "/api/v1/todos" }

    before do
      Fabricate :todo
      subject
    end

    it "ステータスコードは 200 を返す" do
      expect(response.status).to eq(200)
    end

    it "当該ページのビューが表示される" do
      expect(response).to render_template(:index)
    end

    it "レスポンスの JSON に todos 属性が含まれる" do
      expect(response.body).to have_json_path("todos")
    end

    it "todos 属性は title 属性を持つ" do
      expect(response.body).to have_json_path("todos/0/title")
    end

    it "todos 属性は description 属性を持つ" do
      expect(response.body).to have_json_path("todos/0/description")
    end

    it "todos 属性は id 属性を持つ" do
      expect(response.body).to have_json_path("todos/0/id")
    end
  end
end
