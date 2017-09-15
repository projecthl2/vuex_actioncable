import 'babel-polyfill'
import Vue from 'vue'
import App from './containers/App.vue'
import axios from 'axios'
import store from './store'

// RoR の CSRF Token に対応
axios.defaults.headers['X-CSRF-TOKEN'] = document.getElementsByName('csrf-token')[0].getAttribute('content')

new Vue({
  el: '#app',
  store,
  render: h => h(App)
})
