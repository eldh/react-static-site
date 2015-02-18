React = require('react')
LayoutNav = React.createFactory require('./LayoutNavView')
Router = require('react-router')
RouteHandler = React.createFactory Router.RouteHandler
Paths = require('./PathsMixin')

{ html, head, body, div, title, script, link } = require 'react-coffee-elements'

module.exports = React.createClass

	displayName: 'Layout'

	mixins: [
		Router.State
		Paths
	]

	getDefaultProps: ->
		title: 'React Static Site'

	render: ->
		html {},
			head {},
				title @getPathMeta('title') + 'React Static Site'
				link
					rel: 'alternate'
					type: 'application/atom+xml'
					title: 'eldh.co blig'
					href: '/atom.xml'
				if process.env.NODE_ENV is 'production'
					link
						rel: 'stylesheet'
						href: '/assets/main.css'
			body {},
				div { id: 'layout' },
					LayoutNav()
					React.DOM.main { role: 'main' },
						@props.children
						RouteHandler()
				if process.env.NODE_ENV isnt 'production'
					script src: 'http://localhost:3000/scripts/bundle.js'
