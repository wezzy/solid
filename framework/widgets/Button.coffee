### Button Class###
# Button create a standard button

S.export(

    "solid.widgets.Button",
    ["solid.widgets.AbstractWidget"],
    (AbstractWidget)->

        class Button extends AbstractWidget

            tagName: "button"
            className: "solid_button"

            #### *constructor()* method takes an object with the options
            constructor:(options)->
                super(options)
                
            render:=>
                super()

                label = this.options.label || "LABEL"

                jQuery(@el).html(label)
)
