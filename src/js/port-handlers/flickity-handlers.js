import app from '../elm-init';
import Flickity from 'flickity';

const initCarousel = () => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.makecarousel');
    const flkty = new Flickity(carouselElement, {
      lazyLoad: true,
      adaptiveHeight: true,
      wrapAround: false,
      prevNextButtons: false,
      pageDots: true
    });
  });
};

const videoCarousel = () => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.youtubeCarousel');
    const flkty = new Flickity(carouselElement, {
      lazyLoad: true,
      adaptiveHeight: false,
      wrapAround: true,
      prevNextButtons: false,
      pageDots: false
    });
  });
};

const retrieveChosenAvatar = () => {
  const chosenElement = document.querySelector('.is-selected');
  app.ports.receiveChosenAvatar.send(chosenElement.src);
};

const retrieveChosenVideo = () => {
  const chosenElement = document.querySelector('.is-selected');
  const embedSrc = chosenElement.href.replace('watch?v=', 'embed/');
  app.ports.receiveChosenVideo.send(embedSrc);
};

export default {
  initCarousel,
  videoCarousel,
  retrieveChosenAvatar,
  retrieveChosenVideo
};
