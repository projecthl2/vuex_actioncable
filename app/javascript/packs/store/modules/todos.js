import axios from 'axios'
import * as types from '../mutation-types'

const state = {
  todos: []
}

const getters = {
  todos: state => state.todos
}

const actions = {
  fetchTodos ({ commit, state }) {
    axios.get(`/api/v1/todos`)
      .then(response => commit(types.FETCH_TODOS, response))
      .catch(response => alert("情報取得に失敗しました"))
  },
  createTodo ({ commit, state }, todo) {
    commit(types.CREATE_TODO, todo)
  }
}

const mutations = {
  [types.FETCH_TODOS] (state, response) {
    state.todos = response.data.todos
  },
  [types.CREATE_TODO] (state, todo) {
    state.todos.push({
      id: todo.id,
      title: todo.title,
      description: todo.description
    })
  }
}

export default {
  state,
  getters,
  actions,
  mutations
}
