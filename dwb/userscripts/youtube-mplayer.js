//!javascript

var regex = new RegExp("^https?" + RegExp.escape("://www.youtube.com/"));

function onContextMenu(uri, w, menu) {
    menu.addItems([ {
        label : "Open with mpv", 
        callback : function() {
            system.spawn("mpv " + uri);
        }
    } ]);
    this.disconnect();
}

var sigMenu = Signal("contextMenu");

Signal.connect("buttonPress", function(w, result, e) {
    if (e.button == 3) { 
        if ((result.context & 1<<2) && result.linkUri.search(regex) != -1) {
            sigMenu.connect(onContextMenu.bind(sigMenu, result.linkUri));
        }
        else if (tabs.current.uri.search(regex) != -1) {
            sigMenu.connect(onContextMenu.bind(sigMenu, tabs.current.uri));
        }
    }
});
