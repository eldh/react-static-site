_ = require 'lodash'
postinfo = require './dev/buildPaths.coffee'

posts = postinfo.posts
pages = postinfo.pages

module.exports =

	allPaths: ->
		console.log pages
		_.assign {}, pages, { posts }

	allPosts: ->
		posts

	allPages: ->
		pages

	pageForPath: (path) ->
		@pageReq() './' + pages[path].fileName

	postForPath: (path) ->
		@postReq() './' + posts[path].md

	pageReq: ->
		require.context './pages', false, /^\.\/.*\.html$/

	postReq: ->
		require.context './posts', false, /^\.\/.*\.md$/


# paths =
# 	'/':
# 		title: 'Home'
# 		page: 'home.html'
# 	'/about':
# 		title: 'About'
# 		page: 'about.html'
# 	'/blog': title: 'Blog'
# 	posts:
# 		first_post:
# 			title: 'My First Blog Post'
# 			md: 'first_post.md'
# 			published: '2015-01-01'
# 			preview: 'Everyone has to start somewhere.'
# 		second_post:
# 			title: 'I Blogged Again'
# 			md: 'blogged_again.md'
# 			published: '2015-01-03'
# 			preview: 'Oops I did it again.'
