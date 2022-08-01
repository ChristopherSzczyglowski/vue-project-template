/**
 * Fix: matchMedia not present, legacy browsers require a polyfill. Triggered by
 * vue-slick-carousel package.
 */
global.matchMedia =
  global.matchMedia ||
  function () {
    return {
      matches: false,
      addListener: function () {},
      removeListener: function () {},
    };
  };
