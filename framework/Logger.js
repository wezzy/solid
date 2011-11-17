/*
 Solid framework
 Logger
*/
var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
solid.load(["solid.Root"], function(S) {
  var Logger;
  Logger = (function() {
    __extends(Logger, S.Root);
    function Logger() {
      Logger.__super__.constructor.call(this);
    }
    Logger.prototype.log = function(message, title) {
      if (S.debugLevel > 0) {
        if (title) {
          return console.log(message, title);
        } else {
          return console.log(message);
        }
      }
    };
    return Logger;
  })();
  return solid.Logger = new Logger();
});