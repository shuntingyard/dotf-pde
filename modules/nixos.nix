{
  { config
    , lib
    , pkgs
    , ...
    }:
    with lib; let
    cfg = config.pde.nixos;

  # grab the base config
  pde = flake.packages.default;
  in
  {
  options = {
    pde.nixos = {
      enable = mkEnableOption "Enables pde-nixvim system-wide";
      # can we get the system here?
      /*
          system = lib.mkOption {
            type = lib.types.str;
            default = "x86_64-linux";
            description = lib.mdDoc "System for derivation";
          };
            */
      colorscheme = lib.mkOption {
        type = lib.types.str;
        default = "darkblue";
        description = lib.mdDoc "Set nvim system colorscheme";
      };
    };
  };

  config = mkIf cfg.enable {
    environment.systemPackages =
      let
        # test if you can extend
        pde-extended =
          pde.extend
            {
              colorscheme = "${cfg.colorscheme}";
            };
      in
      [ pde-extended ];
  };
}
