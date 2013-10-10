This application is written in Ruby 2.0 using the Sinatra framework.
<h4>Objective</h4>
Bookmark Manager was built as an exercise set by Makers Academy to use the Sinatra framework, postgresql database and jquery behaviours.
<h4>Requirements</h4>

A bookmark manager is a website to maintain a collection of links, organised by tags. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

<p>The website will have the following options:</p>
<ul>
<li>Show a list of links from the database</li>
<li>Add new links</li>
<li>Add tags to the links</li>
<li>Filter links by a tag</li>
</ul>
<h4>Technical Configuration</h4>
<ul>
<li>Languages: Ruby, Haml, CSS, Javascript, AJAX</li>
<li>Database - PosgreSQL</li>
<li>Gems
  <ul>
  <li>Sinatra</li>
  <li>dm-postgres-adapter><li>
  <li>Rspec-rails</li>
  <li>Capybara</li>
  <li>Haml</li>
  <li>sinatra-partial<li>
  <li>rack-flash3<li>
  <li>database_cleaner<li>
</ul>
<h4>Contributors</h4>
<ul>
<li><a href="https://github.com//shadchnev">Evgeny Shadchnev</a>
</li>
</ul>
<h4>Next Steps</h4>
<ul>
  <li>Finish implementing the Jquery behaviours</li>
  <li>Display the link to the user's profile at the top of the page if the user is logged in</li>
<li>Implement forgotten password functionality</li>
<li>Redirect the user with a flash message if a logged in user tries to sign up or sign in</li>
<li>Send a welcome email when the user signs up</li>
<li>Create validations for all models:<ul>
<li>email must have the correct format (see an example in Datamapper Validations)</li>
<li>email and password must be present</li>
<li>link must have a title and a url</li>
<li>tag must have some text</li>
<li>Add a description property to the link.</li>
<li>Add a username to the User model, so that username instead of an email was shown next to the link.</li>
</ul>
</li>
</ul>
<h4>Updates</h4><ul><li> </li>
</ul>
