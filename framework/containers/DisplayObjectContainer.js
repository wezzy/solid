var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
  for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
  function ctor() { this.constructor = child; }
  ctor.prototype = parent.prototype;
  child.prototype = new ctor;
  child.__super__ = parent.prototype;
  return child;
};
solid.load(['solid.components.DisplayObject'], function(S) {
  return solid.DisplayObjectContainer = (function() {
    __extends(DisplayObjectContainer, S.DisplayObject);
    DisplayObjectContainer.children = [];
    function DisplayObjectContainer() {
      this.removeChild = __bind(this.removeChild, this);
      this.addChild = __bind(this.addChild, this);      DisplayObjectContainer.__super__.constructor.call(this);
    }
    DisplayObjectContainer.prototype.addChild = function(displayObject) {
      this.children.push(displayObject);
      return jQuery(this.domElement).append(displayObject.domElement);
    };
    /*
            # Remove a DisplayObject instance from the container
            # @parameter displayObject a DisplayObject instance that has to be removed
            */
    DisplayObjectContainer.prototype.removeChild = function(displayObject) {
      var child, newList, _fn, _i, _len, _ref;
      newList = [];
      _ref = this.children;
      _fn = function(child) {
        if (child !== displayObject) {
          return newList.push(child);
        }
      };
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        child = _ref[_i];
        _fn(child);
      }
      this.children = newList;
      return jQuery(this.domElement).remove(displayObject.domElement);
    };
    return DisplayObjectContainer;
  })();
});