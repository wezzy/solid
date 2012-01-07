S.export(
    "solid.widgets.containers.Absolute"
    ["solid.widgets.AbstractWidget"]
    (AbstractWidget)->

        class Absolute extends AbstractWidget

            constructor:(options)->
                super(options)
                jQuery(@el).bind("resize", @render)
            
            #### * addChild(`widget`)* method takes one arguments
            #* the *widget* to add to the widget as a child. It must be a subclass of AbstractWidget
            #
            # this method doesn't return any value. It takes the widget and add it to the list of @children.
            # It also take the DOM element for the added widget and add it to the DOM element for the parent
            # widget
            addChild:(widget)=>
                jQuery(widget.el)
                    .css("position", "absolute")
                    .css('z-index', @children.length)
                super(widget)

)
