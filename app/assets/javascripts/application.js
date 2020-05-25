// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery.js
//= require_tree .
//= require select2-full
//= require serviceworker-companion
//= require chartkick
//= require Chart.bundle
//= require highcharts
//= require jquery.inputmask
//= require jquery.inputmask.extensions
//= require jquery.inputmask.numeric.extensions
//= require jquery.inputmask.date.extensions


function tamanho_tela() {
    console.log(document.body.clientWidth + " x " + document.body.clientHeight);
    if (document.body.clientWidth == 1024) {
    } else if (document.body.clientWidth < 1024) {
    }

}


