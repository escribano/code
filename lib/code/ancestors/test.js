var obj = {
 _prop: 0
}

var obj1 = {
 _prop: 0,
 getProp: function() {
  return this._prop;
 },
 setProp: function(value) {
  this._prop = value;
 }
};

var obj2 = {
 _prop: 0,
 get prop() {
  return this._prop;
 },
 set prop(value) {
  this._prop = value;
 },
};


var obj3 = {
 _prop: 0
}


Object.defineProperty(obj3, "prop", {
 get: function() {
  return this._prop;

 },
 set: function(val) {
  this._prop = val;
 }
});

var obj4 = {
 _prop: 0
}


obj4.__defineGetter__("_prop", function() {
 return this._prop;
});

obj4.__defineSetter__("_prop", function(val) {
 this._prop = val;
});


Methods
obj1.setProp(obj1.getProp() + 1);
completed
get / set
obj2.prop = obj2.prop + 1;
completed
Object.defineProperty
obj3.prop = obj3.prop + 1;
completed
__defineGetter__
obj4.prop = obj4.prop + 1;
completed
Property
obj.prop = obj.prop + 1;
completed
