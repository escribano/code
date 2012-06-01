<http://dev.enekoalonso.com/2008/12/29/modifying-the-url-hash-without-affecting-the-browser-history/>

## Modifying the URL Hash without affecting the browser history

Written by Eneko Alonso on December 29, 2008 — Leave a Comment

Although this is not very common, some times you would like to modify the URL hash (this is the value after the # on the URL) without affecting the browser history. Let’s say you have multiple sets of tabs on your page or simply that your hash is going to change very often. But still want the user to be able to grab a permanent link to that page configuration.

The trick is to use the replace function, instead of directly assigning the value.

````
// Direct assignment will add a new step to the history on browsers like Firefox 3
window.location.hash = newHash;
// Using the replace function changes the hash without affecting the browser history.
window.location.replace(window.location.href.split('#')[0] + '#' +newHash);
````

Nice.
