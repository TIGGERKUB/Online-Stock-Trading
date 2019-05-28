$(document).ready(function () {
    $('input.marketData').typeahead({
        name: 'countries',
        remote: 'http://localhost:3000/market_data/search?key=%QUERY',
        limit: 10
    });
});




