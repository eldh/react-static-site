var fs, _, pages, posts;

_ = require('lodash');

fs = require('fs');

module.exports = function(source) {
  this.cacheable();
  return JSON.stringify(posts());
};

posts = function() {
  var date, dir, file, files, md, obj, title, url, _i, _len;
  dir = './posts';
  files = fs.readdirSync(dir, 'utf8');
  obj = {};
  for (_i = 0, _len = files.length; _i < _len; _i++) {
    file = files[_i];
    md = file;
    url = _.kebabCase(file.slice(11, file.length - 3));
    date = file.slice(0, 10);
    title = _.capitalize(url.replace(/\-/g, ' '));
    obj[url] = {
      url: url,
      md: md,
      date: date,
      title: title
    };
  }
  return obj;
};

