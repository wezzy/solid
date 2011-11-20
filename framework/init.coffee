###
  Solid Framework
  Startup script
###

# Global namespace for Solid
solid = {}
solid.components = {}
solid.containers = {}

# Set to zero to prevent logging
solid.debugLevel = 1

# Avoid namespace conflicts with $
# jQuery.noConflict()

# Export the solid namespace
window.solid = solid
