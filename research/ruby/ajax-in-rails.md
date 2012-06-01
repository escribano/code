http://blog.madebydna.com/all/code/2011/12/05/ajax-in-rails-3.html

Ajax in Rails 3.1 - A Roadmap
by Andrea Singh | December 05, 2011
By adopting jQuery and including the UJS adapter, Rails 3.1 has made initiating Ajax requests as easy as adding a data-remote attribute to a DOM element.

In order to get the most out of this new infrastructure however, you do need to be a bit aware of how things are working under the hood. In this article, we'll take a look together at the parts of the Ajax request that the UJS adapter handles and at the parts that it doesn't. In addition, we'll explore ways the Ajax call can be customized to accomodate those instances where you need more fine-grained control.

Lastly, after discussing the technical details, I'll provide common use-case examples illustrating how the Rails UJS adapter can be harnessed to facilitate various types of Ajax calls.

jQuery and the $.ajax() Function
Before we dive into the UJS Ajax helper functions, here is a quick refresher on how jQuery itself handles asynchronous calls to the server. If you're familiar with implementing Ajax with jQuery, you might want to skip this section, but note that we'll be referring later on to a lot of the terms introduced here.

The special sauce that makes the asynchronous communication between the browser and the server possible is the XMLHttpRequest (XHR) object. For each Ajax request, an instance of this object needs to be created in order to encapsulate the different details of the request and to adequately handle the response.

In practice, instantiating the XHR object is rather involved because of browser discrepancies, but fortunately jQuery abstracts away the process of setting up the Ajax request and dealing with the server response. It does this by means of the general utility function $.ajax() which lies at the heart of every jQuery Ajax call. This function exposes the configurable properties of the XHR object and also allows you to hook into different stages of the Ajax lifecycle via callbacks.

The $.ajax() function takes a single parameter, an options object. This object is comprised of a set of key-value pairs used for configuration. You can find a full list of possible settings here. The more commonly used ones are:

url: where to send the request to (default is the current page)
type: usually GET or POST (default is GET)
dataType: the format of the data we expect back from the server. Sets the value of the "Accept" attribute in the HTTP request header object.
Callback functions to hook into various stages of the request, such beforeSend, complete, error and success
jQuery also provides some convenience methods you can avail yourself of to make an ajax call. These include $.get(), $.getScript(), $.getJSON(), $.post() and .load(), all of which pre-configure some of the above mentioned properties. In the end though, all of these methods call the $.ajax() function in the background.

Rails 3.1 and the jQuery UJS Adapter
As convenient as jQuery makes Ajax calls, the Rails UJS adapter goes one step further in facilitating asynchronous requests.

Note that the jQuery UJS adapter is part of the jquery-rails gem that is included in every new Rails 3.1 project. The file we're referring to here - jquery_ujs.js - is located inside that gem. It is available in the search path for Sprockets and not part of the base application tree. To check it out you can either open the jquery-rails gem and navigate to vendor/assets/javascripts/jquery_ujs.js, or else take a look at the file on Github.
Before the advent of Rails 3.1, a typical Ajax request with jQuery would look something like the code below. Here, we attach a listener to the click event of a link. When the event fires, an Ajax request is initiated, causing a comment form to be loaded into the DOM:

  // adds a comment form upon click
  $('a#add_comment').live('click', function(event) {
     $.ajax({
        url: $(this).href,
        dataType: 'script'
     });
     return false;
  });
Things are much simpler in Rails 3.1. The UJS adapter allows us to make exactly the same Ajax call with just one line of code:

<%= link_to "Add a Comment", new_comment_path, :remote => true %>
This will generate the following HTML:

<a href="/comments/new" data-remote="true">Add a Comment</a>
The UJS adapter accomplishes this by finding all DOM elements with the HTML5 attribute data-remote set to true and binds common events associated with those elements, such as the click event for links or the submit event for forms. When the event fires, an $.ajax() call is executed in the background.

In HTML5 data-* attributes allow us to embed custom data on all HTML elements. These custom attributes need to be prefixed by data- followed by the name of the attribute. The value can be anything. An example is data-remote="true". Data attributes are most often interacted with via JavaScript. In fact, jQuery has a convenient $.data( key ) method that returns the value for the data-[key] attribute on the element in question. For more information, see the jQuery API reference for the .data() method.
Let's now take a look at the parts of the UJS adapter that make this automagic possible.

