// On DOM ready, hide the real password
$('#real_pass').hide();

// Show the fake pass (because JS is enabled)
$('#fake_pass').show();

// On focus of the fake password field
$('#fake_pass').focus(function(){
    $(this).hide(); //  hide the fake password input text
    $('#real_pass').show().focus(); // and show the real password input password
});

// On blur of the real pass
$('#real_pass').blur(function(){
    if($(this).val() == ""){ // if the value is empty, 
        $(this).hide(); // hide the real password field
        $('#fake_pass').show(); // show the fake password
    }
    // otherwise, a password has been entered,
    // so do nothing (leave the real password showing)
});