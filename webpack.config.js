var webpack = require('webpack');
var RHLMatches = /View.coffee|views\//;
var ExtractTextPlugin = require("extract-text-webpack-plugin");

var outputPath = __dirname + '/dev',
outputPublicPath =  'http://localhost:3000/scripts/';

var resolveCommon = {
	// Allow to omit extensions when requiring these files
	extensions: ['', '.js', '.jsx', '.coffee']
};
var jsHintRules = {
	bitwise: false,
	boss: true,
	curly: false,
	eqnull: true,
	expr: true,
	newcap: false,
	quotmark: false,
	shadow: true,
	strict: false,
	sub: true,
	undef: true,
	unused: 'vars'
}

module.exports = [
	{
		name: 'browser',
		// Entry point for static analyzer:
		entry: [
		'webpack-dev-server/client?http://localhost:3000',
		'webpack/hot/dev-server',
		'./dev/entry.coffee'
		],

		output: {
			// Where to put build results when doing production builds:
			path: outputPath,

			// JS filename you're going to use in HTML
			filename: 'bundle.js',

			// Path you're going to use in HTML
			publicPath: outputPublicPath,
		},

		plugins: [
			new webpack.HotModuleReplacementPlugin()
		],
		jshint: jsHintRules,

		resolve: resolveCommon,

		module: {
			loaders: [
				// Pass *.css files through css-loader and style-loader transforms
				// { test: /\.css$/, loader: 'style!css' },
				// Pass *.jsx files through jsx-loader transform
				{ test: /\.scss$/, loaders: [
					'style-loader',
					'css-loader',
					'autoprefixer-loader?{browsers:["last 2 version", "ie 10", "Android 4"]}',
					'sass-loader'
				]},
				{ test: /\.jsx$/, loaders: ['react-hot', 'jsx'] },
				{
					test: /\.coffee$/,
					exclude: RHLMatches,
					loader: 'jshint-loader!coffee-loader'
				},	// enable post compile jshint, rules/flags at the bottom
				{ test: /\.html$/, loader: 'raw' },
				{ test: RHLMatches, loader: 'react-hot!coffee-loader' },
				{ test: /\.md$/, loader: 'raw!markdown' },
			]
		}
	},
	{
		name: 'server',

		target: 'node',

		// Entry point for static analyzer:
		entry: {
			// bundleCss: './scss/main.scss',
			bundlePage: './dev/page.jsx',
			bundleStaticRss: './dev/staticRss.coffee',
			bundleStaticPage: './dev/staticPage.jsx'
		},

		output: {
			// Where to put build results when doing production builds:
			path: outputPath,

			// JS filename you're going to use in HTML
			filename: '[name].js',

			// Path you're going to use in HTML
			publicPath: outputPublicPath,

			libraryTarget: "commonjs2"
		},
		jshint: jsHintRules,
		plugins: [
			new ExtractTextPlugin("main.css", {allChunks: true})
		],

		resolve: resolveCommon,

		module: {
			loaders: [
				{ test: /\.scss$/, loader: ExtractTextPlugin.extract(
					'style-loader',
					'css-loader!autoprefixer-loader?{browsers:["last 2 version", "ie 10", "Android 4"]}!sass-loader'
				) },
				{ test: /\.jsx$/, loader: 'jsx' },
				{ test: /\.coffee$/, loader: 'jshint-loader!coffee-loader' },
				{ test: /\.html$/, loader: 'raw' },
				{ test: /\.md$/, loader: 'raw!markdown' },
			]
		}
	}
];
