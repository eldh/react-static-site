React = require('react')
Router = require('react-router')
PathsMixin = require('./PathsMixin.coffee');
Link = React.createFactory Router.Link
_ = require 'lodash'

{ nav, div } = require 'react-coffee-elements'

module.exports = React.createClass

	displayName: 'Nav'

	mixins: [ PathsMixin ]

	render: ->
		nav {className: 'nav'}, 'hey'
