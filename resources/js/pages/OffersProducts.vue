<template>
  <div>
    <section class="banner">
      <img class="page-banner" :src="bannerImage"/>
      <h2 class="page-title">{{ $lang["Special Offers"] }}</h2>
    </section>

    <section class="popular-items section">
      <div class="container-fluid" id="popular-items-container">
        <h3 class="section-heading">{{ $lang["Special Offers"] }}</h3>

        <ProductSkelton v-if="loading && load_more" />

        <Products :products="products" productType="offer" offerStyle="column-2" :loading="loading" />
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters, mapActions } from "vuex";
import ProductSkelton from "../components/skeleton/Products";
import Products from "../components/Products";
export default {
  data() {
    return {
      load_more: true,
    };
  },
  components: {
    ProductSkelton,
    Products,
  },
  computed: {
    ...mapGetters("offers", ["products", "loading", "init"]),
    settings: function () {
      return this.$store.getters["settings/settings"];
    },
    bannerImage() {
      if(this.settings.offer_page_banner != ""){
        return "/uploads/media/" + this.settings.offer_page_banner;
      }
      if (this.settings.home_banner != "") {
        return "/uploads/media/" + this.settings.home_banner;
      }
      return "/theme/img/main-banner.jpg";
    },
  },
  methods: {
    ...mapActions("offers", ["fetchProducts"]),
    infiniteHandler() {
      window.onscroll = () => {
        let _this = this;
        let bottomOfWindow =
          document.documentElement.scrollTop + window.innerHeight >
          document.documentElement.offsetHeight -
            document.getElementById("footer").offsetHeight;
        if (bottomOfWindow && this.load_more && this.init == true) {
          this.load_more = false;
          this.fetchProducts().then(function () {
            if (_this.init == true) {
              _this.load_more = true;
            }
          });
        }
      };
    },
  },
  created() {
    this.fetchProducts();
  },
  mounted() {
    this.infiniteHandler();
  },
};
</script>
