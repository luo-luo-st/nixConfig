{pkgs, config, lib,...} : 
let 
  userSettings = builtins.fromJSON(builtins.readFile ../static/config/zed.json);
in 
{
    programs.zed-editor = {
        enable = true;
        package = pkgs.zed-editor;
        userSettings = userSettings;
    };
}