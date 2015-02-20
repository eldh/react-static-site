paths = require('../paths')
React = require('react')

PathsMixin =

	contextTypes:
		getCurrentPathname: React.PropTypes.func.isRequired
		getCurrentParams: React.PropTypes.func.isRequired

	getAllPosts: ->
		allPosts

	getPathMeta: (key) ->
		path = @context.getCurrentPathname()
		post = @context.getCurrentParams().post
		if post
			console.log 'getting post', post
			return paths.allPosts()[post][key]
		metas = paths.allPaths()[path]
		console.log 'path, metas: ', path, metas
		if metas then metas[key] else ''

	getPage: ->
		paths.pageForPath @context.getCurrentPathname()

	getPost: ->
		paths.postForPath @context.getCurrentParams().post

	getPostForPath: (path) ->
		paths.postForPath path

	getPreviewForPost: (post) ->
		console.log 'POSTPOST!!!: ', post
		postMeta = paths.allPosts()[post]
		if postMeta.preview
			return postMeta.preview
		# else return the first line from the markdown
		md = paths.postForPath(post)
		md.substr 0, md.indexOf('\n')

module.exports = PathsMixin
