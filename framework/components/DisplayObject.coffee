###
    Parent class for every item that shows
    in the DOM
###

solid.load(['solid.Root'], (S)->

    class solid.components.DisplayObject extends S.Root

        @_domElement

        constructor:->
            super()

        render:=>
            super()

        getDomElement:=>
            if !@_domElement
                @_domElement = document.createElement('div')

            return @_domElement
)
