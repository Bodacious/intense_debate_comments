# IntenseDebateComments


Add quick and easy comments to your app with IntenseDebate.

If you haven't already heard of/seen IntenseDebate check out the comments on any of the tips at [handy rails tips](http://handyrailstips.com)

Benefits of using IntenseDebate: 
* Saves loads of time as you don't have to write your own system for accommodating comments
* Users can respond to individual comments so it feels more like a thread-based forum than simply consecutive comments
* Commenters can be notified of any extra comments being posted - great for brining traffic back to your site
* Built-in spam filter
* You can easily moderate comments
* Gravatar, OpenID and FacebookConnect are supported
 * The form is fully customizable. Just upload your own custom stylesheet on the ID website

You can set up an account for your own site free at [intenseDebate.com](http://intensedebate.com/)

## Simple Example

Suppose you want to add comments to the bottom of each post of your blog

In *application_controller.rb* set the following:
  <code>ID_ACCT_NO = '... 32 digit code provided by IntenseDebate...'</code>

In your view, just add:
  <code><%= id_comments @post %></code>

If, on your home-page, you want to show a short preview of each post and a comments-count displaying the number of comments on each, you can add:
<code>
	<%- for post in @posts do -%>
		<%= id_comments_link post %>
	<%- end -%>
</code>	
## Extra Opts Example

Here are some extra options you can specify:
	<%= id_comments @post, :acct_no => '... enter no here...', :url => post_url(post, :page_no => 1), :title => "Title Of This Post" %>

and...
<code>
	<%- for post in @posts do -%>
		<%= id_comments_link post, :acct_no => '... enter no here...', :url => post_url(post, :page_no => 1) %>
	<%- end -%>
</code>
The *acct_no* option overrides the ID_ACCT_NO constant in application_controller.rb should you need to specify a different acct no.

The *url* option is the url of the post or page. This is url Intense Debate will link to in rss feeds and on IntenseDebate.com. The default is the current page's url.

The *title* option is the title of the post or page. This is the title that will be displayed in rss feeds and on IntenseDebate.com. The default value is the title of the current page.


Still trying working on improving this plugin with the guys from IntenseDebate.

Any feedback welcome: dr_gavin@hotmail.com

Copyright (c) 2009 Gavin Morrice, released under the MIT license
