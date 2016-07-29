New votes today

<% @movies.each do |movie| %>
  <%= movie.title %>

  Likes: <%= movie.likes %>

  Hates: <%= movie.hates %>
<% end %>
