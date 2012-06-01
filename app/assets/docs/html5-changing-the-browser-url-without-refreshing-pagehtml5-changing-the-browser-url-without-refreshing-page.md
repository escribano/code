<http://spoiledmilk.dk/blog/html5-changing-the-browser-url-without-refreshing-page>

# HTML5: Changing the browser-URL without refreshing page

An often overlooked feature of HTML5 is the new “onpopstate” event.

This new feature offers you a way to change the URL displayed in the browser* through javascript without reloading the page. It will also create a back-button event and you even have a state object you can interact with.

This means you won’t have to use the hash-hack anymore if you want add state to your AJAX-application, and search engines will be able to index your pages too.

So how does it work? Well, it’s fairly simple. In Chrome you write:

````js
window.history.pushState(“object or string”, “Title”, “/new-url”);
````

Executing this line of code will change the URL to my-domain.com/new-url (3rd option). The “Title” string (2nd option) is intended to describe the new state, and will not change the title of the document as one might otherwise expect. The W3 documentation states:

“Titles associated with session history entries need not have any relation with the current title of the Document. The title of a session history entry is intended to explain the state of the document at that point, so that the user can navigate the document’s history.”

So if you want the document’s title to change to match the title of the history entry, you’ll need to write a hook for that (hint: just tie a function to the onpopstate event). Finally, “object or string” (1st option) is a way to pass an object to the state which you can then use to manipulate the page.

You can programmatically invoke the back-function by running:

````
window.history.back();
````

And you can of course go forward too:

````
window.history.forward();
````

Or even go to a specific history state:
````
window.history.go(2);
````

The object you pass as the first option to the pushState function will stay with each state, so if you go back in the history, you’ll get the object for that state. If you need to manipulate a state (instead of creating a new one) you can use:

````
window.history.replaceState(“object or string”, “Title”, “/another-new-url”);
````

Note that while this will change the URL of the page, it will not allow the user to click the back-button to go back to the previous state because you’re replacing the current state, not adding a new one. So, this is the correct behaviour.

Personally, I think the URL should be the first parameter and then the two other options should be optional. Regardless, this feature will certainly come in handy when working with AJAX- and Flash-applications that need state (read: bookmarkable pages and back-button support). Anyone looking to make their Flash- or AJAX-application indexable by search engines so they will get better raking in Google and the likes, should also have a look at this new feature.

The most prominent implementation of this HTML5-feature that I’ve seen is in the new Flickr layout. Here’s an example page (remember to enable the new layout if you haven’t already). Now, if you’re using the latest version of Chrome or Safari and click one of the sets, e.g. “Strobist”, it will slide open and the URL will change but you’ll notice that the page doesn’t reload.

It’s worth noting that Flickr uses replaceState instead of pushState – in other words, they don’t add a back-button event. I’m guessing they feel that switching back and forth between opened/closed sets is too small a change for a back-button event (I’d certainly agree with them on that decision), so instead they just replace the URL so if you copy/paste the link to a friend, they’ll see the exact same page that you did.

Another interesting thing is how Flickr still use the old hash-hack as a fallback if you’re running on browsers that don’t support this new HTML5-feature. I predict/hope that a lot of the plugins that help you easily implement the hash-hack will bake this into their core so people with new browsers can start reaping the benefits.

The latest versions of Chrome and Safari already have support for “onpopstate” and Firefox 4 will have support for it as well. Unfortunately, it seems like IE9 won’t be supporting this feature if we are to believe this Wikipedia article (“Trident” is IE’s layout engine).

Check out the W3 specification for more info.

* For security reasons, you can only change the path of the URL, not the domain itself. So you can change anything in the URL after my-domain.com/[change-the-stuff-here.html].