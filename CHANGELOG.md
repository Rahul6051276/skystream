# Changelogs - v2.9.0-unreleased

### ✨ *New Features & Enhancements*

#### 🧩 CloudStream Extensions
- **CloudStream (.cs3) extensions on every platform** – Install and run CloudStream extensions on Android, iOS, macOS, Windows and Linux. Their providers appear on Home, in search and in the provider list.
- **Repositories** – Add a repository by its URL (repo.json or plugins.json), a cloudstreamrepo:// link or a shortcode. MegaRepo is supported, Check Updates shows what changed, and each extension can be updated or removed.
- **Extension settings** – An extension's own settings open in SkyStream on every platform and take effect without restarting the app. Extensions' own dialogs and pages open in SkyStream too.
- **Full-screen extension windows** – Extensions that open a full-screen page, games included, work on every platform, and Back closes them.
- **One switch** – Turn CloudStream off entirely in Settings: no extension loads and their providers are hidden everywhere. Nothing is uninstalled.
- **Richer details** – A CloudStream title's page shows everything its extension provides: its logo, score, content rating, status and tags; cast with voice actors; trailers; more titles from the same extension; when the next episode airs; named seasons; and each episode's rating, runtime and air date. A title not out yet says Coming soon. Tracking and skip times now get the title's MAL, AniList, IMDb and TMDB ids.

#### 🛡️ Bot Checks (Cloudflare and Others)
- **SkyStream's own browser engine** – Bot checks are now cleared in each platform's own browser engine on every platform, Linux included, instead of the old WebView plugin.
- **Checks cleared for you** – SkyStream ticks the checkbox itself where it can. When a site needs you, its check opens right where you are.
- **One check per site** – A site cleared once works for SkyStream plugins, CloudStream extensions, Nuvio scrapers and Stremio add-ons alike, and stays cleared across restarts until the site asks again.
- **See each site's check** – Search, Explore and Home show the sites that need a check, with Verify for one site or all of them. A site can be set not to open its check by itself.
- **Clearer reasons** – A site that blocks VPNs, keeps asking, can't be reached, or needs a newer Android System WebView says so.
- **Moved sites followed** – When a site moves to a new address, SkyStream follows it.
- **More check vendors** – DDoS-Guard and other vendors are handled, and a captcha an extension asks for is shown to you to solve.

