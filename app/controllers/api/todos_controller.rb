class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
end
