###
    Add the ability to fire events to Objects
###

define(
    "events/EventEmitter",
    [],
    ()->
        EventEmitter =

            @_jsEvents = [" blur", "focus", "focusin", "focusout", "load", "resize", "scroll", "unload", "click", "dblclick", "mousedown",  "mouseup","mousemove", "mouseover", "mouseout", "mouseenter",  "mouseleave", "change", "select", "submit", "keydown", "keypress", "keyup", "error", "contextmenu"]

            on:(event, callback)->

                if !@_eventTable
                    @_eventTable = {}

                if !@_eventTable[event.name]
                    @_eventTable[event.name] = []

                @_eventTable[event.name].push(callback)

                # If this element has a domNode (it's a DisplayObject child)
                # listen for dom events

                if @_domElement and event.name in @_jsEvents
                    jQuery(@_domElement).on(event.name, callback)



            trigger:(event)->

                if @_eventTable and @_eventTable[event.name]
                    callbacks = @_eventTable[event.name]
                    for c in callbacks
                        c(event)

                # If this element has a domNode (it's a DisplayObject child)
                # trigger the event in the dom element
                if @_domElement and event.name in @_jsEvents
                    jQuery(@_domElement).trigger(event)



)
