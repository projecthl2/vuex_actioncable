<template>
  <todo-list :todos="todos"></todo-list>
</template>

<script>
import { mapGetters } from 'vuex'
import TodoList from '../components/TodoList.vue'

export default {
  components: { TodoList },
  computed: mapGetters({
    todos: "todos"
  }),
  created () {
    this.$store.dispatch('fetchTodos')
  }
}
</script>
