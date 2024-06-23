<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="entity.User"%>
<%@page import="entity.Category"%>
<%@page import="dao.CategoryDao"%>
<%@page import="helper.FactoryProvider"%>
<%
CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
List<Category> clist = cdao.getCategories();
%>

    <% for (Category c : clist) { %>
        <tr>
            <th scope="row"><%= c.getCategoryId() %></th>
            <td><%= c.getCategoryTitle() %></td>
            <td><%= c.getCategoryDescription() %></td>
            <td>
                <form action="ProductOperationServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="operation" value="deletecategory">
                    <input type="hidden" name="categoryId" value="<%= c.getCategoryId() %>">
                    <button type="submit" class="btn btn-danger btn-sm">Sil</button>
                </form>
            </td>
        </tr>
    <% } %>




