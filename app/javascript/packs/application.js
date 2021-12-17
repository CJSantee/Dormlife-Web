// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function() {
    
    $("select#resident_college_id").on('change', function() {
        $.ajax({
            url: "/colleges/"+$("select#resident_college_id").val()+".js",
            type: "GET"
        });
    });

    $("select#resident_residence_hall_id").on('change', function() {
        $.ajax({
            url: "/colleges/"+$("select#resident_college_id").val()+"/residence_halls/"+$("select#resident_residence_hall_id").val()+".js",
            type: "GET"
        });
    });

});