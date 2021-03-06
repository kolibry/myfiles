import os
from ranger.defaults.apps import CustomApplications as DefaultApps
from ranger.api.apps import tup

class CustomApplications(DefaultApps):

    def app_mplayer_playlist(self, c):
        # create temporary file and play it as playlist
        return tup('mplayer', '-playlist', *c)

    def app_mplayer_playlist_cache(self, c):
        return tup('mplayer', '-cache', '1024', '-cache-min', '10', '-playlist', *c)

    def app_default(self, c):
        f = c.file

        return_file = os.getenv("RANGER_RETURN_FILE")
        if return_file is not None:
            with open(return_file, 'w') as tmp:
                tmp.write(f.path)
            raise SystemExit()

        if f.extension is not None:
            if f.extension in ('mp3', 'ogg', 'flac', 'wav'):
                return self.either(c, 'mpv')
            # return self.app_mplayer_playlist()
            #if f.extension in ('m3u', 'pls'):
            #    return self.app_mplayer_playlist_cache(c)
            if f.extension in ('mp3', 'ogg', 'flac', 'wav', 'm3u', 'pls'):
             return self.either(c, 'vlc')
            if f.extension in ('pdf', ):
                c.flags += 'd'
                return self.either(c, 'evince', 'zathura', 'okular', 'xpdf', 'apvlv')
            if f.extension in ('chm', ):
                c.flags += 'd'
                return self.either(c, 'chmsee', 'xchm')
            if f.extension in ('torrent', ):
                c.flags += 'd'
                return self.either(c, 'transmission', 'deluge')
            if f.extension in ('psd', 'xcf', ):
                c.flags += 'd'
                return self.either(c, 'gimp')
            if f.extension in ('pd', ):
                c.flags += 'd'
                return self.either(c, 'puredata')
            if f.extension in ('sgf', ):
                c.flags += 'd'
                return self.either(c, 'thunar')
            if f.extension in ('html', 'htm', 'xhtml') or f.extension == 'swf':
                c.flags += 'd'
                handler = self.either(c,
                        'chromium',
                        'luakit', 'uzbl', 'vimprobable', 'vimprobable2', 'jumanji',
                        'firefox', 'seamonkey', 'iceweasel', 'opera',
                        'surf', 'midori', 'epiphany', 'konqueror')
                # Only return if some program was found:
                if handler:
                    return handler

        if f.image:
            return self.either(c, 'mirage', 'eog', 'feh')

        return DefaultApps.app_default(self, c)
