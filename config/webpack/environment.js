const { environment } = require('@rails/webpacker')



//Add for Bootstrap start:
const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}))
//end

module.exports = environment