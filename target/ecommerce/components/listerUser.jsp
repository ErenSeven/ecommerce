<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.User"%>
<%@page import="dao.UserDao"%>
<%@page import="helper.FactoryProvider"%>
<%
UserDao udao = new UserDao(FactoryProvider.getFactory());
String search = request.getParameter("search");
List<User> ulist;

if (search != null && !search.trim().isEmpty()) {
    ulist = udao.searchUsersByName(search);
} else {
    ulist = udao.getAllUsers();
}
%>

<table class="table">
    <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Email</th>
            <th scope="col">Type</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
    <% for (User u : ulist) { %>
        <tr>
            <th scope="row"><%= u.getUserID() %></th>
            <td><%= u.getUserName() %></td>
            <td><%= u.getUserEmail() %></td>
            <td><%= u.getUserType() %></td>
            <td>
                <form action="UserOperationServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="operation" value="deleteuser">
                    <input type="hidden" name="userId" value="<%= u.getUserID() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Sil</button>
                </form>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>
