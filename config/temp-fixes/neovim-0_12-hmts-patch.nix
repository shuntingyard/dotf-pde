{ pkgs, ... }:
{
  # With a little help form Gemini:
  #
  plugins.hmts = {
    enable = true;
    package = pkgs.vimPlugins.hmts-nvim.overrideAttrs (old: {
      postPatch = (old.postPatch or "") + ''
        sed -i '1i\
        local orig_add_predicate = vim.treesitter.query.add_predicate\
        vim.treesitter.query.add_predicate = function(name, handler, opts)\
          return orig_add_predicate(name, function(match, pattern, bufnr, pred, metadata)\
            for k, v in pairs(match) do\
              if type(v) == "table" and v[1] then match[k] = v[1] end\
            end\
            return handler(match, pattern, bufnr, pred, metadata)\
          end, opts)\
        end' plugin/hmts.lua
      '';
    });
  };
}
