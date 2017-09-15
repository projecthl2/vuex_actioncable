require "rails_helper"

class TestConnection
  attr_reader :identifiers, :logger

  def initialize(identifiers_hash = {})
    @identifiers = identifiers_hash.keys
    @logger = ActiveSupport::TaggedLogging.new(ActiveSupport::Logger.new(StringIO.new))

    identifiers_hash.each do |identifier, value|
      define_singleton_method(identifier) do
        value
      end
    end
  end
end

RSpec.describe TodosChannel, type: :cable do
  let(:channel) { TodosChannel.new(connection, {}) }
  let(:connection) { TestConnection.new }
  let(:action_cable) { ActionCable.server }

  describe "#create" do
    subject { channel.perform_action(params) }

    let(:params) { { "action" => "create", "title" => "タイトル", "description" => "概要" } }

    it "レコードが登録される" do
      expect{ subject }.to change { Todo.count }.by(1)
    end

    it "ブロードキャストされたデータを受け取れる" do
      expect(action_cable).to receive(:broadcast)
      subject
    end
  end
end
