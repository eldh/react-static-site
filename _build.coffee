process.env.NODE_ENV = 'production'
fs = require 'fs'
React = require 'react/addons'
mkdirp = require 'mkdirp'
paths = require './paths'
webpack = require 'webpack'
config = require './webpack.config'

webpack config[1], (err, stats) ->
	if err
		console.log err
	else
		assets = 'public/assets'
		page = require './dev/bundleStaticPage.js'
		rss = require './dev/bundleStaticRss.js'
		mkdirp.sync assets
		fs.writeFileSync assets + '/main.css', fs.readFileSync 'dev/main.css'
		allPaths = paths.allPaths()
		for path of allPaths
			console.log 'PATH', path, allPaths[path]
			if path isnt 'posts'
				pathObj = allPaths[path]
				renderedPage = page '/' + path, null
				mkdirp.sync 'public/' + path
				fs.writeFileSync 'public/' + path + '/index.html', renderedPage
				console.log path, renderedPage

		mkdirp.sync 'public/blog'
		posts = paths.allPosts()
		for post of posts
			item = posts[post]
			fs.writeFileSync 'public/blog/' + post + '.html', page '/blog/' + post
		# fs.writeFileSync 'public/atom.xml', rss(page)
	# 	console.log 'build complete'

