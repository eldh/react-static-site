React = require 'react'
Router = require 'react-router'
Route = React.createFactory Router.Route
NotFoundRoute = React.createFactory Router.NotFoundRoute
DefaultRoute = React.createFactory Router.DefaultRoute
RouteHandler = React.createFactory Router.RouteHandler
Layout = require './Layout.coffee'
Post = require './Post.jsx'
_ = require 'lodash'
paths = require('../paths')

Routes =
	Route
		name: 'home'
		path: '/'
		handler: Layout
	,
		Route
			name: 'post'
			path: '/blog/:post'
			handler: Post
		_.map paths.allPages(), (page, key) ->
			handler = require '../pages/' + page.fileName
			console.log 'key: ', key, page.fileName, handler
			Route
				name: '/' + page.name
				handler: handler


module.exports = Routes
