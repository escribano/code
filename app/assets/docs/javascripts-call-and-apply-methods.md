<http://vikasrao.wordpress.com/2011/06/09/javascripts-call-and-apply-methods/>

JavaScript’s call and apply methods
June 9, 2011
A lot of people starting out with JavaScript are unsure of how JavaScript’s call() and apply() methods work. Some have a theoretical understanding of it but are not sure where they would use these powerful methods. I’m taking a stab below at explaining them:

Call and Apply are JavaScript methods used to pass the required object scope for a function to execute as expected.

The syntax for the JavaScript call method:

fun.call(object, arg1, arg2, ...)

The syntax for the JavaScript apply method:

fun.apply(object, [argsArray])

The main difference is that call() accepts an argument list, while apply() accepts a single array of arguments.

So if you want to call a function which prints something and pass an object scope for it to execute in, you can do:

function printSomething() {
    console.log(this);
}
printSomething.apply(new SomeObject(),[]); // empty arguments array
// OR
printSomething.call(new SomeObject()); // no arguments

Here’s a JsFiddle example below which explains how scope can be passed as required: http://jsfiddle.net/8uRXe/8/

The first alert window uses the scope of the dojo widget, while the second call without any scope passed to it uses the default window scope for the “this” object printed from the printSomething() method.

Dojo provides a hitch method which allows the programmer to pass around scope. This hitch method along with dojo.connect is probably what I love most about Dojo.

var myObj = {
      foo: "bar"
  };
  var func = dojo.hitch(myObj, function() {
      console.log(this.foo);
  });
  func();
  
Here’s a small example continuing the earlier examples: http://jsfiddle.net/8uRXe/9/

Hopefully this sheds some light on these 2 powerful JavaScript methods.