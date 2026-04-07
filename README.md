# elephant-menu-remmina

A custom Elephant menu to Walk through and launch your Remmina files.

## Summary

I wrote this because as a sysadmin of a primarily-Windows shop, I've got a slew of saved RDP connections in Remmina. I'm on Omarchy, so I'm already using Elephant+Walker, so I figured it would be a lot more time efficient to just integrate Remmina in. It has proved to be. This is my first time touching lua.

## Install

1. Make sure [elephant-menu](https://aur.archlinux.org/packages/elephant-menus) is installed. (If you're also on Omarchy, it already is)
2. Place `remmina.lua` in `~/.config/elephant/menus/`
3. Add a prefix in Walker - I used `\` (requires an extra \ since it's an escape.)

```toml
# ~./.config/walker/config.toml
[[providers.prefixes]]
prefix = "\\"
provider = "menus:remmina"
```

1. Restart Elephant & Walker: `systemctl --user restart elephant.service && systemctl --user restart app-walker@autostart.service`
Your service commands may vary slightly.

## Other Considerations

I set my Action command to:

```lua
-- ~/.config/elephant/menus/remmina.lua
Action = "hyprctl dispatch workspace 7 && remmina -c " .. path_to_remmina .. "%VALUE%"
```

This will always launch my sessions on Workspace 7, which is where I want it. I just wanted to leave this as an example incase you wanted something like this too.

I considered adding a few extra lines that would change the icon based on what type of connection it is. However, I literally only use this for RDP. I'd welcome it if anyone felt up to adding it.

## Thanks

[This brilliant article from Hans Schnedlitz](https://www.hansschnedlitz.com/writing/2026/02/22/custom-walker-menus-with-lua) got me 90% of the way there. Thanks Hans!
