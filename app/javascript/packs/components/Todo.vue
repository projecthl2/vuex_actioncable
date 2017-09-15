<template>
  <section>
    <h2>{{ title }}</h2>
    <p>{{ description }}</p>
  </section>
</template>

<script>
export default {
  props: {
    title: String,
    description: String
  }
}
</script>
