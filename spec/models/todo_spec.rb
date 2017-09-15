require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe "#new" do
    context "正常なデータを読み込んだ時" do
      let(:todo) { Fabricate :todo }

      subject { todo.valid? }

      it "正しいデータが作られる" do
        expect(subject).to be_truthy
      end
    end
  end
end
