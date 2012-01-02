###
    Parent class for every item that shows
    in the DOM
###

define(
    "components/DisplayObject"
    ["Root", "events/EventEmitter"],
    (Root, EventEmitter)->

        class solid.components.DisplayObject extends Root

            @include EventEmitter
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

