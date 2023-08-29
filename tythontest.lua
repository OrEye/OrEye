local HttpService = game:GetService("HttpService")
local consola = loadstring(game:HttpGet("https://oreye.github.io/OrEye/console.lua"))()



local tython = {}

    function tython:getConsoleFunctions()
        local console = {}
            function console.info(x)
                consola.coInfo(x)
            end

            function console.warn(x)
                consola.coWarn(x)
            end

            function console.error(x)
                consola.coError(x)
            end

            function console.print(x)
                consola.coPrint(x)
            end
        return console
    end

return tython
