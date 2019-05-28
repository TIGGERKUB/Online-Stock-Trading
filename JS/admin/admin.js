//search broker
$(document).ready(function () {
    $('input.searchBroker').typeahead({
        name: 'broker',
        remote: 'http://localhost:3000/admin/searchBroker?key=%QUERY',
        limit: 10
    });
});

//search PersonalID
$(document).ready(function () {
    $('input.searchPersonalID').typeahead({
        name: 'personalID',
        remote: 'http://localhost:3000/admin/searchPersonalID?key=%QUERY',
        limit: 10
    });
});

//search Account ID
$(document).ready(function () {
    $('input.searchAccountID').typeahead({
        name: 'accountID',
        remote: 'http://localhost:3000/admin/searchAccountID?key=%QUERY',
        limit: 10
    });
});

//add insert account
$(document).ready(function () {
    //group add limit
    var maxGroup = 10;

    //add more fields group
    $(".addMore").click(function () {
        if ($('body').find('.fieldGroup').length < maxGroup) {
            var fieldHTML = '<div class="form-group fieldGroup">' + $(".fieldGroupCopy").html() + '</div>';
            $('body').find('.fieldGroup:last').after(fieldHTML);
        } else {
            alert('Maximum ' + maxGroup + ' groups are allowed.');
        }
    });

    //remove fields group
    $("body").on("click", ".remove", function () {
        $(this).parents(".fieldGroup").remove();
    });
});


