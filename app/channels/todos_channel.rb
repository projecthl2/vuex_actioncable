class TodosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "todos_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def create(params)
    todo = Todo.create todo_params(params)
    ActionCable.server.broadcast "todos_channel", JSON.parse(todo.to_json)
  end

  protected

  def todo_params(params)
    ActionController::Parameters.new(params).permit(:title, :description)
  end
end
