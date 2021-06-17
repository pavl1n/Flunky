const { environment } = require('@rails/webpacker');
const coffee =  require('./loaders/coffee');

environment.loaders.prepend('coffee', coffee);
module.exports = environment;
const webpack = require('webpack');
environment.plugins.append('Provide', new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
}));
