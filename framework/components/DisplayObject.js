(function() {
  /*
      Parent class for every item that shows
      in the DOM
  */
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  define("components/DisplayObject", ["Root", "events/EventEmitter"], function(Root, EventEmitter) {
    return solid.components.DisplayObject = (function() {
      __extends(DisplayObject, Root);
      DisplayObject.include(EventEmitter);
      DisplayObject._domElement;
      function DisplayObject() {
        this.getDomElement = __bind(this.getDomElement, this);
        this.render = __bind(this.render, this);        DisplayObject.__super__.constructor.call(this);
      }
      DisplayObject.prototype.render = function() {
        return DisplayObject.__super__.render.call(this);
      };
      DisplayObject.prototype.getDomElement = function() {
        if (!this._domElement) {
          this._domElement = document.createElement('div');
        }
        return this._domElementV;
      };
      return DisplayObject;
    })();
  });
}).call(this);
