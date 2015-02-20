_ = require 'lodash'
posts = require './dev/posts'
pages = require './dev/pages'

module.exports =

	allPaths: ->
		console.log pages
		_.assign {}, pages, { posts }

	allPosts: ->
		posts

	allPages: ->
		pages

	pageForPath: (path) ->
		console.log 'pageForPath:::', path
		require './pages/' + pages[path].fileName

	postForPath: (path) ->
		console.log 'postForPath:::', path
		require './posts/' + posts[path].md
