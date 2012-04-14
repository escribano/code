<http://stackoverflow.com/questions/8422550/defining-a-property-getter-for-my-singleton-class-in-coffeescript>

CoffeeScript's in is for arrays (and array-like objects); of compiles to JavaScript's in. So what you want is

console.log 'Factory' of Folds
That's not the core problem, though: The core problem is that the public method you're using actually defines a property with the given name on the class' prototype, as the line

Object.defineProperty @prototype, name, config
tells us. So what you really want is

console.log 'Factory' of Folds.prototype  # should be true
which means that the Factory method will be available as a property of every Folds instance.

link|improve this answer
answered Dec 8 '11 at 0:06

Trevor Burnham
15.7k32454
Whoa, great catch, I feel a bit ashamed. But unfortunately it's a classic case of "so it wouldn't work even if I had my issue figured out", and I still have my issue. For instance I couldn't and still can't call Folds.Factory.create() since Factory is undefined. – Vic Szpilman Dec 8 '11 at 0:13
Oh thanks, now I get it! I guess it's what I get for moving on to CoffeeScript without deeply understanding JavaScript's prototypal object orientation. – Vic Szpilman Dec 8 '11 at 0:19
And so I guess this means I should be defining "@public 'Factory'" not on Folds, which is a 'static class', but on _Folds instead, since that's my real singleton instance class? Or maybe I should have a '@static' method for defining a property on the class itself, not on the prototype, when it's a static class I won't be instancing? – Vic Szpilman Dec 8 '11 at 0:21
Yeah, definitely define an @static method that does Object.defineProperty @ instead of @prototype. – Trevor Burnham Dec 8 '11 at 0:30