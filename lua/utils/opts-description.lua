local merge = require("utils.merge").merge
local m = {}

local defaultOpts = {
  silent = true,
  noremap = true,
}

function m.optsWithDesc(desc, opts)
  local optsWithDesc = merge(defaultOpts, { desc = desc })
  return merge(optsWithDesc, opts)
end

return m
