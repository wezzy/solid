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
  solid.load(['solid.components.DisplayObject'], function(S) {
    return solid.components.Button = (function() {
      __extends(Button, S.DisplayObject);
      Button.label;
      Button.button;
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
        return Button.__super__.render.call(this);
      };
      return Button;
    })();
  });
}).call(this);
