const router = require('express').Router();
const fs = require('fs');
const request = require('request');

if (process.env.NODE_ENV !== 'production' && !process.env.CI) {
  require('dotenv').config();
}

router.route('/upload-stim').post((req, res, next) => {
  console.log('test route working');
});

router.route('/youtube').get((req, res, next) => {
  const query = req.url.split('?q=')[1];
  request(
    `https://www.googleapis.com/youtube/v3/search?q=${query}&safeSearch=strict&part=snippet&key=${
      process.env.GOOGLE_API_KEY
    }`,
    (err, apiResponse) => {
      if (err) console.log('ERROR', err);

      const parsed = JSON.parse(apiResponse.body);
      const responseItems = parsed.items

        .map(video => {
          return {
            id: video.id.videoId,
            title: video.snippet.title,
            description: video.snippet.description,
            thumbnail: video.snippet.thumbnails.medium.url
          };
        })
        .filter(
          video =>
            video.id && video.title && video.description && video.thumbnail
        );
      return res.json(responseItems);
    }
  );
});
module.exports = router;
