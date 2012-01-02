### AbstractWidget Class###
# AbstractWidget is the base class that every widget should inherit from
#
# Widgets fires the following events:
# `RENDERING_COMPLETE` - after each render
# `WIDGET_ADDED` - when a widget is added
# `WIDGET_REMOVED` - when a widget is removed
#
define(
    "libs/solid/widgets/AbstractWidget"
    ()->

        _createDomBuffer = _.once(()->
            el = $("<div id='solid_buffer_zone' style='display:none'>")
            $("body").append(el)
        )

        class AbstractWidget extends Backbone.View

            #### *constructor()* method takes an object with the options
            #
            # `@parent` property is created to contain the reference to the parent widget
            # `@children` property is created to contain the list of children for the widget
            constructor:(options)->
                if !options 
                  options = {}
                  
                super(options)
                _createDomBuffer()
                @parent = null
                @id = options.id || null
                @children = []

            #### * render()* method takes one arguments
            #
            # render the element
            render:=>
                super()
                $(@el).attr('id', @id)
                @trigger("RENDERING_COMPLETE", this)

            #### * addChild(`widget`)* method takes one arguments
            #* the *widget* to add to the widget as a child. It must be a subclass of AbstractWidget
            #
            # this method doesn't return any value. It takes the widget and add it to the list of @children.
            # It also take the DOM element for the added widget and add it to the DOM element for the parent
            # widget
            addChild:(widget)=>

                $(widget.el).detach()

                if @el?
                    $(@el).append(widget.el)

                widget.parent = this
                @children.push(widget)

                @trigger("WIDGET_ADDED", widget)

            #### * removeChild(`widget`)* method takes one arguments
            #* the *widget* to remove. It must be a subclass of AbstractWidget and a child of the current widget
            #
            # this method doesn't return any value. It takes the widget and remove it from the list of @children.
            # It also take the DOM element for the widget parameter and add remove it form the DOM element for the parent
            # widget
            removeChild:(widget)=>

                @children = _.filter(@children, (el)->
                    return el != widget
                )

                widget.parent = null

                if @el?
                    $(@el).remove(widget.el)

                @trigger("WIDGET_REMOVED", widget)
)
