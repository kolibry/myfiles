#!javascript

var hoverUri;
var regex = new RegExp("https?://www.youtube.com/watch\\?(.*&)*v=.*");

signals.connectWebView("hovering-over-link", function(w, title, uri) {
  hoverUri = uri;
});

bind("v", function() {
  var uri = hoverUri || tabs.current.uri;
  if (regex.test(uri)) {
    system.spawn("sh -c 'mplayer \"$(youtube-dl -g " + uri + ")\"'");
    io.notify("Playing in mplayer");
  }
});
