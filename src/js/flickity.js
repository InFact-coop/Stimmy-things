import app from './elm-init';
import Flickity from 'flickity';

const initCarousel = () => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.makecarousel');
    const flkty = new Flickity(carouselElement, {
      lazyLoad: true,
      adaptiveHeight: true,
      wrapAround: true,
      prevNextButtons: false,
      pageDots: true
    });
  });
};

export default { initCarousel };
