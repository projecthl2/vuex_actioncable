<template>
  <div id="root">
    <add-todo-container></add-todo-container>
    <todo-list-container></todo-list-container>
  </div>
</template>

<script>
import TodoListContainer from './TodoListContainer.vue'
import AddTodoContainer from './AddTodoContainer.vue'

export default {
  components: { TodoListContainer, AddTodoContainer }
}
</script>
