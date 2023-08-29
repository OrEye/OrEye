


if not getgenv().Tython then
    getgenv().Tython = true
    local HttpService = game:GetService("HttpService")
    loadstring(game:HttpGet("https://oreye.github.io/OrEye/console.lua"))()


    coInfo("Hello World from Tython Hook")
    coError("ERR: Tython HOOK abrted \n\nnil-x error line 400 \npackages err, line 59, \nstringerror line 62")
    local tython = {}

        function tython:execute(CODE, args)
            if not args then
                args = nil
            end
            loadstring(CODE)(args)
        end

        function tython:getPackages(url)

        end

        function tython.load(library)
            if library == "console" then
                local console = {}
                        function console.info(x)
                            coInfo(x)
                        end

                        function console.warn(x)
                            coWarn(x)
                        end

                        function console.error(x)
                            coError(x)
                        end

                        function console.print(x)
                            coPrint(x)
                        end
                return console
            elseif library == "sound" then
                local sound = {}
                
                    function sound.play(XID)
                        local sound = Instance.new("Sound", game.Workspace)
                        sound.SoundId = XID
                        sound.Volume = 5
                        sound:Play()
                    end

                return sound
            elseif library == "http" then
                local http = {}

                function http.protocol(protocol, url, data)
                    if protocol == "get" then
                        local response = HttpService:GetAsync(url)
                        return response
                    elseif protocol == "post" then
                        local headers = {
                            ["Content-Type"] = "application/json",
                        }
                        
                        local requestData = HttpService:JSONEncode(data)
                        local response = HttpService:PostAsync(url, requestData, Enum.HttpContentType.ApplicationJson, false, headers)
                        return response
                    else
                        coError("Invalid protocol")
                    end
                end
            
                return http
            end
        end

        function tython.hash(x, data)
            if x == "sha384" then
                local hashencrypt = sha384_hash(data)
                return hashencrypt
            elseif x == "lz4" then
                local hashencrypt = lz4compress(data)
                return hashencrypt
            end
        end

    return tython
else
    coError("Tython Hook already loaded :"..getgenv().Tython)
end
