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
//x= require turbolinks
//x= require bootstrap
//= require jquery
//= require jquery_ujs
// neda znovu dokonceny
//= require_tree .

a = 1 //globalna
//var b = 1 //uz len vo funkcii
//const c= 1

//turbolinks-

// document.addEventListener('click',function(){
//    console.log('klik')
//     //document.querySelector('.js-show-more-content').style.display = "none";
//    // document.getElementById(".js-show-more-content").style.display = "none"
// })

// document.addEventListener('click',function(e){
//     //da sa spytat na co bolo kliknute Jquery kniznica
//     console.log('klick na dokument')
// })

//document.addEventListener('DOMContentLoaded', function() {
// $(function(){
//     console.log("dokonceny");
//     // document.querySelector('#.js-show-more-toggle').addEventListener('click', function(){
//     //     console.log('kliknuty');
//     //     //e.preventDefault();
//     //     //e.stopPropagation(); //
//    // debugger
//     $(".js-show-more-content").hide();
//     //document.querySelector('.js-show-more-content').style.display = "none";
//     console.log("prejde");
    // });


//$('.js-show-more-toggle')
// $(document).on('click','.js-show-more-toggle',function(){
//     console.log('click');
//     $(this).hide();
//     //$(this).siblings('.js-show-more-content').show
//     $(this).text('skryt');
//     $(this).siblings('.js-show-more-content').toggle();
//     return false;
// })
// $(document).on('click','.js-show-more-toggle',function(){
//     console.log('click');
//     //$(this).hide();
//     //$(this).siblings('.js-show-more-content').show
//     $(this).text('skryt');
//     //$(this).siblings('.js-show-more-content').toggle();
//     $(this).siblings('.js-show-more-content').toggle();
//     return false;
// })

//
// $(function(){
//     console.log('a');
//     //vnutri veci, aby sa sparsovali naraz
//
// })
// //$(document).ready() az ked je redy sa spusti
//
// //treba dppisat more
// $(document).on('click','.js-comments',function(){
//     console.log('ide to');
//     $.get('/users', function(data){
//         //debuger
//
//         console.log(data);
//         $('.js-comments').append('<li>novykomentar</li>');
//     })
//     return false;
// })
//     $(document).ready(function(){
//         $("button").click(function(){
//             $.ajax({url: "demo_test.txt", success: function(result){
//                     $("#div1").html(result);
//                 }});
//         });
//     });
// })