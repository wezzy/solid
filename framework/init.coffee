###
    Solid Framework
    Startup script

    Before including this file in the page the following libraries must be loaded
        jquery - http://jquery.com/
        underscore - http://documentcloud.github.com/underscore/
        backbone - http://documentcloud.github.com/backbone/
        json2 - https://github.com/douglascrockford/JSON-js (for older browser support)
        require - http://requirejs.org/
###

# Global namespace for Solid
solid = {}

###
    Initialize the framework
###
initialize = ()->

    # Configure require path
    if solid.config.requireConfig
        require.config(solid.config.requireConfig)
        
    # the framework is initialized
    solid.initialized = true

    
###
    Fix the path, solid use requirejs internally to load resources, but it defines a special
    url scheme that resemple the syntax of java. Ex. "solid.widget.AbstractWidget". If the user
    pass a request in this format this function transform the request in the correct url
###
fixPath = (path)->
    if !solid.config.path
        alert("Please specify the path of the solid framework")
        return

    if path.indexOf("text!") >= 0
        # handle text plugin used inside the framework
        path = path.replace("text!", solid.config.path + "libs/text!")

    if path.indexOf("solid.") == 0
        path = path.replace("solid.", solid.config.path)
        path = path.replace(/\./g, "/")

    return path

internalRequire = window.require
internalDefine = window.define

# Wrap require functions to handle special name shortcuts
solid.import = (name, callback)->
    if !solid.initialized
        initialize()
    debugger
    name = _.map(name, (el)->
        return fixPath(el)
    )
    internalRequire.call(this, name, callback)

solid.export = (name, deps, callback)->

    if !solid.initialized
        initialize()
    name = fixPath(name)

    if arguments.length < 3
        callback = deps
        internalDefine.call(this, name, callback)
    else
        deps = _.map(deps, (el)->
            return fixPath(el)
        )
        internalDefine.call(this, name, deps, callback)
    
window.S = solid    # Publish the global namespace
