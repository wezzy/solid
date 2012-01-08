### Stack Class###
# Stack hanlde more objects and display just one widget at time

S.export(

    "solid.widgets.containers.Stack",
    ["solid.widgets.AbstractWidget"],
    (AbstractWidget)->

        class Stack extends AbstractWidget

            tagName: "div"
            className: "solid_stack"

            #### *constructor()* method takes an object with the options
            constructor:(options)->
                @currentWidget = null
                super(options)
                

            render:=>
                super()
            
            #### * addChild(`widget`)* method takes one arguments
            #* the *widget* to add to the widget as a child. It must be a subclass of AbstractWidget
            #
            # this method hide all the widget added to the stack, please use setCurrentWidget(`widget`)
			# to show the widget that you need
            addChild:(widget)=>
                if @children.length > 0
                  $(widget.el).hide()
                else
                  @currentWidget = widget
                super(widget)
		    
            #### * setCurrentWidget(`widget`)* method takes one arguments
            #* the *widget* that you want to show. If the widget is a string the method search for the widget
            # with the specified id
            #
            # this method doesn't return any value. It takes the widget and add it to the list of @children.
            # It also take the DOM element for the added widget and add it to the DOM element for the parent
            # widget
            setCurrentWidget:(widget)=>
              
              $(@currentWidget.el).hide()

              if typeof(widget) == "string"
              
                w = _.find(@children, (element)->
                  return element.id == widget;
                )
              
              else
                w = widget

              @currentWidget = w
              $(@currentWidget.el).show()


				

)
