-- CC Libs
-- nothing here right now

-- 3rd Party Libs
local json = require("json")

-- Additional Files
local config = require("config")

G_debug = true

local function debug(msg)
  if G_debug then
    print(msg)
  end
end

local function fetchJSON(url)
  debug("Fetching "..url.."...")
  local request = http.get(url)
  local obj = json.decode(request.readAll())
  request.close()

  return obj
end

local function commandList()
  local packages = fetchJSON(config.API_URL.."/list")

  for i, package in ipairs(packages) do
    print("#"..i.." "..package)
  end
end

local function parseArguments()
  if arg[1] == "list" then
    commandList()
  end
end

local function printHelp()
  print("Not a Real Package manager")
  print(" ")
  print("COMMANDS:")
  print("> narpm list     list available packages")
end

if arg[1] == nil then
  printHelp()
else
  parseArguments()
end
