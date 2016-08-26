gulp = require('gulp')
jade = require('gulp-jade')
sass = require('gulp-sass')
concatCss = require('gulp-concat-css')
autoprefixer = require('gulp-autoprefixer')
coffee = require('gulp-coffee')
rjs = require ('gulp-requirejs')
uglify = require('gulp-uglify')
clean = require('gulp-clean')
wiredep = require('wiredep').stream
useref = require('gulp-useref')
gulpif = require('gulp-if')
notify = require('gulp-notify')
svgSprite = require("gulp-svg-sprites")
mainBowerFiles = require('gulp-main-bower-files')
gulpFilter = require('gulp-filter')
browserSync = require('browser-sync').create()

# SERVER #############################################
gulp.task 'serve', ->
    browserSync.init
      server: "dist/"
    browserSync.watch('dist/').on('change', browserSync.reload)

# JADE #############################################
gulp.task 'jade', ->
  gulp.src 'app/jade/index.jade'
    .pipe jade(pretty: true).on 'error', notify.onError()
    .pipe gulp.dest 'dist'
    # clean
    # gulp.src 'dist/includes/', read: no
    #   .pipe do clean

# SASS #############################################
gulp.task 'sass',  ->
  gulp.src('app/sass/**/*.sass')
    .pipe sass(outputStyle: 'compressed').on 'error', notify.onError()
    # .pipe sass
    #.pipe concatCss("sass/bundle.css")
    .pipe autoprefixer('last 2 version', '> 1%', 'IE 9' )
    .pipe gulp.dest 'dist/css'


# SVG #############################################
gulp.task 'sprites', ->
  options = {
    #mode: "defs"
    baseSize: 30
    padding: 5
    #selector: "icon-%f"
    preview: false
    templates: { scss: true }
    cssFile: "../../../app/sass/_sprite.scss"
  }
  gulp.src('app/svg/*.svg')
    .pipe(svgSprite(options))
    .pipe gulp.dest('dist/images/icons')

##############################


gulp.task 'main-bower-files', ->
  filterJS = gulpFilter('*.js', { restore: true })
  gulp.src('./bower.json').pipe(mainBowerFiles(
    overrides:
      almond:
        "ignore": true
      jquery:
        main: ["./dist/jquery.min.js"]
      "slick-carousel":
        main: ["./**/slick.min.js", "./**/fonts/*.*", "./**/*.css", "./**/*.gif"]
    ))
    # .pipe(filterJS)
    # .pipe(filterJS.restore)
    .pipe gulp.dest('dist/lib')

# BUILD #############################################
gulp.task 'build', ['coffee'], ->
  rjs
    baseUrl: 'js'
    name: '../app/bower_components/almond/almond'
    include: ['main']
    insertRequire: ['main']
    out: 'all.js'
    wrap: on
  #.pipe do uglify
  .pipe gulp.dest 'dist/js'

  gulp.src 'js/', read: no
    .pipe do clean

# COFFEE ############################################
gulp.task 'coffee', ->
  gulp.src('app/coffee/*.coffee')
  # .pipe coffee(bare: true).on 'error', notify.onError()
    .pipe do coffee
    .pipe gulp.dest 'js'

# WATCH #############################################
gulp.task 'watch', ->
  gulp.watch 'app/jade/**/*.jade', ['jade']
  gulp.watch 'app/sass/**/*.sass', ['sass']
  gulp.watch 'app/coffee/*.coffee', ['coffee', 'build']

# DEFAULT #############################################
gulp.task 'default', ['jade', 'sass', 'watch', 'build', 'serve']