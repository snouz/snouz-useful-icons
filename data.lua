local modname = "snouz-useful-icons"
local modorder = 01
local modpath = "__" .. modname .. "__/"
local IMG = modpath .. "graphics/icons/"



if not iconlib then
  iconlib = {}
end

table.insert(iconlib, {"electric",   10})
table.insert(iconlib, {"signs",      10})
table.insert(iconlib, {"concept",    20})
table.insert(iconlib, {"aliens",     10})
table.insert(iconlib, {"androids",   10})
table.insert(iconlib, {"control",    10})
table.insert(iconlib, {"diplomacy",  10})
table.insert(iconlib, {"connect",    10})
table.insert(iconlib, {"no",         20})

table.insert(iconlib, {"abstract",    9})


------------------------------------------------------------



if not data.raw["item-group"]["snouz-icons"] then
data:extend(
{
  {
    type = "item-group",
    name = "snouz-icons",
    order = "z-snouz-icons",
    icon = IMG .. "tab-useful-icons.png",
    icon_size = 128,
    icon_mipmaps = 0,
  },
})
end


for k, v in pairs(iconlib) do
  local name = v[1]
  local num = v[2]

  local subgroup = {}
  subgroup.type = "item-subgroup"
  subgroup.name = "snouz-" .. name
  subgroup.group = "snouz-icons"
  subgroup.order = "" .. modorder .. "-" .. k
  if not data.raw["item-subgroup"]["snouz-" .. name] then
    data:extend({subgroup})
  end

  for i=1, num do
    local p = table.deepcopy(data.raw["virtual-signal"]["signal-everything"])
    p.type = "virtual-signal"
    p.name = name .. "-" .. i
    p.icon = IMG .. name .. "-" .. i .. ".png"
    p.icon_size = 64
    p.icon_mipmaps = 0
    p.subgroup = "snouz-" .. name
    p.order = string.format("%02d", k) .. "[" .. name .. "]-" .. string.format("%02d", i)
    data:extend({p})
  end
end



--------------------- mod icons -------------------------

local modiconlib = {
  {"base", 2}, {"Satisfactorio", 1}, {"space-exploration", 1}, {"aai-industry", 1}, {"Krastorio2", 1}, {"boblibrary", 1}, {"angelsrefining", 1},
  {"IndustrialRevolution", 2}, {"5dim_core", 1}, {"pyalienlife", 1}, {"pyfusionenergy", 1}, {"pycoalprocessing", 1},
  {"pyhightech", 1}, {"pyindustry", 1}, {"pypetroleumhandling", 1}, {"pyrawores", 1}, {"Factorissimo2", 1}, {"Bio_Industries", 1},
  {"modmashsplinter", 1, "modmash"}, {"Darkstar_utilities", 1}, {"Dectorio", 1}, {"Geothermal", 1},
  {"Mobile_Factory", 1}, {"Yuoki", 1}, {"cargo-ships", 1}, {"FactorioExtended-Plus-Core", 1}, {"Rocket-Silo-Construction", 1},
  {"Mining-Space-Industries-II", 1}, {"vtk-deep-core-mining", 1}, {"NPUtils", 1}, {"fpp", 1}, {"SeaBlock", 1},
  {"FactorioExtended-Core", 1}, {"omnilib", 1}, {"SpaceMod", 1}, {"aai-programmable-vehicles", 1},
}

data:extend(
{
  {
    type = "item-subgroup",
    name = "snouz-mods",
    group = "snouz-icons",
    order = "" .. modorder .. "-0",
  },
})

for k, v in pairs(modiconlib) do
  local modname = v[1]
  local modnamebis = v[3] or nil
  local num = v[2] or 1
  if mods[modname] or mods[modnamebis] then
    for i=1, num do
      local p = table.deepcopy(data.raw["virtual-signal"]["signal-everything"])
      p.type = "virtual-signal"
      p.name = modname .. "-" .. i
      if i == 1 then
        p.icon = IMG .. "mods-" .. modname .. ".png"
      else
        p.icon = IMG .. "mods-" .. modname .. "-" .. i .. ".png"
      end
      p.icon_size = 64
      p.icon_mipmaps = 0
      p.subgroup = "snouz-mods"
      p.order = "[mods]-" .. string.format("%02d", k) .. "[" .. modname .. "]-" .. string.format("%02d", i)
      data:extend({p})
    end
  end
end