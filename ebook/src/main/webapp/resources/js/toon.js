$(document).click(function(e){
    $('.payment-item').addClass('display-none');
    $('.payment-box').addClass('display-none');
    $('.payment-item').children('.toon-pay-btn').remove();
})