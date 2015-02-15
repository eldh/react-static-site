paths = require('../paths')
moment = require('moment')
_ = require 'lodash'

module.exports = (page) ->
	tag 'feed', {xmlns: "http://www.w3.org/2005/Atom"}, [
		tag 'title', {}, 'eldh.co'
		tag 'link', {href: 'http://www.eldh.co/atom.xml', rel: 'self'}, ' '
		tag 'link', {href: 'http://www.eldh.co'}, ' '
		tag 'updated', {}, moment().format()
		tag 'id', {}, 'http://www.eldh.co'
		tag 'author', {}, [
			tag 'name', {}, 'Andreas Eldh'
			tag 'email', {}, 'andreas.eldh@gmail.com'
		]
		_.map paths.allPaths().posts, (post, name) =>
			tag 'entry', {}, [
				tag 'title', {}, post.title
				tag 'link', href: 'http://www.eldh.co/' + name, ''
				tag 'updated', {}, moment(post.published, 'YYYY-MM-DD').format()
				tag 'content', type: 'html', paths.postForPath name
			]
		.join ''
	]



tag = (name, attributes, content) ->
	attrStr = _.map attributes, (val, key) ->
		key + '=' + '"' + val + '"'
	.join ' '
	if _.isArray content
		content = content.join ''
	"<#{name} #{attrStr}>#{content}</#{name}>"
