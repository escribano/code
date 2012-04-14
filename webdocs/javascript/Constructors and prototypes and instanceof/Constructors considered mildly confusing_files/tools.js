Object.prototype.forEachOwn = function(fun,thisp) {
  for (var p in this) {
    if (this.hasOwnProperty(p)) {      
      fun.call(thisp,p,this[p]);
    }
  }
  return this;
};

Object.prototype.extend = function() {
  var c = function(){};
  c.prototype = this;
  return new c();
};

Object.prototype.merge = function(props) {
  props.forEachOwn(function(p,v) {
    this[p] = v;
  });
  return this;
};

Object.prototype.extendWith = function(props) {
  return this.extend().merge(props);
};

function E(id) {
  return document.getElementById(id);
};

function s2a(sequence) {
  var r = [];
  for (var i = 0; i < sequence.length; i++) {
    r.push(sequence[i]);
  }
  return r;
}


function addAfter(prev,element) {
  if (!element.tagName) element  = document.createElement(element);
  var next = prev.nextSibling;
  if (next) {
    prev.parentNode.insertBefore(element,next);
  }
  else {
    prev.parentNode.appendChild(element);
  }
  return element;
}

Array.prototype.getLast = function() {
  return this[this.length-1];
};

// this javascript file provides implementations for several core functions
// that aren't provided in all browsers but are just too useful to ignore

// currently, all of the implementations are taken straight from the
// mozilla developer references
//
// see:
// http://developer.mozilla.org/en/docs/Core_JavaScript_1.5_Reference:Global_Objects:Array
//

if (!Array.prototype.forEach)
{
  Array.prototype.forEach = function(fun /*, thisp*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
        fun.call(thisp, this[i], i, this);
    }
  };
}

if (!Array.prototype.filter)
{
  Array.prototype.filter = function(fun /*, thisp*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var res = new Array();
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
      {
        var val = this[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, this))
          res.push(val);
      }
    }

    return res;
  };
}

if (!Array.prototype.map)
{
  Array.prototype.map = function(fun /*, thisp*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    var res = new Array(len);
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
        res[i] = fun.call(thisp, this[i], i, this);
    }

    return res;
  };
}


if (!Array.prototype.reduce)
{
  Array.prototype.reduce = function(fun /*, initial*/)
  {
    var len = this.length;
    if (typeof fun != "function")
      throw new TypeError();

    // no value to return if no initial value and an empty array
    if (len == 0 && arguments.length == 1)
      throw new TypeError();

    var i = 0;
    if (arguments.length >= 2)
    {
      var rv = arguments[1];
    }
    else
    {
      do
      {
        if (i in this)
        {
          rv = this[i++];
          break;
        }

        // if array contains no values, no initial value to return
        if (++i >= len)
          throw new TypeError();
      }
      while (true);
    }

    for (; i < len; i++)
    {
      if (i in this)
        rv = fun.call(null, rv, this[i], i, this);
    }

    return rv;
  };
}

