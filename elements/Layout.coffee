React = require('react')
LayoutNav = React.createFactory require('./LayoutNavView')
Router = require('react-router')
RouteHandler = React.createFactory Router.RouteHandler
Paths = require('./PathsMixin')

{ html, head, body, div, title, script } = require 'react-coffee-elements'

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
				title @getPathMeta('title') + 'Poo'
				if process.env.NODE_ENV is 'production'
					React.DOM.link
						rel: 'stylesheet'
						href: '/assets/style.css'
			body {},
				div { id: 'layout' },
					LayoutNav()
					React.DOM.main { role: 'main' },
						@props.children
						RouteHandler()
				if process.env.NODE_ENV isnt 'production'
					script src: 'http://localhost:3000/scripts/bundle.js'
