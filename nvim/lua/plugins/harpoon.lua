require 'harpoon'.setup({
  nav_first_in_list = true,
  projects = {
    ["D:\\dev\\src\\zig\\vulkan"] = {
      term = {
        cmds = {
          "zig build\r\n"
        }
      }
    }
  },
})

print("Hello From Harpoon.lua")
