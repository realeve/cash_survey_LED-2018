<template>
  <div>
    <div v-if="isPC">
      <div class="wrap-title">各单位参与人数排名</div>
      <div ref="chart" class="chart data-wrapper">
      </div>
    </div>
    <div v-else style="padding:10px;">
      <div class="item">
        <div class="sub-title">各单位参与人数排名</div>
        <div ref="chart" class="mobile"></div>
      </div>
    </div>
  </div>

</template>

<script>
import echarts from "echarts";
import barOption from "./js/baroption.js";

export default {
  computed: {
    chart() {
      return echarts.init(this.$refs.chart);
    },
    isPC() {
      return this.$store.state.isPC;
    }
    // cities() {
    //   return this.$store.state.top20Cities;
    // }
    // curCity: {
    //   get() {
    //     return this.$store.state.curCity;
    //   },
    //   set(val) {
    //     this.$store.commit("setCurCity", val);
    //   }
    // }
  },
  // watch: {
  //   cities(data) {
  //     this.chart.setOption(barOption.refresh(data));
  //   }
  // },
  methods: {
    resizeChart() {
      this.chart.resize();
    },
    initEvent() {
      window.onresize = () => {
        this.resizeChart();
      };

      // this.chart.on("click", params => {
      //   let city = params.name;
      //   if (typeof city == "undefined") {
      //     return;
      //   }
      //   this.curCity = city;
      // });
    },
    refreshChart() {
      this.chart.setOption(barOption.init());
    },
    init() {
      this.refreshChart();
      this.initEvent();
      this.loadData();
    },
    loadData() {
      let url =
        "http://cbpc540.applinzi.com/?s=/addon/Api/Api/getVoteCountByDept&sid=2";
      this.$http
        .jsonp(url)
        .then(res => {
          res.data = res.data.map((item, i) => {
            item.name = i + 1 + "." + item.name.replace("中国人民银行", "");
            return item;
          });
          this.chart.setOption(barOption.refresh(res.data));
        })
        .catch(e => console.log(e));
    }
  },
  mounted() {
    this.init();
  }
};
</script>

<style scoped lang="less">
.chart {
  min-height: 80vh;
  width: 100%;
}

.wrap-title {
  margin-bottom: 5px;
  color: rgb(255, 204, 0);
}
.mobile {
  width: 100%;
  min-height: 90vh;
}
</style>
