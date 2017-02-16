
<% @posts.each do |post| %>
  <%   puts "** post: #{post}" %>
  <tr><td colspan="3"><%= link_to post.title, user_post_path(user_id: session[:user_id], id: post[:id]) %></td></tr>
  <tr><td colspan="3"><%= post.content %></td></tr>

<% end %>





<tr><td colspan="3"><%=# link_to post.content, user_post %></td></tr>
<tr>
  <td> </td>
  <td><%=# link_to 'Edit', edit_post_path(post) %></td>
  <td><%=# link_to 'Delete', post, method: :delete, data: { confirm: 'Are you sure?' } %></td>
</tr>
@posts = Post.where(user_id: session[:user_id])


<% menu_items = ["home", "users",] %>
<% puts menu_items %>

<% menu_items.each do |name|%>
  <div class="menu-item"> <a href="<%= name %>"><%= name %></a> </div>
<% end %>



<p><%= f.text_field :fname, value:"Tom" %><%= f.label "firstname" %></p>
<p><%= f.text_field :lname, value:"Beach" %><%= f.label "lastname" %></p>
<p><%= f.text_field :email, value:"teb@gmail.com" %><%= f.label "email" %></p>