Setting Up the Ajax Request: Configuration Defaults and How to Override Them
To get the most out of the UJS helpers, we first need to familiarize ourselves with the types of event listeners available and what kind of elements they're bound to. Additionally we need to know what Ajax configuration options are automatically set and in what manner they can be customized.

At first glance the UJS file might appear a bit daunting, but it is very well documented and is in fact not that hard to decipher. Basically, it defines a jQuery plugin function named $.rails. The main purpose of this function is to set up Ajax requests and other common JavaScript tasks, such as confirm dialogs, in an unobtrusive manner. In our discussion, we will be focusing on the Ajax-related aspects of the UJS adapter.

Near the beginning of the file, you'll find a bunch of different jQuery selectors grouped together and assigned to properties of the $.rails object:

// Link elements bound by jquery-ujs
linkClickSelector: 'a[data-confirm], a[data-method], a[data-remote], a[data-disable-with]',

// Select elements bound by jquery-ujs
inputChangeSelector: 'select[data-remote], input[data-remote], textarea[data-remote]',

// Form elements bound by jquery-ujs
formSubmitSelector: 'form',

// Form input elements bound by jquery-ujs
formInputClickSelector: 'form input[type=submit], form input[type=image], form button[type=submit], form button:not(button[type])'
Each property defines a jQuery selector collection. For example, the linkClickSelector property is composed of all link tags on the DOM containing specific data-* attributes like a[data-remote], a[data-method], etc.

This initial setup tells us that the UJS adapter is aware of:

links with data-* attributes
input, select and textarea elements, that have the data-remote attribute
forms and the different elements by which forms can be submitted
There is a reason those selectors have been assembled in this way. As we will see, they all will get specific event listeners attached to them.

