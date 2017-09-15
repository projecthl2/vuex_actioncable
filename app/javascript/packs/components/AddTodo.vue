<template>
  <section>
    <section>
      <label>タイトル</label>
      <input type="text" v-model="title" />
    </section>
    <section>
      <label>概要</label>
      <input type="text" v-model="description" />
    </section>
    <section>
      <button @click="post">追加</button>
    </section>
  </section>
</template>

<script>
export default {
  data () {
    return {
      title: "",
      description: ""
    }
  },
  methods: {
    post () {
      if(!(this.title && this.description)) {
        return
      }

      const todo = {
        title: this.title,
        description: this.description
      }
      this.$emit('post-from-child', todo)
      this.title = ""
      this.description = ""
    }
  }
}
</script>
