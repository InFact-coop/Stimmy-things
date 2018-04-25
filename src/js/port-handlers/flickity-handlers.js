import app from '../elm-init';
import Flickity from 'flickity';

const onboardingCarousel = () => {
  window.requestAnimationFrame(() => {
    const carouselElement = document.querySelector('.onboardingCarousel');
    const flkty = new Flickity(carouselElement, {
      adaptiveHeight: true,
      wrapAround: false,
      draggable: true,
      prevNextButtons: false,
      cellSelector: '.onboarding-carocell',
      imagesLoaded: true,
      pageDots: true,
      on: {
        change: index => {
          if (index === 2) {
            app.ports.receiveLastOnboarding.send(true);
          } else {
            app.ports.receiveLastOnboarding.send(false);
          }
        }
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
      pageDots: true,
      on: {
        change: () => {
          const selectedAvatar = document.querySelector('.is-selected')
            .firstChild;

          const src = selectedAvatar.data;
          const skinColour = selectedAvatar.contentDocument
            .getElementById('body_change_colour')
            .getAttribute('fill');

          app.ports.updateAvatar.send({ src, skinColour });
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
  retrieveChosenVideo
};
