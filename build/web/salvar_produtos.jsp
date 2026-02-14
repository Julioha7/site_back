
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadstro produtos</title>
    </head>
    <body>
        <%
            //recebe os dados digitados no formulario cadpro.html
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
                //inserção dos dados na tabela
                st = conecta.prepareStatement("INSERT INTO produto VALUES(?,?,?,?)");
                st.setInt(1, c);
                st.setString(2, n);
                st.setString(3, m);
                st.setDouble(4, p);
                st.executeUpdate(); //Executa o comando INSERT
                out.print("<p style='color:blue;font-size:15px'>Produto cadastrado com sucesso! 👍</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if(erro.contains("Duplicate entry")){
                    out.print("<p style='color:red;font-size:15px'>Esse código de produto já está cadastrado ❌</p>");
                }else{
                out.print("<p style='color:red;font-size:15px'>Erro: " + erro + "</p>");
                }
            }
        %>
    </body>
</html>
