### HBox Class###
# HBox dispose children on the same line

define(

    "libs/solid/widgets/containers/HBox",
    ["libs/solid/widgets/AbstractWidget"],
    (AbstractWidget)->

        class HBox extends AbstractWidget

            tagName: "div"
            className: "solid_hbox"

            #### *constructor()* method takes an object with the options
            constructor:(options)->
                super(options)
                @options.padding = @options.padding || 0
                @render()

            render:=>
                super()

            #### * addChild(`widget`)* method takes one arguments
            #* the *widget* to add to the widget as a child. It must be a subclass of AbstractWidget
            #
            # this method doesn't return any value. It takes the widget and add it to the list of @children.
            # It also take the DOM element for the added widget and add it to the DOM element for the parent
            # widget
            addChild:(widget)=>

                if @children.length == 0
                    marginLeft = 0
                else
                    lastElement = $(_(@children).last().el)
                    marginLeft = parseFloat(lastElement.css('margin-left')) + @options.padding + lastElement.outerWidth()

                super(widget)

                $(_(@children).last().el)
                        .css("display", "block")
                        .css("position", "absolute")
                        .css("margin-top", "0px")
                        .css("margin-left", marginLeft + "px")

)