{pkgs, config, lib,...} : {

    services.kanata = {
        enable = true;
        package = pkgs.kanata;
        keyboards.luoluo.configFile = ../static/config/kanata.kbd;
    };
}