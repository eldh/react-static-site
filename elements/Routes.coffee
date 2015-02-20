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
			Route
				name: '/' + page.name
				handler: require '../pages/' + page.fileName


module.exports = Routes
