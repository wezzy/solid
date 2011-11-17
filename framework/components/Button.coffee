###
# Button Widget
# Display a standard button
###

solid.load(['solid.components.DisplayObject'], (S)->

    class solid.components.Button extends S.DisplayObject

        @label
        @button
        @_displayed = false

        constructor:(@label)->
            super()

            @button = jQuery('<input type="button" />')

            if @label
                @button.attr('value', @label)
            jQuery(@domElement).append(@button)

        render:=>
            super()
            if !@_displayed
                domEl = @getDomElement()
                $(domEl).append(@button)
)
