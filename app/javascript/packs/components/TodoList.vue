<template>
  <ul>
    <li v-for="todo in todos">
      <todo :title="todo.title" :description="todo.description"></todo>
    </li>
  </ul>
</template>

<script>
import Todo from './Todo.vue'

export default {
  components: { Todo },
  props: {
    todos: Array
  }
}
</script>
