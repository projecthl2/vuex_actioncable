<template>
  <add-todo @post-from-child="post"></add-todo>
</template>

<script>
import ActionCable from 'actioncable'
import AddTodo from '../components/AddTodo.vue'

let channel = null

export default {
  components: { AddTodo },
  methods: {
    post (todo) {
      channel.perform("create", {
        title: todo.title,
        description: todo.description
      })
    }
  },
  created () {
    const cable = ActionCable.createConsumer()
    const received = data => this.$store.dispatch('createTodo', data)
    channel = cable.subscriptions.create({
      channel: "TodosChannel"
    },
    {
      received: received
    })
  }
}
</script>
