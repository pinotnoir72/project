$(document).on('turbolinks:load', function(){
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });
    
    $('.img-zoom').elevateZoom({
      zoomWindowFadeIn:700,
			zoomWindowFadeOut: 700,
			lensFadeIn: 700,
			lensFadeOut: 700
  });
});