###
    Parent class for every item that shows
    in the DOM
###

define(
    "components/DisplayObject"

    ["Root"],

    (Root)->
        class solid.components.DisplayObject extends Root

            @_domElement

            constructor:->
                super()

            render:=>
                super()

            getDomElement:=>
                if !@_domElement
                    @_domElement = document.createElement('div')

                return @_domElementV
)

