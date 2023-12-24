const gulp = require('gulp');
const autoprefixer = require('autoprefixer');
const browserSync = require('browser-sync');
const cp = require('child_process');
const cssnano = require('cssnano');
const postcss = require('gulp-postcss');
const sass = require('gulp-sass')(require('sass'));
const sourcemaps = require('gulp-sourcemaps');

var jekyll = process.platform === 'win32' ? 'jekyll.bat' : 'jekyll';
var messages = {
  jekyllBuild: '<span style="color: grey">Running:</span> $ jekyll build --drafts',
};

/**
 * Build the Jekyll Site
 */
gulp.task('jekyll-build', done => {
  browserSync.notify(messages.jekyllBuild);
  return cp.spawn(jekyll, ['build', '--drafts'], {stdio: 'inherit'}).on('close', done);
});

/**
 * Rebuild Jekyll & do page reload
 */
gulp.task(
  'jekyll-rebuild',
  gulp.series('jekyll-build', done => {
    browserSync.reload();
    done();
  })
);

/**
 * Compile files from _scss into both _site/css (for live injecting) and site (for future jekyll builds)
 */
gulp.task('sass', () => {
  return gulp
    .src('assets/scss/style.scss')
    .pipe(sourcemaps.init())
    .pipe(
      sass({
        includePaths: ['scss'],
        onError: browserSync.notify,
      })
    )
    .pipe(postcss([autoprefixer(), cssnano()]))
    .pipe(sourcemaps.write('.'))
    .pipe(gulp.dest('_site/assets/css'))
    .pipe(browserSync.reload({stream: true}))
    .pipe(gulp.dest('assets/css'));
});

/**
 * Wait for jekyll-build, then launch the Server
 */
gulp.task(
  'browser-sync',
  gulp.series('sass', 'jekyll-build', done => {
    browserSync({
      server: {
        baseDir: '_site',
      },
      port: 3005,
    });
    done();
  })
);

/**
 * Watch scss files for changes & recompile
 * Watch html/md files, run jekyll & reload BrowserSync
 */
gulp.task('watch', done => {
  gulp.watch(['assets/scss/*.scss', 'assets/scss/*/*.scss'], gulp.series('sass'));
  gulp.watch(
    [
      '*.html',
      '_layouts/*.html',
      '_posts/*',
      '_drafts/*',
      '_includes/*',
      '*.md',
      '_config.yml',
      'assets/js/*.js',
      'assets/js/*/*.js',
    ],
    gulp.series('jekyll-rebuild')
  );
});

/**
 * Default task, running just `gulp` will compile the sass,
 * compile the jekyll site, launch BrowserSync & watch files.
 */
gulp.task('default', gulp.series('browser-sync', 'watch'));
