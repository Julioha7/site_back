
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de fato dos produtos</title>
    </head>
    <body>
        <%
            //recebe os dados digitados no formulario carregaprod.jsp
            int c;
            String n, m;
            double p;
            c = Integer.parseInt(request.getParameter("codigo"));
            n = request.getParameter("nome");
            m = request.getParameter("marca");
            p = Double.parseDouble(request.getParameter("preco"));
            try {
                //conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja", "root", "Pirikito");
                //Alterar dos dados na tabela
                st = conecta.prepareStatement("UPDATE produto SET nome = ?, marca = ?, preco = ? WHERE codigo =?");
                st.setString(1, n);
                st.setString(2, m);
                st.setDouble(3, p);
                st.setInt(4, c);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("<p style='color:blue;font-size:15px'>Produto " + c + " foi alterado com sucesso! 👍</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                out.print("<p style='color:red;font-size:15px'>Erro: " + erro + "</p>");
            }
        %>
    </body>
</html>
