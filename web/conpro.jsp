
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar produtos</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            // Recebe o nome do produto digitado no formulario de consulta
            String n;
            n = request.getParameter("nome");
            try {
                //conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja", "root", "Pirikito");
                //inserção dos dados na tabela
                st = conecta.prepareStatement("SELECT * FROM produto WHERE nome LIKE ?");
                st.setString(1, "%" + n + "%");
                ResultSet rs = st.executeQuery();
        %>        
        <table>
            <tr>
                <th>Código</th><th>Nome</th><th>Marca</th><th>Preço</th><th>Exclusão</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("codigo")%></td>
                <td><%= rs.getString("nome")%></td>
                <td><%= rs.getString("marca")%></td>
                <td><%= rs.getString("preco")%></td>
                <td><a href="excpro.jsp?codigo=<%= rs.getString("codigo")%>">Excluir</a></td>
            </tr>
            <%
                }
            %>

            <%
                } catch (Exception x) {
                    out.print("Erro: " + x.getMessage());
                }
            %>
    </body>
</html>

