### VBox Class###
# VBox dispose children one below the other

S.export(

    "solid.widgets.containers.VBox",
    ["solid.widgets.AbstractWidget"],
    (AbstractWidget)->

        class VBox extends AbstractWidget

            tagName: "div"
            className: "solid_vbox"

            #### *constructor()* method takes an object with the options
            constructor:(options)->
                options? options.padding = options.padding || 0
                super(options)
                

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
