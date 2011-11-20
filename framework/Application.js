(function() {
  /*
    Solid Application Class
    this is the container for the entire app
  */
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  define("Application", ['containers/DisplayObjectContainer', 'libs/jquery'], function(DisplayObjectContainer) {
    return solid.Application = (function() {
      __extends(Application, DisplayObjectContainer);
      function Application() {
        Application.__super__.constructor.call(this);
      }
      return Application;
    })();
  });
}).call(this);
