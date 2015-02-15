process.env.NODE_ENV='production';
var fs = require('fs'),
  mkdirp = require('mkdirp'),
  paths = require('./paths'),
  webpack = require('webpack'),
  config = require('./webpack.config');

webpack(config[1], function(err, stats) {

  if(err) {

    console.log(err);

  } else {

    var assets = 'public/assets',
      page = require('./dev/bundleStaticPage.js'),
      rss = require('./dev/bundleStaticRss.js');
    mkdirp.sync(assets);
    fs.writeFileSync(assets + '/main.css', fs.readFileSync('dev/main.css'));

    for(var path in paths.allPaths()) {
      if(path!=='posts') {
        mkdirp.sync('public' + path);
        fs.writeFileSync('public' + path + '/index.html', page(path));
        // console.log(path);
      }
    }

    mkdirp.sync('public/blog');
    for(var post in paths.allPosts()) {
      fs.writeFileSync('public/blog/' + post + '.html', page('/blog/' + post));
      // console.log('blog/' + post + '.html');
    }
    fs.writeFileSync('public/atom.xml', rss(page));

  }

  console.log('build complete');

});

