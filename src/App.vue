<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
  import qs from 'qs';
  export default {
    name: 'app',
    computed: {
      needRefresh: {
        get() {
          return this.$store.state.needRefresh;
        },
        set(val) {
          this.$store.commit('refresh', val);
        }
      }
    },
    mounted(){
      setInterval(()=>{
        this.needRefresh = true;
      },this.$store.state.refreshInterval);      
    }
  }

</script>

<style lang="less">
  @import '~vux/src/styles/reset.less';
  body{
    font-family: 'Pingfang SC','Pingfang','等线','dengxian','Helvatica','Microsoft Yahei','微软雅黑','Yahei'
  }
</style>
