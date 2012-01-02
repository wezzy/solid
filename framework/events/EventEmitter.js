(function() {
  /*
      Add the ability to fire events to Objects
  */  define("events/EventEmitter", [], function() {
    var EventEmitter;
    return EventEmitter = {
      on: function(event, callback) {
        if (!this._eventTable) {
          this._eventTable = {};
        }
        if (!this._eventTable[event.name]) {
          this._eventTable[event.name] = [];
        }
        this._eventTable[event.name].push(callback);
        return this._jsEvents = [" blur", "focus", "focusin", "focusout", "load", "resize", "scroll", "unload", "click", "dblclick", "mousedown", "mouseup", "mousemove", "mouseover", "mouseout", "mouseenter", "mouseleave", "change", "select", "submit", "keydown", "keypress", "keyup", "error", "contextmenu"];
      },
      trigger: function(event) {
        var c, callbacks, _i, _len, _results;
        if (this._eventTable && this._eventTable[event.name]) {
          callbacks = this._eventTable[event.name];
          _results = [];
          for (_i = 0, _len = callbacks.length; _i < _len; _i++) {
            c = callbacks[_i];
            _results.push(c(event));
          }
          return _results;
        }
      }
    };
  });
}).call(this);
