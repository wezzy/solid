
###
  Solid Application Class
  this is the container for the entire app
###

solid.load(['solid.containers.DisplayObjectContainer'], (S)->

    class solid.Application extends S.DisplayObjectContainer

        constructor:->
            super()

)
