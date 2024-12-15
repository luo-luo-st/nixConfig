{pkgs, config, lib,...} :
let
    OPENAI_API_KEY = builtins.readFile ../env/OPENAI_API_KEY;
in
{
    environment.variables = {
        OPENAI_API_KEY = OPENAI_API_KEY;
    };
}