#### 🔎 Search
- **Universal search** – One search bar for SkyStream, CloudStream, Stremio and Nuvio: a section for each Stremio add-on and one for Nuvio, with every result tagged with where it came from.
- **Search in every language** – Titles are found whatever their accents, letter forms, digits or spacing: "pokemon" finds "Pokémon", and Arabic, Persian, Urdu, Hebrew, Turkish and Indian-language titles match the way they are typed. Japanese, Chinese and Thai titles written without spaces are found by any part of the name, and Korean ones with or without spaces. A provider whose titles are all in another script shows them instead of nothing (PR #127 by @1eren0).
- **Traditional and Simplified Chinese** – A search in either finds titles written in the other: 复仇者联盟 finds 復仇者聯盟, and 活着 finds 活著.

#### 🎬 Player & Playback
- **Volume and brightness swipes like VLC** – Both follow your finger with no lag. The volume boost above 100% shows in orange, and a swipe from below 100% stops there first: swipe up again to go past it.
- **Volume keys** – On Android the volume keys change the video's volume even while it is paused. On a desktop keyboard, holding a volume key keeps stepping.
- **Orientation** – Leaving the player returns to your device's orientation, with the rotation lock respected.
- **Rotate button** – On phones and tablets, a Rotate button turns the player between landscape and portrait. The player still turns to fit each video first; your choice holds for the rest of that video, and the next one fits itself again. It can be hidden in Player Controls. iPads and Android 16 tablets don't let apps turn the screen, so they don't have it.
- **Faster playback** – Playback speed now goes up to 4x, with 3x and 4x among the quick choices.
- **New player controls** – Frosted controls, and one Options button for sources, audio, subtitles and episodes. The volume and episode buttons can be hidden in Player Controls (PR #121 by @likhithkrishna1103-tech).
- **Held keys** – Holding left or right on a keyboard or a TV remote, or J/L on a keyboard, keeps seeking (PR #121 by @likhithkrishna1103-tech).
- **Audio language** – Choose the language videos start in, in Player settings. A video with an audio track in that language starts on it, including after a source change and on the next episode; one without it plays its own default. A track you pick from Audio in the player stays for the rest of that video (PR #130 by @1eren0).
- **More languages** – Persian, Filipino, Thai and Azerbaijani can be chosen as the audio language and in subtitle search, and SubSource now finds Chinese subtitles.
- **Subtitles from Stremio add-ons** – The player's subtitle search also asks your Stremio subtitle add-ons, and OpenSubtitles' own Stremio add-on, so a film or an episode with an IMDb id finds subtitles with no key or account.
- **Subtitle style in the player** – A Subtitle style page in the player's Subtitles tab sets the size, colours, background, outline, position, bold, font, text opacity and encoding, on every device including TV; Settings has the same choices. Subtitle files change at once. Subtitles inside the video change from their next line, and take bold, font, text opacity and encoding the next time the player opens (PR #133 by @1eren0).
- **Play Stremio titles from their page** – When the add-on a title came from also brings its links, as CNCVerse Bridge does, the title's page has a Play button (Resume once started, and the next episode for a show), its episodes are laid out like a CloudStream title's and play with a tap, and the player goes on to the next episode from the same add-on. Holding an episode searches every add-on for it, as Search Stremio add-ons does.

#### 🖥️ Interface
- **Navigation bar** – A new frosted navigation bar on phones (PR #121 by @likhithkrishna1103-tech).

#### 🔐 Accounts
- **MyAnimeList and AniList sign-in inside SkyStream** – Signing in happens in the app, on every platform.
- **Trakt's new sign-in** – Trakt now signs in through Trakt's new sign-in page. If you were signed in to Trakt before, you may be asked to connect once more.

---

### 🐞 *Bug Fixes & System Stability*
- 🛠️ **Fixed: a page in a sign-in or bot-check sheet couldn't be scrolled on phones** – On Android and iPhone the page scrolls under your finger, and the sheet moves by its handle only. Sheets, Home's long-press menus and the source list for an external player now open above the navigation bar instead of under it.
- 🛠️ **Fixed: lines from a subtitle file flickered** – They no longer blink off and on or flash an earlier line, worst on HLS streams, and a short seek back shows the line it lands in (PR #132 by @1eren0).
- 🛠️ **Fixed: posters didn't show for some sites behind a bot check** – Once SkyStream has cleared a site's check, its posters and artwork load too.
- 🛠️ **Fixed: SubSource found no subtitles without an API key** – SubSource retired the way SkyStream searched it without a key. It is now searched the way subsource.net searches itself, with no key needed, and a key works as before.
- 🛠️ **Fixed: OpenSubtitles found no Chinese or Portuguese subtitles** – Simplified, Traditional and bilingual Chinese, and Brazil's and Portugal's Portuguese are found now, and OpenSubtitles VIP accounts use their own server.
- 🛠️ **Fixed: SubDL showed at most ten subtitles, for an episode often none of its own** – It shows thirty, the episode's own first and no other episode's. Brazil's Portuguese and bilingual Chinese are found too, hearing-impaired subtitles are marked, and choosing one no longer shows every SubDL row as downloading.
- 🛠️ **Fixed: with a SubSource API key, only the 20 newest subtitles were searched** – Every page is read now, an episode named in any of a subtitle's releases is found, and Chinese includes Traditional.
- 🛠️ **Fixed: some subtitles from Stremio add-ons showed a code instead of their language** – They show the language's name, and Traditional Chinese, Spain's Spanish and Kurdish ones are picked for a viewer who reads them.
- 🛠️ **Fixed: on TV, the remote could end up behind the player's open panel** – When playback reopened its source while the panel was open, after a quality change, a source failing over or the network coming back, the remote moved to the controls behind it.
- 🛠️ **Fixed: some repository short links and shortcodes didn't add their repository** – Links that pass through a redirect page now work, a shortcode works in any letter case ("Universe" adds SkyStream's own collection), and the add-repository boxes no longer autocorrect what you type (PR #129 by @1eren0).
- 🛠️ **Fixed: another repository could replace an extension with its own code** – An extension now updates only from the repository it was installed from, and only to the extension that repository lists. To move an extension to another repository, use Install from this repository in that repository's list.
- 🛠️ **Fixed: on TV, a keyboard closed with Back couldn't be opened again from its text field** – OK on the field opens it again, and Down moves on from the field to what is below it, in search on Home, Explore and the Search tab and in the text boxes of dialogs (PR #128 by @1eren0).
- 🛠️ **Fixed: on some low-memory Google TV devices, the on-screen keyboard showed but typed nothing into SkyStream.**
- 🛠️ **Fixed: on iPad, a video's sound stopped a second in** – The video went on playing silently until an audio track was picked again.
- 🛠️ **Fixed: leaving the player could freeze the app on iPad.**
- 🛠️ **Fixed: brightness swipes lagged on iPhone and iPad** – The brightness changed only after the finger stopped.
- 🛠️ **Fixed: on iPad and Android tablets, a tapped icon in the side navigation bar stayed enlarged** – It grew and showed its label as if a mouse were over it. The bar now grows only under a mouse, or for a remote or keyboard.
- 🛠️ **Fixed: the app could open in landscape after leaving the player.**
- 🛠️ **Fixed: on Linux, the screen stopped going to sleep after playback** until SkyStream was closed.
- 🛠️ **Fixed: on Linux, opening some streams, such as Internet Archive's, froze the app.**
- 🛠️ **Fixed: on TV, the search screen's scope selector and first result ignored the D-pad.**
- 🛠️ **Fixed: Stremio shows that an add-on publishes as "other" were treated as films** – Their add-ons search asked for the whole show instead of an episode, and Continue Watching couldn't reopen them.
- 🛠️ **Fixed: on TV, Left could jump up to the top of a page instead of into the side navigation bar** – From a button with nothing beside it, such as Select Provider on Home, Left went to the arrows at the top. It now opens the side navigation bar.
- 🛠️ **Fixed: on Windows, macOS and Linux, Clear cache could delete other apps' temporary files** – It now clears only SkyStream's own.
- 🛠️ **Fixed: the Linux .deb didn't install the VLC and WebKitGTK it needs** – apt now installs them with SkyStream.
- 🛠️ **Fixed: the Linux x64 build didn't start on Ubuntu 22.04, Debian 12 and other systems older than Ubuntu 24.04** (PR #121 by @likhithkrishna1103-tech).


### ⚙️ Improvements
- 🚀 **Linux AppImage** for x64 and arm64, beside the .deb and the archive (PR #125 by @vivin-neelankavil).
- 🚀 **For repository authors:** a SkyStream repository lists its plugins in pluginLists files; a plugins list inside the repository's own manifest is no longer read.
- 🚀 Updated to Flutter 3.47.7, Android Gradle Plugin 9.1.1 and VLC 3.0.24.
- 🚀 Fewer third-party plugins: flutter_inappwebview, screen_brightness and flutter_volume_controller are gone, replaced by SkyStream's own.
- 🚀 Thousands of new automated tests, and checks that run the app on every platform.
