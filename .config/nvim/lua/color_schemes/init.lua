
local color_schemes = {
  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  -- everforest
  {
    "neanias/everforest-nvim",
    name = "everforest",
    priority = 1000,
  },

  -- iceberg
  {
    "oahlen/iceberg.nvim",
    name = "iceberg",
    priority = 1000,
  },

  -- nord
  {
    "gbprod/nord.nvim",
    name = "nord",
    priority = 1000,
  },
}


-- -- _G.color_scheme에 따라 선택된 컬러 스키마를 설정합니다.
local selected_scheme = nil
for _, scheme in ipairs(color_schemes) do
  if scheme.name == _G.color_scheme then
    selected_scheme = scheme
    break
  end
end

return { selected_scheme }
