local m = {}

-- Merge objects like in JS
function m.merge(tbl1, tbl2)
  local result = {}
  for k, v in pairs(tbl1) do
    result[k] = v
  end
  for k, v in pairs(tbl2) do
    result[k] = v
  end
  return result
end

return m
