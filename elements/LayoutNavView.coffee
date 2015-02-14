React = require('react')
Router = require('react-router')
Link = React.createFactory Router.Link

module.exports = React.createClass

	render: ->
		React.DOM.nav {className: 'nav'}, 'Nav'
