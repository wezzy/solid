 ###
    Parent class for every item that shows
    in the DOM
 ###

solid.load(['solid.Root'], (S)->
    class solid.components.DisplayObject extends solid.Root

        @domElement

        constructor:->
            super()

            @domElement = document.createElement('div')

        render:=>
            super()
)
