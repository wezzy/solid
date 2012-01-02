### VBox Class###
# VBox dispose children one below the other

define(

    "libs/solid/widgets/containers/VBox",
    ["libs/solid/widgets/AbstractWidget"],
    (AbstractWidget)->

        class VBox extends AbstractWidget

            tagName: "div"
            className: "solid_vbox"

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
                    marginTop = 0
                else
                    lastElement = $(_(@children).last().el)
                    marginTop = parseFloat(lastElement.css('margin-top')) + @options.padding + lastElement.outerHeight()

                super(widget)

                $(_(@children).last().el)
                        .css("display", "block")
                        .css("position", "absolute")
                        .css("margin-left", "0px")
                        .css("margin-top", marginTop + "px")

)