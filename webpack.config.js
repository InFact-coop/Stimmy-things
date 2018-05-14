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
      { from: 'src/manifest.json' },
      { from: 'src/favicon.ico' }
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
        'assets/Landing/add_stim_btn.svg',
        'fonts/WorkSans-Regular.ttf',
        'assets/TimerPreparation/timer_icn.svg',
        'assets/TimerPreparation/zigzag_how_you_feel_before_bg.svg',
        'fonts/WorkSans-Bold.ttf',
        'bundle.js',
        'assets/avatar_6_head.svg',
        'assets/avatar_3_head.svg',
        'assets/avatar_5_head.svg',
        'assets/avatar_4_head.svg',
        'assets/avatar_2_head.svg',
        'assets/avatar_1_head.svg',
        'assets/Landing/menu-drawer/emergency_btn.svg',
        'assets/AddStim/done_green_medium.svg',
        'assets/AddStim/zigzag_add_stim_save.png',
        'assets/AddStim/zigzag_add_video_bg.svg',
        'assets/AddStim/youtube_logo.png',
        'assets/AddStim/zigzag_big_grey_down.svg',
        'assets/AddStim/zigzag_choose_part_tags_bg.svg',
        'assets/TimerPreparation/slider_counter_tag.svg',
        'assets/AddStim/zigzag_stim_how_to_bg.svg',
        'assets/TimerPreparation/face_5.svg',
        'assets/TimerPreparation/face_4.svg',
        'assets/TimerPreparation/face_3.svg',
        'assets/TimerPreparation/face_2.svg',
        'assets/Blog/upload_stim_icn.svg',
        'assets/TimerPreparation/divider_zigzag_grey_small.svg',
        'assets/Blog/like_filled_blog.svg',
        'assets/CreateAvatar/avatar_1.svg',
        'assets/CreateAvatar/avatar_4.svg',
        'assets/CreateAvatar/avatar_2.svg',
        'assets/Blog/like_blog.svg',
        'assets/CreateAvatar/avatar_3.svg',
        'assets/CreateAvatar/avatar_5.svg',
        'assets/CreateAvatar/paint_btn_1.svg',
        'assets/CreateAvatar/avatar_6.svg',
        'assets/CreateAvatar/done_green_small.svg',
        'assets/CreateAvatar/paint_btn_10.svg',
        'assets/CreateAvatar/paint_btn_12.svg',
        'assets/CreateAvatar/paint_btn_14.svg',
        'assets/CreateAvatar/paint_btn_11.svg',
        'assets/CreateAvatar/paint_btn_13.svg',
        'assets/CreateAvatar/paint_btn_2.svg',
        'assets/CreateAvatar/paint_btn_3.svg',
        'assets/CreateAvatar/paint_btn_5.svg',
        'assets/CreateAvatar/paint_btn_4.svg',
        'assets/CreateAvatar/paint_btn_6.svg',
        'assets/CreateAvatar/paint_btn_8.svg',
        'assets/TimerPreparation/face_1.svg',
        'assets/TimerPreparation/close_btn_white.svg',
        'assets/Icons/phone_icn_round.png',
        'assets/TimerPreparation/about_btn.svg',
        'assets/Timer/white_divider_zigzag_thin.svg',
        'assets/Landing/arrow-left-not-animated.svg',
        'assets/Landing/Menu-animated.svg',
        'assets/Icons/phone_icn_square.png',
        'assets/Landing/menu-drawer/buttons.svg',
        'assets/AddStim/zigzag_add_stim_save.svg',
        'assets/Landing/menu-drawer/blog_btn.svg',
        'assets/Landing/menu-drawer/about_btn.svg',
        'assets/Landing/menu-drawer/help_btn.svg',
        'assets/Landing/menu-hotspots/stim_delete_btn.svg',
        'assets/Landing/menu-hotspots/upload_stim_icon_green.svg',
        'assets/Landing/menu-drawer/user_btn.svg',
        'assets/Landing/menu-not-animated.svg',
        'assets/Landing/shuffle_stim_btn.svg',
        'assets/NameAvatar/back_arrow_green.svg',
        'assets/Landing/menu.svg',
        'assets/Onboarding/onboarding_1.svg',
        'assets/Onboarding/onboarding_2.svg',
        'assets/Onboarding/zigzag_green_onboarding.svg',
        'assets/Onboarding/onboarding_3.svg',
        'assets/ShareModal/share_to_blog_icn.svg',
        'assets/Onboarding/Splash3.png',
        'assets/ShareModal/zigzag_modal_bg.svg',
        'assets/StimFinish/background_card.svg',
        'assets/Splash/Stimmy-splash-GIF.gif',
        'assets/StimFinish/text.svg',
        'assets/StimInfo/close_btn_white.svg',
        'assets/StimFinish/ribbon.svg',
        'assets/StimInfo/add_video_icn.svg',
        'assets/StimInfo/divider_zigzag_grey_small.svg',
        'assets/StimInfo/divider_zigzag_grey.svg',
        'assets/StimInfo/timer_icn_dark.svg',
        'assets/StimInfo/instruction_icn.svg',
        'assets/Timer/timer_done_btn.svg',
        'assets/Timer/timer_play_btn.svg',
        'assets/Timer/timer_icn.svg',
        'assets/Timer/timer_pause_btn.svg',
        'assets/Timer/timer_replay_btn.svg',
        'assets/TimerPreparation/back_btn_white.svg',
        'assets/About/close_btn_white.svg',
        'assets/About/help_icn.svg',
        'assets/About/share_icn_sm.svg',
        'assets/About/more_info_icn_sm.svg',
        'assets/About/white_divider_zigzag_thick.svg',
        'assets/AddStim/close_btn_white.svg',
        'assets/AddStim/back_btn_white.svg',
        'assets/AddStim/add_video_icn.svg',
        'assets/About/help_btn.svg',
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
