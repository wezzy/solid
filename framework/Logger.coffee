###
 Solid framework
 Logger
###

solid.load(["solid.Root"], (S)->

    class Logger extends S.Root

        constructor:->
            super()

        log:(message, title)->
            if (S.debugLevel > 0)
                if(title)
                    console.log(message, title)
                else
                    console.log(message)


    solid.Logger = new Logger()
)
