### Button Class###
# Button create a standard button

define(

    "libs/solid/widgets/Button",
    ["libs/solid/widgets/AbstractWidget"],
    (AbstractWidget)->

        class Button extends AbstractWidget

            tagName: "button"
            className: "solid_button"

            #### *constructor()* method takes an object with the options
            constructor:(options)->
                super(options)
                @render()
                
            render:=>
                super()

                label = this.options.label || "LABEL"

                $(@el).html(label)
)