I think the main docs are [http://msdn.microsoft.com/en-us/library/ms537634.aspx](http://msdn.microsoft.com/en-us/library/ms537634.aspx). Expressions can be used anywhere in CSS, its not just 'zoom', using zoom or *zoom is really a hack to avoid other browsers from trying to interpret the expression.  There are numerous examples of using expression to solve various problems.  I used it to support PNG24s in IE 6,

````
/* css */
.png24{filter:expression(applyPNGFilter(this))}

/* javascript */
applyPNGFilter = function(o) {
    var t = 'a_pixel.png',
        s;
    if (o.src != t) {
        s = o.src;
        o.src = t;
        o.runtimeStyle.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='" + s + "',sizingMethod='scale')";
    }
}
````

Applying a class of 'png24' to any image would, in IE 6 (because I used an if IE conditional to define the style) cause a PNG 24 image to load correctly.  I can't recall the inspiration for this hack but it was wonderful at the time :)

Hope this helps
