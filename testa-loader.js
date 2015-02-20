module.exports = function(content) {
	console.log('INSIDE LOADER!!!')
	return "exports.answer = 42;\n" + content;
}
