gulp = require 'gulp'
coffee  = require 'gulp-coffee'
concat  = require 'gulp-concat'
jade = require "gulp-jade"
gutil   = require 'gulp-util'
zip = require 'gulp-zip'
rm = require 'gulp-rm'
bower = require 'gulp-bower'
build_config = require "./build_config"

gulp.task 'clean', (done) -> 
  gulp.src build_config.app_path+'/**/*',  read: false
  .pipe rm(async:false)
  .on 'error', gutil.log
  .on 'close', done


gulp.task 'coffee', ['clean'], (done) ->
  gulp.src build_config.coffee_deps
  .pipe coffee bare: true
  .pipe concat build_config.js_main_file
  .pipe gulp.dest build_config.app_path+'/js'
  .on 'error', gutil.log
  .on 'close', done

gulp.task 'jade', ['clean'], (done) ->
  gulp.src build_config.jade_deps
  .pipe jade pretty: true
  .pipe gulp.dest build_config.app_path+"/"
  .on 'error', gutil.log
  .on 'close', done

gulp.task 'front-js-vendor', ['clean'], (done)->
  gulp.src build_config.vendor_js_deps
  .pipe concat build_config.vendor_js
  .pipe gulp.dest build_config.app_path + "/js"
  .on 'error', gutil.log
  .on 'close', done


gulp.task 'front-css-vendor', ['clean'], (done) ->
  gulp.src build_config.vendor_css_deps
  .pipe concat build_config.vendor_css
  .pipe gulp.dest build_config.app_path + '/css'
  .on 'error', gutil.log
  .on 'close', done

gulp.task 'css', ['clean'], (done) -> 
  gulp.src build_config.css_deps
  .pipe concat build_config.css_main_file
  .pipe gulp.dest build_config.app_path + '/css'
  .on 'error', gutil.log
  .on 'close',  done

gulp.task 'fonts', ['clean'], (done) ->
  gulp.src build_config.fonts_deps
  .pipe gulp.dest build_config.app_path + '/fonts'
  .on 'close', done

gulp.task 'fucked-up-asset',['clean'], (done) ->
  gulp.src build_config.fucked_up_assets_deps
  .pipe gulp.dest build_config.app_path + '/css/themes'
  .on 'close', done

gulp.task 'node-packages', ['clean'], (done) ->
  gulp.src build_config.node_packages_deps
  .pipe gulp.dest build_config.app_path + '/node_modules/simple-git'
  .on 'close', done

gulp.task 'package', ['coffee', 'css', 'jade', 'front-js-vendor',
                      'front-css-vendor', 'fonts', 'fucked-up-asset', 
                      'node-packages'], ->
  gulp.src [build_config.app_path + '/**/*', 'package.json']
  .pipe zip 'conversation.nw'
  .pipe gulp.dest build_config.dist_path
  .on 'error', gutil.log

gulp.task 'default', ['package']
