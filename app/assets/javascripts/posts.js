window.fbAsyncInit = function () {
  FB.init({
    appId: '309974772378701',
    sttaus: true,
    cookie: true,
    xfbml: true,
    oauth: true
  });

  $('#wrapper').delegate('.publish', 'click', function (event) {
    event.preventDefault();
    var $this = $(this), id = $this.attr('data-publish');

    console.log($('#' + id).html());
    FB.ui({
      method: 'feed',
      link: 'http://0.0.0.0:3000/' + $this.attr('href'),
      caption: 'Dajpieroga',
      description: $('#' + id).html()
    });
  });
};

(function(d){
  var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
    js = d.createElement('script'); js.id = id; js.async = true;
    js.src = "//connect.facebook.net/en_US/all.js";
    d.getElementsByTagName('head')[0].appendChild(js);
}(document));
