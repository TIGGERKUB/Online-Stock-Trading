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