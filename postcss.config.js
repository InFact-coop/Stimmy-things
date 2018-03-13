module.exports = {
  /* each of these plugins allows you to write css with special syntax
     Or transforms the output into a more desirable format
  */
  plugins: [
    require('postcss-import'), // allows you to use @import
    require('autoprefixer'), // adds vendor prefixes like -webkit or -moz to your css for better support
    require('postcss-custom-media'), // can set media queries as variables
    require('postcss-custom-properties'), // allows you to use css variables e.g. var(--my-variable)
    require('postcss-clean') // minifies the output css (i.e. removes all the spaces and comments)
  ]
}
