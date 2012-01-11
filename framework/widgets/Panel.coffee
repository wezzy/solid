
S.export(
    "solid.widgets.Panel",
    ["solid.widgets.AbstractWidget"],
    (AbstractWidget)->
    
        class Panel extends AbstractWidget
            
            tagName: "div"
            className: "solid_panel"

            constructor:(options)->
                super(options)
                @mouseDown = false

                @header = $(document.createElement("div")).addClass("header")
                $(@el).append(@header)

                # Handle Drag
                jQuery(@header)
                    .bind('mousedown', (evt)=>
                        @mouseDown = evt
                        evt.stopImmediatePropagation()
                    )
                    .bind('mouseup', (evt)=>
                        @mouseDown = false
                        evt.stopImmediatePropagation()
                    )

                $(document.body).bind('mousemove', (evt)=>
                    if !@mouseDown then return

                    deltaX = @mouseDown.clientX - evt.clientX
                    deltaY = @mouseDown.clientY - evt.clientY
                    @mouseDown = evt

                    position = jQuery(@el).position()
                    jQuery(@el)
                        .css('left', position.left - deltaX)
                        .css('top', position.top - deltaY)

                    evt.stopImmediatePropagation()
                )
                
)
