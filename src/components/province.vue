<template>
  <div>
    <full-image/>
    <template v-if="isPC">
      <v-header/>
      <span class="info">下次更新: {{nextTime}}<br>点击省份查看详情</span>
      <flexbox :gutter="0" wrap="wrap" class="content">
        <flexbox-item :span="1/7">
          <v-left class="left-content" />
        </flexbox-item>
        <flexbox-item :span="4/7">
          <v-center class="center-content" />
        </flexbox-item>
        <flexbox-item :span="2/7">
          <v-right class="right-content" />
        </flexbox-item>
      </flexbox>
    </template>
    <template v-else>
      <!-- <span class="tip-mobile-left">通过人数: {{passedCount}}</span> -->
      <span class="tip-mobile-left">2018年现金使用情况调查</span>
      <span class="tip-mobile">参与人数: {{peopleCount}}</span>
      <div class="content">
        <v-center class="center-content" />
        <!-- <v-left class="left-content" /> -->
        <v-right class="right-content" />
      </div>
    </template>
  </div>
</template>

<script>
import FullImage from "./IFullImage/index";
import VHeader from "./Header/";
import VCenter from "./Center.vue";
import VLeft from "./Left.vue";
import VRight from "./Right.vue";

import { Flexbox, FlexboxItem } from "vux";

export default {
  components: {
    Flexbox,
    FlexboxItem,
    FullImage,
    VHeader,
    VLeft,
    VCenter,
    VRight
  },
  computed: {
    nextTime() {
      return this.$store.state.nextTime;
    },
    isPC() {
      return this.$store.state.isPC;
    },
    peopleCount() {
      return this.$store.state.peopleCount;
    }
    // passedCount() {
    //   return this.$store.state.passedCount;
    // }
  }
};
</script>
<style scoped lang="less">
@padding-top: 0px;
@div-offset: 50px;
.content {
  margin-top: @div-offset;
  color: #fff;
}

.center-content {
  padding: @padding-top 0px 0 0px;
}

.left-content {
  padding: @padding-top 5px 0px 0px;
}

.right-content {
  padding: @padding-top 0px 0px 0px;
  // margin-top: -150px;
}

.info {
  position: absolute;
  right: 5px;
  top: 5px;
  color: #f2f2f2;
  line-height: 14px;
  font-size: 9pt;
}

.tip-mobile {
  text-align: right;
  color: #fff;
  position: absolute;
  right: 5px;
  top: 5px;
  font-size: 12pt;
}

.tip-mobile-left {
  color: #fff;
  position: absolute;
  left: 5px;
  top: 5px;
  font-size: 12pt;
}

.info-left {
  position: absolute;
  left: 10px;
  top: 10px;
  color: #f2f2f2;
  line-height: 14px;
  font-size: 9pt;
}
</style>
