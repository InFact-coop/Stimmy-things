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
      pageDots: true,
      on: {
        change: () => {
          const avatarSkinColour = document
            .querySelector('.is-selected')
            .firstChild.contentDocument.getElementById('body_change_colour')
            .getAttribute('fill');

          app.ports.updateSkinColour.send(avatarSkinColour);
        }
      }
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
  let embedSrc = chosenElement.href.replace('watch?v=', 'embed/');
  if (!embedSrc) embedSrc = '';
  app.ports.receiveChosenVideo.send(embedSrc);
};

export default {
  initCarousel,
  videoCarousel,
  retrieveChosenAvatar,
  retrieveChosenVideo
};
