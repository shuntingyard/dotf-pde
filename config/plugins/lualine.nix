{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        globalstatus = true;
        # iconsEnabled = false;

        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "|";
          right = "|";
        };
      };

      # +-------------------------------------------------+
      # | A | B | C                             X | Y | Z |
      # +-------------------------------------------------+
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" ];
        lualine_c = [ "filename" "diff" ];

        lualine_x = [
          "diagnostics"

          # show active language servers
          {
            __unkeyed-1 = {
              __raw = ''
                function()
                    local msg = ""
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            msg = msg .. " " .. client.name
                        end
                    end
                    return msg
                end
              '';
            };
            icon = "";
            color.fg = "#ffffff";
          }
          "encoding"
          "fileformat"
          "filetype"
        ];
      };
    };
  };
}
