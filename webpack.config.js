const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const { GenerateSW } = require('workbox-webpack-plugin');
const AppCachePlugin = require('appcache-webpack-plugin');

const devConfig = {
  entry: './src/js/index.js',
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public')
  },
  devServer: {
    overlay: true,
    open: true,
    contentBase: path.resolve(__dirname, 'public')
  },
  module: {
    rules: [
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader',
        options: {
          debug: true,
          warn: true
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          { loader: 'css-loader', options: { importLoaders: 1 } },
          'postcss-loader'
        ]
      },
      {
        test: /\.ttf$/,
        use: {
          loader: 'file-loader',
          options: {
            name: 'fonts/[name].[ext]'
          }
        }
      }
    ]
  },
  // devtool: 'eval',
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html'
    }),
    new CopyWebpackPlugin([{ from: 'src/assets', to: 'assets' }])
  ]
};

const prodConfig = {
  entry: ['babel-polyfill', './src/js/index.js'],
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'public')
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
            plugins: [require('@babel/plugin-proposal-object-rest-spread')]
          }
        }
      },
      {
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        loader: 'elm-webpack-loader'
      },
      {
        test: /\.css$/,
        use: [
          MiniCssExtractPlugin.loader,
          { loader: 'css-loader', options: { importLoaders: 1 } },
          'postcss-loader'
        ]
      },
      {
        test: /\.ttf$/,
        use: {
          loader: 'file-loader',
          options: {
            name: 'fonts/[name].[ext]'
          }
        }
      }
    ]
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './src/index.html'
    }),
    new MiniCssExtractPlugin(),
    new CopyWebpackPlugin([
      { from: 'src/assets', to: 'assets' },
      { from: 'src/manifest.json' }
    ]),
    new GenerateSW({
      clientsClaim: true,
      skipWaiting: true
    }),
    new AppCachePlugin({
      cache: [
        'assets/CreateAvatar/paint_btn_7.svg',
        'main.css',
        'assets/CreateAvatar/paint_btn_9.svg',
        'fonts/wellcome-bold-webfont.ttf',
        'index.html',
        'fonts/WorkSans-Regular.ttf',
        'assets/Landing/add_stim_btn.svg',
        'assets/StimTimer/timer_replay_btn.svg',
        'assets/StimTimer/white_divider_zigzag_thin.svg',
        'fonts/WorkSans-Bold.ttf',
        'bundle.js',
        'assets/avatar_5_head.svg',
        'assets/avatar_6_head.svg',
        'assets/avatar_4_head.svg',
        'assets/avatar_3_head.svg',
        'assets/avatar_2_head.svg',
        'assets/avatar_1_head.svg',
        'assets/Landing/menu-drawer/about_btn.svg',
        'assets/AddStim/youtube_logo.png',
        'assets/AddStim/zigzag_add_video_bg.svg',
        'assets/AddStim/zigzag_add_stim_save.png',
        'assets/AddStim/zigzag_big_grey_down.svg',
        'assets/AddStim/zigzag_choose_part_tags_bg.svg',
        'assets/AddStim/zigzag_stim_how_to_bg.svg',
        'assets/StimTimer/timer_play_btn.svg',
        'assets/StimTimer/timer_pause_btn.svg',
        'assets/StimTimer/timer_icn.svg',
        'assets/StimTimer/timer_done_btn.svg',
        'assets/StimRecap/instruction_icn.svg',
        'assets/Blog/like_blog.svg',
        'assets/StimRecap/zigzag_stim_how_to_bg.svg',
        'assets/Blog/like_filled_blog.svg',
        'assets/Blog/upload_stim_icn.svg',
        'assets/CreateAvatar/avatar_2.svg',
        'assets/CreateAvatar/avatar_3.svg',
        'assets/CreateAvatar/avatar_1.svg',
        'assets/CreateAvatar/avatar_4.svg',
        'assets/CreateAvatar/avatar_5.svg',
        'assets/CreateAvatar/done_green_small.svg',
        'assets/CreateAvatar/avatar_6.svg',
        'assets/CreateAvatar/paint_btn_10.svg',
        'assets/CreateAvatar/paint_btn_1.svg',
        'assets/CreateAvatar/paint_btn_12.svg',
        'assets/CreateAvatar/paint_btn_11.svg',
        'assets/CreateAvatar/paint_btn_13.svg',
        'assets/CreateAvatar/paint_btn_14.svg',
        'assets/CreateAvatar/paint_btn_2.svg',
        'assets/CreateAvatar/paint_btn_3.svg',
        'assets/CreateAvatar/paint_btn_5.svg',
        'assets/CreateAvatar/paint_btn_6.svg',
        'assets/CreateAvatar/paint_btn_4.svg',
        'assets/CreateAvatar/paint_btn_8.svg',
        'assets/StimRecap/add_video_icn.svg',
        'assets/StimRecap/divider_zigzag_grey.svg',
        'assets/StimPreparation/zigzag_how_you_feel_before_bg.svg',
        'assets/StimPreparation/face_4.svg',
        'assets/Landing/arrow-left-not-animated.svg',
        'assets/Landing/menu-hotspots/stim_delete_btn.svg',
        'assets/Landing/menu-hotspots/upload_stim_icon_green.svg',
        'assets/Landing/Menu-animated.svg',
        'assets/Landing/menu-drawer/blog_btn.svg',
        'assets/AddStim/zigzag_add_stim_save.svg',
        'assets/Landing/menu-drawer/buttons.svg',
        'assets/Landing/menu-drawer/emergency_btn.svg',
        'assets/Landing/menu.svg',
        'assets/Landing/menu-not-animated.svg',
        'assets/Landing/menu-drawer/help_btn.svg',
        'assets/Landing/menu-drawer/user_btn.svg',
        'assets/Landing/shuffle_stim_btn.svg',
        'assets/NameAvatar/back_arrow_green.svg',
        'assets/Onboarding/onboarding_1.svg',
        'assets/Onboarding/onboarding_2.svg',
        'assets/ShareModal/zigzag_modal_bg.svg',
        'assets/Onboarding/zigzag_green_onboarding.svg',
        'assets/ShareModal/share_to_blog_icn.svg',
        'assets/Onboarding/Splash3.png',
        'assets/StimInfo/close_btn_white.svg',
        'assets/StimInfo/add_video_icn.svg',
        'assets/StimInfo/divider_zigzag_grey_small.svg',
        'assets/StimInfo/timer_icn_dark.svg',
        'assets/Splash/Stimmy-splash-GIF.gif',
        'assets/StimInfo/divider_zigzag_grey.svg',
        'assets/StimPreparation/close_btn_white.svg',
        'assets/StimInfo/instruction_icn.svg',
        'assets/StimPreparation/back_btn_white.svg',
        'assets/StimPreparation/about_btn.svg',
        'assets/StimPreparation/divider_zigzag_grey_small.svg',
        'assets/StimPreparation/face_1.svg',
        'assets/StimPreparation/face_2.svg',
        'assets/StimPreparation/face_3.svg',
        'assets/StimPreparation/timer_icn.svg',
        'assets/StimPreparation/face_5.svg',
        'assets/StimPreparation/slider_counter_tag.svg',
        'assets/About/close_btn_white.svg',
        'assets/About/help_icn.svg',
        'assets/About/more_info_icn_sm.svg',
        'assets/About/share_icn_sm.svg',
        'assets/About/white_divider_zigzag_thick.svg',
        'assets/About/help_btn.svg',
        'assets/AddStim/add_video_icn.svg',
        'assets/AddStim/back_btn_white.svg',
        'assets/AddStim/done_green_medium.svg',
        'assets/About/add_stim_icn_sm.svg'
      ],
      network: ['*'],
      fallback: [],
      settings: ['prefer-online'],
      exclude: [/.*\.DS_Store$/],
      output: 'stimmythings.appcache'
    })
  ]
};

module.exports = env => (env.DEV ? devConfig : prodConfig);

//   {
//     entry: './tests/front-end/qunit.js',
//     output: {
//       filename: 'test-bundle.js',
//       path: path.resolve(__dirname, 'tests', 'front-end')
//     }
//   }
