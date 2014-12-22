gulp = require 'gulp'
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'
jade = require "gulp-jade"
gutil   = require 'gulp-util'
zip = require 'gulp-zip'
rm = require 'gulp-rm'
bower = require 'gulp-bower'
build_config = require "./build_config"

gulp.task 'clean', -> 
  gulp.src build_config.app_path+'/**/*',  read: false 
    .pipe rm async:false
     .on 'error', gutil.log

gulp.task 'coffee', ['clean'], ->
  deps = [
    "#{build_config.src}/chat/chat.coffee"
    "#{build_config.src}/chat/markdownFilter.coffee"
    "#{build_config.src}/chat/momentFilter.coffee"
    "#{build_config.src}/index.coffee"
  ]
  gulp.src deps
  .pipe coffee bare: true
  .pipe concat build_config.js_main_file
  .pipe gulp.dest build_config.app_path+'/js'
  .on 'error', gutil.log

gulp.task 'jade', ['clean'], ->
  gulp.src build_config.src + '/**/*.jade'
  .pipe jade pretty: true
  .pipe gulp.dest build_config.app_path+"/"
  .on 'error', gutil.log

gulp.task 'front-js-vendor', ['clean'], ->
  deps = [
   "node_modules/jquery/dist/jquery.js"
   "node_modules/angular/angular.js"
   "node_modules/angular-route/angular-route.js"
   "node_modules/angular-sanitize/angular-sanitize.js"
   "node_modules/semantic-ui/dist/js/semantic.js"
   "node_modules/markdown/lib/markdown.js"
   "node_modules/moment/moment.js"
  ]
  gulp.src deps
  .pipe concat build_config.vendor_js
  .pipe gulp.dest build_config.app_path + "/js"
  .on 'error', gutil.log


gulp.task 'front-css-vendor', ['clean'], ->
  deps = [
    'node_modules/semantic-ui/dist/semantic.css*'
    'node_modules/font-awesome/css/font-awesome.css'
  ]
  gulp.src deps
  .pipe concat build_config.vendor_css
  .pipe gulp.dest build_config.app_path + '/css'
  .on 'error', gutil.log

gulp.task 'fonts', ['clean'], ->
  deps = [
    'node_modules/font-awesome/fonts/fontawesome-webfont.eot'
    'node_modules/font-awesome/fonts/fontawesome-webfont.svg'
    'node_modules/font-awesome/fonts/fontawesome-webfont.ttf'
    'node_modules/font-awesome/fonts/fontawesome-webfont.woff'
  ]
  gulp.src deps
  .pipe gulp.dest build_config.app_path + '/fonts'

gulp.task 'package', ['coffee', 'jade', 'front-js-vendor', 'front-css-vendor', 'fonts'], ->
  gulp.src [build_config.app_path + '/**/*', 'package.json']
  .pipe zip 'conversation.nw'
  .pipe gulp.dest build_config.dist_path
  .on 'error', gutil.log

gulp.task 'default', ['package']
