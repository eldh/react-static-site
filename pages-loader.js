var fs, _, pages, posts;

_ = require('lodash');

fs = require('fs');

module.exports = function(source) {
  this.cacheable();
  return JSON.stringify(pages());
};
pages = function() {
  var dir, file, fileName, files, name, obj, title, url, _i, _len;
  dir = './pages';
  files = fs.readdirSync(dir, 'utf8');
  obj = {};
  for (_i = 0, _len = files.length; _i < _len; _i++) {
    file = files[_i];
    fileName = file;
    url = _.kebabCase(file.split('.')[0]);
    title = _.capitalize(url.replace(/\-/g, ' '));
    name = '' + url;
    if (url === 'home' || url === 'index') {
      url = '/';
    }
    obj[url] = {
      name: name,
      url: url,
      fileName: fileName,
      title: title
    };
  }
  return obj;
};

