<template>
  <footer>
    <div id="footer">
      <div class="footer-top">
        <div class="container">
          <div class="row">
            <div class="col-lg-6">
              <div class="footer-item">
                <h4>{{ $lang["About Us"] }}</h4>
                <p>{{ settings.about_us }}</p>

                <div class="single-footer social">
                  <ul>
                      <li v-if="settings.facebook_link != ''"><a :href="settings.facebook_link" target="_blank"><i class="icofont-facebook"></i></a></li>
                      <li v-if="settings.twitter_link != ''"><a :href="settings.twitter_link" target="_blank"><i class="icofont-twitter"></i></a></li>
                      <li v-if="settings.youtube_link != ''"><a :href="settings.youtube_link" target="_blank"><i class="icofont-youtube-play"></i></a></li>
                      <li v-if="settings.instagram_link != ''"><a :href="settings.instagram_link" target="_blank"><i class="icofont-instagram"></i></a></li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="col-lg-3">
              <div class="footer-item">
                <h4>{{ $lang["Important Links"] }}</h4>
                <ul>
                  <li v-for="p in pages" :key="p.id">
                    <router-link
                      :to="{ name: 'page', params: { slug: p.slug } }"
                    >
                      {{ p.title }}
                    </router-link>
                  </li>
                </ul>
              </div>
            </div>

            <div class="col-lg-3">
              <div class="footer-item">
                <h4>{{ $lang["Popular Category"] }}</h4>
                <ul>
                  <li v-for="pc in popularCategory" :key="pc.id">
                    <router-link
                      :to="{
                        name: 'categoryProducts',
                        params: { slug: pc.slug },
                      }"
                    >
                      {{ pc.name }}
                    </router-link>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="footer-bottom">
        <p>{{ settings.copyright }}</p>
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  computed: {
    settings: function () {
      return this.$store.getters["settings/settings"];
    },
    pages: function () {
      return this.$store.getters["settings/pages"];
    },
    popularCategory: function () {
      if (this.settings.footer_popular_category == "") {
        return [];
      }
      return this.$store.getters["category/allCategories"].filter(
        (category) =>
          this.settings.footer_popular_category.indexOf(category.id) != -1
      );
    },
  },
};
</script>
