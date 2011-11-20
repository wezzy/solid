
###
  Solid Application Class
  this is the container for the entire app
###

define(

    "Application",

    ['containers/DisplayObjectContainer', 'libs/jquery'],

    (DisplayObjectContainer)->

        class solid.Application extends DisplayObjectContainer

            constructor:->
                super()
)
