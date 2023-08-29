local HttpService = game:GetService("HttpService")
local consola = loadstring(game:HttpGet("https://oreye.github.io/OrEye/console.lua"))()



local tython = {}

    function tython:getConsoleFunctions()
        local console = {}
            function console.info(x: string)
                consola.coInfo(x)
            end

            function console.warn(x: string)
                consola.coWarn(x)
            end

            function console.error(x: string)
                consola.coError(x)
            end

            function console.print(x: string)
                consola.coPrint(x)
            end
        return console
    end

return tython
