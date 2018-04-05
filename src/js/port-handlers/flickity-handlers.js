import app from '../elm-init';
import Flickity from 'flickity';

const initCarousel = () => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.makecarousel');
    const flkty = new Flickity(carouselElement, {
      adaptiveHeight: true,
      wrapAround: true,
      draggable: true,
      prevNextButtons: false,
      cellSelector: '.carousel-cell',
      imagesLoaded: true,
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
  app.ports.receiveChosenAvatar.send(chosenElement.firstChild.data);
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
