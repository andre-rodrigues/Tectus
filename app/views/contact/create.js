<% if @error_message %>
  alert('<%= @error_message %>');

<% else %>
  alert('Sua mensagem foi enviada com sucesso.');
  $('input[type=text]').attr('value', '');
  $('textarea').val('');
<% end %>

