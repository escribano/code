<http://badassjs.com/post/840846392/location-hash-is-dead-long-live-html5-pushstate>

location.hash is dead. Long live HTML5 pushState!

For a long time, location.hash was a way for AJAX applications to get back button and bookmarking support, and libraries like jQuery BBQ from Ben Alman made dealing with it cross browser a cinch.  Now, with HTML5 coming of age, there is a new feature that aims to replace the use of location.hash with a better solution: pushState.  Over on the Spoiled Milk blog, Jamie Appleseed describes the API as “a way to change the URL displayed in the browser through JavaScript without reloading the page.”  It works on the history object like this:

````
window.history.pushState(data, "Title", "/new-url");
````

The last argument is the new URL.  For security reasons you can only change the path of the URL, not the domain itself.  The second argument is a description of the new state.  And the first argument is some data that you might want to store along with the state.

In order to support the back and forward buttons you must be notified when they are clicked.  You can do that using the window.onpopstate event.  This event gives you access to the state data that you passed to pushState earlier.  Of course, you can manually go back and forward with the standard history functions.

Currently, pushState has support from the latest versions of Safari and Chrome, and Firefox 4 will be supporting it as well.  It is worth noting that Flickr is already using the API in their new layout.  I think that this is really the correct way to be dealing with history management in JavaScript applications since it changes the real URL instead of just the hash.  I’m very excited to see libraries like jQuery BBQ start to support this feature with fallback to the old hash trick.

If you’d like to read a more in depth overview of these new features, you should check out the aforementioned blog post <http://www.spoiledmilk.dk/blog/?p=1922> by Jamie Appleseed.  If reading specs is your thing, you can check out the relevant document here <http://www.w3.org/TR/html5/author/history.html>.