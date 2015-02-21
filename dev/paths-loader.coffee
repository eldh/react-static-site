postinfo = require './postinfo'

posts = postinfo.posts()
pages = postinfo.pages()

module.exports = (source) ->
	@cacheable()
	headerPath = path.resolve("header.js")
	this.addDependency(headerPath)
	source
