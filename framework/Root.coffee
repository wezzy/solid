
### Root Class###
# This class is the root class for every class in the framework

define(
    "Root",

    ()->
        moduleKeywords = ['extended', 'included']

        class solid.Root

            constructor:->
                # Do dnothing

            # Support for Mixins
            # http://arcturo.github.com/library/coffeescript/03_classes.html
            @extend: (obj) ->
                for key, value of obj when key not in moduleKeywords
                    @[key] = value

                obj.extended?.apply(@)
                this

            @include: (obj) ->
                for key, value of obj when key not in moduleKeywords
                    # Assign properties to the prototype
                    @::[key] = value

                obj.included?.apply(@)
                this
)
