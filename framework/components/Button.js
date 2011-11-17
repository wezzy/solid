(function() {
  /*
  # Button Widget
  # Display a standard button
  */
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; }, __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  define("components/Button", ['components/DisplayObject'], function(DisplayObject) {
    return solid.components.Button = (function() {
      __extends(Button, DisplayObject);
      Button.label;
      Button.button;
      Button._displayed = false;
      function Button(label) {
        this.label = label;
        this.render = __bind(this.render, this);
        Button.__super__.constructor.call(this);
        this.button = jQuery('<input type="button" />');
        if (this.label) {
          this.button.attr('value', this.label);
        }
        jQuery(this.domElement).append(this.button);
      }
      Button.prototype.render = function() {
        var domEl;
        Button.__super__.render.call(this);
        if (!this._displayed) {
          domEl = this.getDomElement();
          return $(domEl).append(this.button);
        }
      };
      return Button;
    })();
  });
}).call(this);
