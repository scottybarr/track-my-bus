define(
    ->
        displayAllBusesForStop: ->
            """
            <div class="span<%= span_width %>">
                <h2>Service <%= service_number %></h2>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Time</th>
                            <th>Destination</th>
                        </tr>
                    </thead>
                    <tbody><%= buses %></tbody>
                </table>
           </div>
            """

        individualBusTime: ->
            """
            <tr>
                <% if (mins > 30) { %>
                    <td><%= time %></td>
                <% } else { %>
                    <td><%= mins %></td>
                <% } %>
                <td><%= destination %></td>
            </tr>
            """

)