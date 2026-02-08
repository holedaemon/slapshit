www.jaunty.fun, jaunty.fun {
    root /srv/jaunty.fun
    file_server
    try_files {path}.html {path}
    templates
    encode gzip zstd

    @slug `"{$JAUNTY_DISCORD_SLUG}" != ""`
    handle /play {
        redir @slug https://discord.gg/{$JAUNTY_DISCORD_SLUG}
        rewrite /closed.html
    }

    handle /screenshots/* {
        rewrite /screenshot_gallery.html
    }

    handle /content {
        file_server browse
    }

    handle /stream {
        redir https://www.twitch.tv/djball_icker
    }

    handle_errors {
        rewrite /error.html
        file_server
        templates
    }
}

listmonk.jaunty.fun {
    reverse_proxy listmonk
}

# vim: ft=caddy
