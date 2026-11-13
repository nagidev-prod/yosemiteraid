# Yosemite for Unraid

An OS X 10.10 "Yosemite" inspired skin for the Unraid web UI: Helvetica Neue,
a gradient title bar with traffic lights, aqua-blue buttons and pop-up menus,
segmented tabs, Finder-style striped tables and a translucent sidebar.

Built against Unraid **7.3.4**. It needs the CSS-variable theme system, so
7.2 or newer.

It is UI only. It adds one stylesheet and a three-line page file that makes
Unraid load it; no settings, containers or system files are changed.

## Install

On the server (web terminal or SSH):

```bash
git clone https://github.com/OWNER/unraid-yosemite.git /boot/config/yosemite-theme
bash /boot/config/yosemite-theme/install.sh
```

Reload the web UI. The installer also appends one line to `/boot/config/go`
so the theme is copied back in after a reboot (the web UI lives in RAM).
Pass `--no-boot` to skip that.

## Choosing a look

The skin follows the stock theme picked in **Settings > Display Settings >
Dynamix color theme**:

| Stock theme | Result                              |
| ----------- | ----------------------------------- |
| White       | Yosemite light, toolbar navigation  |
| Azure       | Yosemite light, translucent sidebar |
| Black       | Yosemite dark, toolbar navigation   |
| Gray        | Yosemite dark, translucent sidebar  |

## Update

```bash
cd /boot/config/yosemite-theme && git pull && bash install.sh
```

## Uninstall

```bash
bash /boot/config/yosemite-theme/uninstall.sh
```

## Tweaking

Everything is in `src/yosemite.theme/sheets/YosemiteTheme.css`. The palette
is the block of `--yos-*` variables at the top; change `--yos-accent` and its
two gradient stops to move away from aqua blue.

## Notes

- Helvetica Neue is used when the computer you browse from has it (any Mac).
  Elsewhere it falls back to Helvetica, Arial, then Unraid's own font.
- The header's logo and profile menu are Unraid's Vue components and are
  mostly left as they are; only their text colours are set.
- The login page is not themed.
- Not affiliated with Lime Technology or Apple.
