Name = "remmina"
NamePretty = "Remmina"
Icon = "preferences-desktop-display"
Cache = false

local path_to_remmina = os.getenv("HOME") .. "/.local/share/remmina/"

Action = "remmina -c " .. path_to_remmina .. "%VALUE%"

function GetEntries()
  local entries = {}
  local handle = io.popen("ls -1 " .. path_to_remmina)
  if handle then
    local output = handle:read("*a")
    handle:close()
    if output then
      for filename in output:gmatch("[^\r\n]+") do
        local file = io.open(path_to_remmina .. filename, "r")
        if file then
          local entry = {}
          for line in file:lines() do
            local name = line:match("^name=(.*)")
            local labels = line:match("^labels=(.*)")

            if name then entry.name = name end
            if labels then entry.labels = labels end
          end
          table.insert(entries, {
            Text = entry.name .. " (" .. entry.labels .. ")",
            Value = filename,
            Icon = "preferences-desktop-display",
          })
        end
      end
    end
    return entries
  end
end
