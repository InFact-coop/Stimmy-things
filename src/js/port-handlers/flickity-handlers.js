import app from '../elm-init';
import Flickity from 'flickity';

const onboardingCarousel = () => {
  setTimeout(() => {
    window.requestAnimationFrame(() => {
      const carouselElement = document.querySelector('.onboardingCarousel');
      const flkty = new Flickity(carouselElement, {
        adaptiveHeight: true,
        wrapAround: false,
        draggable: true,
        prevNextButtons: false,
        cellSelector: '.onboarding-carocell',
        imagesLoaded: true,
        pageDots: true
      });

      flkty.on('settle', index => {
        if (index === 2) {
          setTimeout(() => {
            app.ports.receiveLastOnboarding.send(true);
          }, 100);
        }
      });
      const previousButton = document.querySelector('.onboarding--back');
      previousButton.addEventListener('click', () => {
        flkty.previous();
      });
      const nextButton = document.querySelector('.onboarding--next');
      nextButton.addEventListener('click', () => {
        flkty.next();
      });
    });
  }, 1500);
};

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
  let embedSrc = chosenElement.href.replace('watch?v=', 'embed/');
  if (!embedSrc) embedSrc = '';
  app.ports.receiveChosenVideo.send(embedSrc);
};

export default {
  onboardingCarousel,
  initCarousel,
  videoCarousel,
  retrieveChosenAvatar,
  retrieveChosenVideo
};