In jQuery, as in other JavaScript frameworks, there are many ways to bind event listeners to DOM elements. As of jQuery 1.7, the preferred way is via the .on() method. Other methods to attach event handlers are .bind(), .live() and .delegate(). To find out more about how they differ, see this blog post on The Difference Between jQuery’s .bind(), .live(), and .delegate()
As an example of what this means, all links with a data-remote attribute set to true - and therefore part of the linkClickSelector group - get a click event listener attached to them. (Actually, it's the click.rails event, which is an example of a namespaced event).

In the code snippet below you can see how this is done. After checking for a few things like whether the link is supposed to generate a confirm popup, has been disabled or was right clicked, the callback function invokes the rails.handleRemote() method sending on the clicked DOM link as an argument.

  // https://github.com/rails/jquery-rails/blob/master/vendor/assets/javascripts/jquery_ujs.js

  $(document).delegate(rails.linkClickSelector, 'click.rails', function(e) {
    var link = $(this),
    method = link.data('method'),
    data = link.data('params');

    // This has to do with the :confirm attribute that you can set
    if (!rails.allowAction(link)) return rails.stopEverything(e);

    // check whether link is disabled
    if (link.is(rails.linkDisableSelector)) rails.disableElement(link);

    if (link.data('remote') !== undefined) {
      // Ajax call won't happen on right click
      if ( (e.metaKey || e.ctrlKey) && (!method || method === 'GET') && !data ) { return true; }

      if (rails.handleRemote(link) === false) { rails.enableElement(link); }
      return false;

    } else if (link.data('method')) {
      rails.handleMethod(link);
      return false;
    }
  });
Similar things take place for "ajaxified" input, select and textarea elements, which listen for the change event, as well as for forms which fire an Ajax call on submit.

The callback functions associated with these event listeners ultimately end up at the rails.handleRemote() function which is responsible for setting up and initializing the Ajax request. There is quite a bit going on in that function, so I won't paste it in its entirety, but you should check it out for yourself.

You will notice that the actual Ajax call only takes place at the very end of the function, while its main body is concerned with building up the Ajax options object that is destined for jQuery's $.ajax() method.

In following three tables, I've assembled some of the default configuration values for this options object based on the type of DOM element that has initiated the Ajax request. Also included are some notes on how these properties can be customized.

$.ajax() properties for links (on event type: "click")
url	 Read from the href attribute of the link.
method	 GET by default but can be overridden by setting the data-method attribute
dataType	 The default is script, i.e. the server is expected to return valid JavaScript. Can be overridden by setting the data-type attribute.
data	 Used for sending additional query parameters not included in the url string. You define extra parameters with the data-params attribute, e.g. data-params="data1=value1&data2=value2"
$.ajax() properties for input, select, textarea (on event type: "change")
url	 By default the current page, but can be overridden with the data-url attribute.
method	 GET by default but can be overridden by setting the data-method attribute
dataType	 The default dataType is script, i.e. the server is expected to return valid JavaScript. Can be overridden by setting the data-type attribute.
data	 Parameters are sent by serializing the element via element.serialize();
$.ajax() properties for forms (on event type: "submit")
url	 Picked up from the action attribute on forms.
method	 Rails usually sets the correct method attribute on forms to POST or PUT if you use the form_for view helper. You can also set the method attribute yourself.
dataType	 The default dataType is script, i.e. the server is expected to return valid JavaScript. Can be overridden by setting the data-type attribute.
data	 Form data is sent to the server by serializing the form via element.serializeArray();
Receiving the Ajax Response: UJS Custom Events
Note that the handleRemote() described above only takes care of initiating the Ajax request. You are still responsible for making sure that the server responds appropriately and for processing the data returned. In this context, you will sometimes need to make use of callback functions.

The $.ajax() method allows for user-defined callbacks to hook into the different stages of the Ajax request. As we have seen, the UJS adapter has wrapped the $.ajax() call, in which we would normally define the callbacks. However, it does provide alternate ways for us to declare callbacks as needed.

This is accomplished by firing custom events that tie into the regular jQuery callbacks in the lifecycle of the Ajax request. The names of those custom events mirror the ones they correspond to, but with an ajax: prefix, e.g. ajax:beforeSend.

You can view a full list of those events and when they are fired here.

To better understand that those custom events are basically a proxy for the actual $.ajax() callbacks, let's take a quick look at the part of the handleRemote() function that is responsible for setting them up.

// The options object will be eventually passed to the ajax() function
options = {
          // stopping the "ajax:beforeSend" event will cancel the ajax request
          beforeSend: function(xhr, settings) {
            if (settings.dataType === undefined) {
              xhr.setRequestHeader('accept', '*/*;q=0.5, ' + settings.accepts.script);
            }
            return rails.fire(element, 'ajax:beforeSend', [xhr, settings]);
          },
          success: function(data, status, xhr) {
            element.trigger('ajax:success', [data, status, xhr]);
          },
          complete: function(xhr, status) {
            element.trigger('ajax:complete', [xhr, status]);
          },
          error: function(xhr, status, error) {
            element.trigger('ajax:error', [xhr, status, error]);
          }
        };
For example, you can see that the ajax:success event gets triggered in the callback function for success. So by subscribing your DOM element to this event, you get the chance to define a callback function like so:

$(".delete_comment").live('ajax:success', function(evt, data, status, xhr){
  $(this).closest('div').fadeOut();
});
The Format of the Server Response
As we have seen, setting the dataType property tells the server what type of response data the client is requesting.

Deciding what this format should be is probably one of the most debated parts of Ajax in Rails and perhaps Ajax in general. In Rails you can choose convention over configuration and let the dataType default to script. That way you can handle everything to do with the response in a .js.erb or .js.coffee file and thereby avoid the need for callbacks, etc.

While I was researching this blog post, I cam across an article by Chad Fowler that grew out of a survey he had posted on Twitter: How Rails Developers do Ajax (with jQuery) in 2011.

From the survey results and the comments that followed, it would appear that there is no consensus amongst Rails developers as to whether the server should respond with JavaScript and/or HTML or whether it should be sending raw data in form of JSON and delegate the responsibility to the browser to deal with the data.

One can argue for both approaches. I agree with Chad when he says that while sending JSON might be better from a purist point of view (after all the server is not supposed to deal with the nitty gritty of DOM structure), sending JavaScript or HTML is often the more pragmatic approach.

And in fact, the UJS adapter in Rails sets the stage in a way that actually favors this latter approach and is the least hassle.

Philosophical bias aside, there probably will be occasions when you need the server return to something other than JavaScript. So it's good to know your options when it comes to the dataType property.

Setting the dataType property
The dataTypes that jQuery recognizes are these:

text: simple strings
html: blocks of html
script: a snippet of JavaScript, executed on the page
json: JSON-formatted data
jsonp: "padded" JSON for cross-domain requests
xml: XML-formatted data
As we will see a little later on, these names are short forms that jQuery understands and can translate into the correct HTTP Accept header values.

Looking at how the handleRemote() method tries to set the dataType property, we can see that we have three opportunities to customize the setting. Here is the code from the UJS adapter:

// Submits "remote" forms and links with ajax
handleRemote: function(element) {
  // ....
  dataType = element.data('type') || ($.ajaxSettings && $.ajaxSettings.dataType);


  options = {
    beforeSend: function(xhr, settings) {
      if (settings.dataType === undefined) {
        xhr.setRequestHeader('accept', '*/*;q=0.5, ' + settings.accepts.script);
      }
      return rails.fire(element, 'ajax:beforeSend', [xhr, settings]);
    }
  };

  rails.ajax(options);
}
The first way is by adding a data-type attribute to the DOM element in question. Doing this will take precedence over everything else. For example, here is how you'd set the dataType to accept json:

<%= link_to "Add a new task", new_project_task_path(@project), "data-type" => "json", :id => "add_task_btn" %>
You can also define a default dataType via jQuery's global $.ajaxSetup() function. This will change the default dataType for all Ajax requests:

$.ajaxSetup({
  dataType: 'json'
});
Finally, in the beforeSend callback, you have one last chance to override the dataType property. Note that in this case you cannot use the short form, but have to use the correct string that will be sent as the HTTP Accept header. The ability to reset the dataType in this fashion comes in handy for example when for some reason you don't have direct access to the DOM element itself.

  $("#add_task_button").live("ajax:beforeSend", function(e, xhr, settings){
    new_data_type = "application/json, text/javascript, */*; q=0.01";
    xhr.setRequestHeader('accept', new_data_type);
  })
The dataType property and HTTP Headers
The dataType setting ends up as the "Accept" Header, or more precisely, the value of the Accept key in the Request Header. The value is a comma-separated string of formats that will be accepted by the client. For instance:

*/*;q=0.5, text/javascript
The individual values represent acceptable MIME types and are sometimes accompanied by a value for the relative degree of preference q. The q is a number between 0 and 1 and, unless specified, is implicitly 1.

*/* represents a generic request that tells the server to return whatever it has. In practice, Rails will return the first format defined in the controller action.

So this setting - */*;q=0.5, text/javascript -, which happens to be the default in the UJS adapter, tells the server that javascript is preferred (implicit q=1), but failing that any other format will do, though relatively less preferred (q=0.5).

There are historic reasons for this default setting. The original default was simply text/javascript, but that meant that unless the javascript MIME type was handled by the controller, i.e. the js format was defined, Rails would throw a MissingTemplate error. By adding the generic request as the second preference, Rails will return any other defined response. Source

Sending the right data format back from the server
It is your task to ensure that the Controller returns the expected data type, or else something that is compatible.

In practice, by leaving the default dataType as script you can handle the Ajax request with a js.erb or a js.coffee file in which you can intermingle Ruby and JavaScript to determine the response. The server will send this back as pure JavaScript, which will be automatically evaluated by the browser.

Generally speaking, several things have to play nicely together for there to be a smooth transaction between browser and server:

First, Ajax sends the request with the Accept header set to the desired MIME type.

Next, the Rails Controller checks the Accept header to determine what it should (ideally) return. To do that, it has to first translate the content of the Accept header into known MIME types.

Lastly, the Controller will determine whether the action in question handles the particular MIME type. Before Rails 3 this was typically done in a respond_to block in the Controller action. With Rails 3 you can take advantage of the respond_with method to save you some typing.

For the rest of the article, we'll look at a variety of ways in which Ajax can be implemented in Rails 3.1 apps.

Example 1: Click Event: Inserting DOM Elements
Let's say we have a link that prompts users to leave a comment. When it is clicked, we want to insert a comment form via Ajax.

We can take advantage of the convenience provided by the UJS adapter to easily get the job done. Let's first look at the actual link that triggers the Ajax request when clicked:

<%= link_to "Add a Comment", new_comment_path, :remote => true %>
Recall that by adding the :remote => true attribute the UJS adapter will attach an event listener for the click event which when fired will initiate an Ajax request with the following properties:

url: '/comments/new' (read from the href attribute)
method: 'GET' (this is the default for links)
dataType: 'script' (also the default)
Very little code is needed in the Controller:

class CommentsController < ApplicationController
  respond_to :html, :js

  def new
    @comment = Comment.new
    respond_with(@comment)
  end
end
Finally, the app/views/comments/new.js.erb template:

var comment_form = $('<%= j(render(:partial => "form"))%>');

$('#new_comment').html(comment_form);
Note: j() is an alias for escape_javascript()
And that's it!

Example 2: Submitting a Form via Ajax
Submitting a form via Ajax is not much more involved. For this example we'll submit a comment form.

Again, we just need to add the :remote => true attribute to the form:

<div id="new_comment">
  <%= form_for @comment, :remote => true do |f| %>
  <div class="field">
    <%= f.label :name %><br />
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :body, "Comment" %><br />
    <%= f.text_area :body %>
  </div>
  <div class="actions">
    <%= submit_tag "Submit" %>
  </div>
 <% end %>
</div>
<div id="comments-container">
  <%= render :partial => @comments %>
</div>
The Controller side of things is fairly routine. Note that we are using the :location option of the respond_with method. While this does not affect the Ajax request, for an HTML request it would tell Rails to redirect the user to the comments/index page (instead of the default comments/show/:id) after saving the comment successfully.

class CommentsController < ApplicationController
  respond_to :html, :js

  def create
    @comment = Comment.new(params[:comment])
    flash[:notice] = 'Comment was successfully created.' if @comment.save
    respond_with(@comment, :location => comments_path)
  end
end
Let's assume that we'd like to avoid blank comment submissions and that the model has some validations in place to ensure that. How would we handle the case of a blank form submission? It turns out that error handling in .js.erb templates is a cinch:

var form = $('#new_comment');

<% if @comment.errors.any? %>

  // Create a list of errors
  var errors = $('<ul />');

  <% @comment.errors.full_messages.each do |error| %>
    errors.append('<li><%= escape_javascript(error) %></li>');
  <% end %>

  // Display errors before the form
  $('<div />').addClass('.errors').html(errors).prependTo("#new_comment");

<% else %>

  // Add the new comment to the beginning of the #comment-container division
  $("#comments-container").prepend('<%= j(render(:partial => "comment", :object => @comment))%>');

  // empty the form for new submission
  form.find('input:text,textarea').val('');

<% end %>
Example 3: Deleting via Ajax
So far we've been using the default Ajax setup taking advantage of the UJS adapter and the respond_with feature in Rails. Now we're going to be looking at a scenario where you might want to diverge from the default, even though you don't strictly need to.

We want to allow for a comment to be deleted a without triggering a full page refresh. The comment should simply disappear when we click the corresponding "Delete" link. Here is what the view code looks like:

<div id="comment-<%= comment.id %>">
  <p><%= comment.name %></p>
  <div><%= comment.body %></div>
  <%= link_to "Delete", comment_path(comment), :remote => true, :method => :delete, :confirm => 'Are you sure?', :class => "delete_comment" %>
  <hr />
</div>
We could again just simply handle the server response with a js.erb template. However, in this case, generating a new template file seems like overkill.

If you think about it, we don't need the server to return anything. The resource, in a REST-ful sense, has been deleted. It is unlikely that the deletion process will be unsuccessful, since the delete links all have the correct url with the right comment id. So unless the user tampers with the url everything should go as planned. Ideally, we just need the server to let us know that it has finished its business. We'll do that by overriding the default template rendering behavior of the controller by telling it to render "nothing":

class CommentsController < ApplicationController
  respond_to :html, :js

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_with(@comment) do |format|
      format.js { render :nothing => true }
    end
  end
end
Once we get the green light from the server, we'll remove every trace of that comment from the page. As we are not rendering a template, we need to handle a successful response in a callback function. As discussed, with the UJS adapter this means subscribing to custom events:

$(document).ready(function() {
  $(".delete_comment").live('ajax:success', function(evt, data, status, xhr){
    $(this).closest('div').fadeOut();
  });
});
In the code above, we simply fade out the division directly surrounding the comment that has just been deleted.

Example 4: Client-side Validation with Ajax (Using data-remote on an input field)
Links and forms are not the only elements that when given a data-remote attribute will trigger an Ajax call. As we have seen in the UJS adapter file, certain form elements such as inputs, selects and text areas can just as easily be "ajaxified". The event that is attached to them is change, which means that the Ajax call gets triggered when the user changes the value of the input field and leaves it.

As an example use case of this feature, let's check whether a username has already been taken before a sign up form is submitted. To accomplish this client-side validation task, we need to perform an asynchronous server roundtrip via Ajax.

To provide feedback to the user, we'll display a message next to the input field indicating whether the username is taken or not.

Again, the question arises as to what type of data the server should return. We could theoretically leave it to the server to display the right message in the DOM by reverting to the use of js.erb templates. Again however, this seems like overkill. One alternative would be to let the server search for a user by the username and return its search results as a JSON object.

But first things first. Here is a user signup form with an input field wired up to respond to the change event:

<%= form_for @user do |f| %>
  <div class="field">
    <%= f.label :username %><br />
    <%= f.text_field :username, :remote => true, "data-url" => "/users/check_username", "data-type" => :json %>
    <span id="username_check">&nbsp;</span>
  </div>
  <div class="field">
    <%= f.label :password %><br />
    <%= f.password_field :password %>
  </div>
  <div class="field">
    <%= f.label :password_confirmation %><br />
    <%= f.password_field :password_confirmation %>
  </div>
  <div class="actions">
    <%= f.submit "Sign Up" %>
  </div>
<% end %>
Notice that in addition to the data-remote attribute, the input field also sports two more custom data- attributes, namely data-type and data-url.

The data-url attribute will override the UJS default setting of sending the request to the current page. In addition, we also need to create a separate route to handle the username check with a url of /users/check_username:

// config/routes.rb

resources :users do
  collection do
    get 'check_username'
  end
end
Using the convenience of respond_with, this is all we need to do in the Controller to ensure that the @user resource is returned as a JSON object:

class UsersController < ApplicationController
  respond_to :html, :json

  def check_username
    @user = User.find_by_username(params[:user][:username])
    respond_with(@user)
  end

end
We can handle the response from the server in a success callback. The data returned from the server will be the @user object in JSON format. If the username is still available, @user will be nil. nil.to_json returns null. We therefore check for null in our success callback.

On the other hand, if the @user does exist, we can parse the JSON response and extract the username:

$(document).ready(function() {

  $("#user_username").bind('ajax:success', function(evt, data, status, xhr){
    if (data !== null) {
      $('#username_check').html(data.username + ' is already taken');
    } else {
      $('#username_check').html('Username is available!');
    }
  });

  // cancel Ajax call if input field empty
  $("#user_username").live('ajax:before', function(){
    if ($(this).val() == '') {
      return false;
    }
  });

  $("#user_username").focus(function(){
    $('#username_check').empty();
  });

});
The rest of the code handles the case when the change event is triggered by a blank input field. To deal with this scenario, we bind the ajax:before event and return false, which serves to cancel the Ajax call. Finally, we also need to make sure that the message about username availability disappears should the user click in the input field afresh.

Example 5: Adding Dynamic Selects (Using data-remote on a select field)
Like the input field from Example 4, select fields with a data-remote attribute also trigger Ajax calls on change.

To demonstrate how to make use of this setup, we will create a dynamic, dependent select in a user signup form. When a user selects her country, a second select will become active making the states in that country selectable. Since in many countries the state is not a required part of the address, the state select will remain deactivated when one of those countries is chosen.

For the actual geographical data needed to populate the various dropdowns, we'll make use of a gem named carmen. It touts itself as a "simple collection of geographic names and abbreviations for Ruby". Among other things, carmen replaces the official Rails country_select view helper and supports states for a number of countries like Australia, Brazil, Canada, China, Cuba, Denmark, Germany, India, Italy, Mexico, the Netherlands, New Zealand, Norway, Spain, Ukraine, and United States.

To set this up, you simply need to add gem "carmen" to your Gemfile. You can then use the following code to the user signup form:

<%= form_for @user do |f| %>
  <!-- other form fields here -->
  <div class="field">
    <%= f.label :country %><br />
    <%= f.country_select :country, nil, {:include_blank => true}, "data-remote" => true, "data-url" => "/users/get_states", "data-type" => :json %>
  </div>
  <div class="field">
    <%= f.label :state %><br />
    <%= f.select :state, [], { :include_blank => true }, :disabled => true %>
  </div>
  <!-- other form fields here -->
  <div class="actions">
    <%= f.submit "Sign Up" %>
  </div>
<% end %>
Notice that the state select is disabled by default and contains no options. The country_select has three data-* attributes defined: data-url to tell UJS where to send the request, data-type => :json to override the default script data format and as always data-remote to trigger the Ajax call when a country is selected.

Here we elect once again to return the states as JSON and, in a success callback, add them as options to the state select. Since this is a bit of an oddball request, we'll add a new, non-RESTful route called get_states to the User resource. The Controller code:

class UsersController < ApplicationController
  respond_to :html, :json

  rescue_from Carmen::StatesNotSupported, Carmen::NonexistentCountry, :with => :state_not_supported

  def get_states
    @states = Carmen.states(params[:user][:country])
    respond_with(@states)
  end

  protected

  def state_not_supported
    @states = nil
    respond_with(@states)
  end

end
One side effect of using the Carmen gem was that I had to rescue a special type of error raised if states are requested for a country that doesn't have any. (I guess the gem was not designed for dependent selects.) Also, I had to handle the case where the country code was a blank string; this triggers a Carmen::NonexistentCountry error. This can happen for example when the user selects a country and afterwards resets the select to the blank option.

To get the states for a particular country, we use the class method Carmen.states which takes a country code and returns an array structure:

Carmen.states('US') => [['Alabama', 'AL'], ['Arkansas', 'AR'], ... ]
The JSON representation of this array looks like this:

{0: ["Alabama","AL"], 1: ["Alaska","AK"], 2: ["Arizona","AZ"], ...}
In the success callback we parse the JSON structure and construct select options for inserting into the state select, which then gets re-enabled:

$(document).ready(function() {

    $("#user_country").bind('ajax:success', function(evt, data, status, xhr){
      var select = $('#user_state');

      if (data !== null) {
        select.removeAttr('disabled');
        $.each(data, function(key, value) {
          $("<option/>").val(value[1]).text(value[0]).appendTo(select);
        });
      } else {
        select.empty();
        select.attr('disabled', 'disabled');
      }
    });
});
Voilå, a functioning dynamic country and state drop down pair with very little headache!

Example 6: Ajax Pagination - Returning HTML directly
There are many ways to do pagination via Ajax. For demo purposes, though, I'll use it as an example of where we could return an HTML partial rather than JavaScript or JSON.

Pagination in Rails is usually done with the help of a gem. I considered using the will_paginate gem for this demo, but unfortunately adding extra attributes, such as data-remote, to the underlying links generated by the will_paginate view helper method turned out to be harder than expected. If you're curious, it involves creating a custom link renderer that inherits from WillPaginate::LinkRenderer.

The alternative pagination gem that has gained some traction lately is Kaminari, which from a setup and interaction perspective is much like will_paginate and happens to support Ajax links for its paginate helper method.

In this example, we'll paginate a list of users, each displayed with their name, avatar and location info. When we click on a pagination link, we'd like to render an HTML partial containing the next page of users along with the updated pagination links.

To begin with, you need to add gem "kaminari" to your Gemfile. Next, set up the view page in such a way that the varying content is contained in a partial that is surrounded by an identifiable division. Something like this would work:

<div id="container">
 <%= render :partial => "users" %>
</div>
And this is the content of the _users.html.erb partial including the kaminari paginate helper:

<%= paginate @users, :remote => true %>

<%= @users.each do |user| %>
<dl>
  <dd class='img'>
   <%= gravatar_image_tag(user.email) %>
  </dd>
  <dt>
    <%= link_to user.username, user_path(user) %>
  </dt>
  <dd>
    <%= [user.country, user.state].compact.join(", ") %>
  </dd>
</dl>
<% end %>
It was at this point that I realized that while the Kaminari pagination helper supports the data-remote attribute, it doesn't recognize other custom data-* attributes. For this to work as an HTML data type example, we would need to set the data-type attribute. I got around this limitation by setting that attribute in a ajax:beforeSend callback:

$(document).ready(function() {
  $(".pagination span a").live('ajax:beforeSend', function(event, xhr, settings){
    xhr.setRequestHeader('accept', 'text/html');
  });
});
In the Controller we have a new sort of situation: Ajax has requested HTML as the response MIME type. However, we only want to render the partial if the request came via Ajax. Otherwise, that is in the case of a non-Ajax request we want to render the regular HTML template. Luckily, there is a simple way to distinguish between the two types of requests:

class UsersController < ApplicationController
  respond_to :html

  def index
    @users = @users = User.order(:username).page(params[:page]).per(10)
    respond_with(@users) do |format|
      format.html {
        if request.xhr?
          render :partial => "users"
        end
      }
    end
  end
The last piece of the puzzle is to actually insert the contents of the partial in the right place. Here is the code for the success callback that accomplishes this:

$(document).ready(function() {
    $(".pagination span a").live('ajax:success', function(evt, data, status, xhr){
      $("#container").html(data);
    });
});
And with that we've come to the end of this longer-than-intended post on Ajax and Rails 3.1. Hope you found it useful!

Feedback, comments, suggestions? Please leave them below.

Disqus
Like
Dislike
and 8 others liked this.
Login
Add New Comment



Post as …
Image

Showing 16 comments

 
Philipp Frank
Thanks, this helped a lot!

Like Reply
1 week ago 1 Like
 
Le Wang
I'm not one to frequently comment on blogs, but you have done really REALLY good work here.  I was frustrated with the loads of blogs/tuts out there with bits and pieces of the Rails-Ajax elephant.  Your blog truly makes me feel like I've seen the whole animal.

Thank you sincerely.

Like Reply
2 months ago 1 Like
 
cncardoso
The best guide about modern Rails ajax!
It is very helpful.

Thanks!

Like Reply
3 weeks ago
 
Jesse House
Great article! 
Very thorough and had just the bit I was looking for - hooking into the ajax:success call back when deleting a model

Thanks!

Like Reply
3 weeks ago
 
philmill
Thanks for another great article. I really appreciate how you always go beyond the covered topic and actually take the time to style your findings in clear, organized and ascetically pleasing fashion. 

Like Reply
4 weeks ago
 
RyanonRails
Great article!

I had issues on "Example 4: Client-side Validation with Ajax (Using data-remote on an input field)" though:I had to change f.text_field :username, :remote => true, to:f.text_field :username, "data-remote" => true, or f.text_field :username, :data => {:remote => true}Otherwise my AJAX calls wouldn't fire in Rails 3.1.Thanks, Ry

Like Reply
1 month ago
 
Anish Muppalaneni
Sincerely Thank you for such a wonderful post covering in and outs of rails+ajax. This is really helpful to me. Tonnesofthanks

Like Reply
1 month ago
 
Karan P
this was a very helpful walkthrough :) ...thanks

Like Reply
1 month ago
 
Justin Gordon
Super article. One thing you did not mention were rjs templates which will generate the javascript response on the server side without actually knowing javascript. What are your thoughts on creating the responses in rjs?

UPDATE: I researched this a bit more, and it seems that .rjs files are no longer in fashion, as the preferred way is via js.erb or a js.coffee.erb (any reason you didn't mention js.coffee.erb?).

Like Reply
2 months ago
 
Val Kotlarov Hoffman
A very long, and very deep explanation. I'm returning to this page for the third time, and really enjoy it. It's written very well and very informative. I upgraded my rails app from v2.3.2 to v3.1 and stumbled upon this article and thankful to you for that.
Apparently I'm a slow thinker that's why only now subscribed to RSS! :)

Like Reply
2 months ago
 
Sickboy
Big thanks, very helpful

Like Reply
3 months ago
 
Casper Klenz-Kitenge
You're an excellent tech writer - very easy to follow along in the examples, with beautiful code to boot. I even picked up a couple of tricks I hadn't seen before, such as :remote => true on selects, inputs etc.

Minor input: the various HTML helpers in Rails 3.1 all accept a single Hash for data-* attributes - possibly helpful for something like:

<%= f.text_field :username, :data => {:remote => true, :url => "/users/check_username", :type => :json} %>

- for even more concise code?

Thanks!

Like Reply
3 months ago
 
Andrea Singh
Thanks for the tip! Then the data-* attributes, all having a "-" in their name, don't need to be written as strings instead of symbols.

Like Reply
3 months ago in reply to Casper Klenz-Kitenge
 
Robson de Almeida
Better post about Ajax and Rails I ever read. Congrats!

Like Reply
3 months ago
 
Daniel Pariente
The most complete and well structured guide to "ajaxify" rails, thank you very much this was very useful for my current project I really appreciate your effort, keep going... 

Like Reply
3 months ago
 
Andrea Singh
Collapse
Thanks for the kind words, Daniel :)