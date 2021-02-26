

var swiper = new Swiper('.swiper-container.swiper1', {
  spaceBetween: 30,
  centeredSlides: true,
  effect: 'fade',
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
  },
  loop: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true,
  },
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});


var swiper = new Swiper('.swiper-container.swiper2', {
  direction: 'vertical',
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
  },
  loop: true,
  slidesPerView: 1,
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});
