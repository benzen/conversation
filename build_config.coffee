app_path = 'app'
src = 'src'
config =
  src: src
  app_path: app_path
  dist_path: 'dist'
  css_main_file: 'conversation.css'
  js_main_file: 'conversation.js'
  vendor_js: 'vendor.js'
  vendor_css: 'vendor.css'
  coffee_deps: [
    "#{src}/chat/chat.coffee"
    "#{src}/chat/markdownFilter.coffee"
    "#{src}/chat/momentFilter.coffee"
    "#{src}/config/**.coffee"
    "#{src}/index.coffee"
  ]
  jade_deps: "#{src}/**/*.jade"
  vendor_js_deps: [
    "node_modules/jquery/dist/jquery.js"
    "node_modules/angular/angular.js"
    "node_modules/angular-route/angular-route.js"
    "node_modules/angular-sanitize/angular-sanitize.js"
    "node_modules/semantic-ui/dist/js/semantic.js"
    "node_modules/markdown/lib/markdown.js"
    "node_modules/moment/moment.js"
  ]
  vendor_css_deps: [
    'node_modules/semantic-ui/dist/semantic.css*'
    'node_modules/font-awesome/css/font-awesome.css'  
  ]
  css_deps:  "src/**/*.css"
  fonts_deps: [
    'node_modules/font-awesome/fonts/fontawesome-webfont.eot'
    'node_modules/font-awesome/fonts/fontawesome-webfont.svg'
    'node_modules/font-awesome/fonts/fontawesome-webfont.ttf'
    'node_modules/font-awesome/fonts/fontawesome-webfont.woff'
  ]
  fucked_up_assets_deps: [
    'node_modules/semantic-ui/dist/themes/**'
  ]
  node_packages_deps: [
    'node_modules/simple-git/**'
  ]
  
module.exports = config
