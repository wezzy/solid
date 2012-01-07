S.export(
    "solid.widgets.Select"
    ["solid.widgets.AbstractWidget"]
    (AbstractWidget)->

        class Select extends AbstractWidget
            
            tagName: "select"
            className: "solid_select"

            constructor:(options)->
                super(options)
                options.data? @data = options.data
                @render()

            render:()=>
                super()
                html = ""
                @data? @data.each((element, index)->
                    html = "<option value='" + element.get('id') + "'>" + element.get('label') + "</option>";
                )

                jQuery(@el).html(html)

)
