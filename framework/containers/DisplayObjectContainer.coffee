
define(
    "containers/DisplayObjectContainer",

    ['components/DisplayObject'],

    (DisplayObject)->

        class solid.containers.DisplayObjectContainer extends DisplayObject

            @children = []

            constructor:->
                super()

            addChild:(displayObject)=>
                # Save the new DisplayObject into the list
                @children.push(displayObject)

                # Add the DisplayObject domElement into the parent domElement
                jQuery(@domElement).append(displayObject.domElement)

            ###
            # Remove a DisplayObject instance from the container
            # @parameter displayObject a DisplayObject instance that has to be removed
            ###
            removeChild:(displayObject)=>

                # Remove the display object from the list of children
                newList = []
                for child in @children
                    do (child)->
                        if(child != displayObject)
                            newList.push(child)
                @children = newList

                # Remove the DisplayObject domElement from the parent domElement
                jQuery(@domElement).remove(displayObject.domElement)

)

