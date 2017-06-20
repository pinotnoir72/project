var refreshRating = function() {
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
        readOnly: true,
        score: function() {
            return $(this).attr('data-score');
        }
    });
};


$(document).on('turbolinks:load', function() {
   
    $('.img-zoom').elevateZoom({
      zoomWindowFadeIn:700,
			zoomWindowFadeOut: 700,
			lensFadeIn: 700,
			lensFadeOut: 700
  });
});