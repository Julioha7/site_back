
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar produto</title>
    </head>
    <body>
        <%
            //Receber código
            int c;
            c = Integer.parseInt(request.getParameter("codigo"));
            try {
                //conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja", "root", "Pirikito");
                //Busca do produto pelo código
                st = conecta.prepareStatement("SELECT * FROM produto WHERE codigo = ?");
                st.setInt(1, c);
                ResultSet rs = st.executeQuery();
                //Garante que código informado foi encontrado
                if(!rs.next()){
                    out.print("Produto não encontrado");
                }else{ //Se encontrou...
        %>            
        <form method="post" action="alterar_produtos.jsp">
            <p>
                <label for="codigo">Código:</label>
                <input type="number" name="codigo" id="codigo" value="<%= rs.getString("codigo") %>">
            </p>
            <p>
                <label for="nome">Nome do Produto:</label>
                <input type="text" name="nome" id="nome" size="50" value="<%= rs.getString("nome") %>">
            </p>
            <p>
                <label for="marca">Marca do Produto:</label>
                <input type="text" name="marca" id="marca" value="<%= rs.getString("marca") %>">
            </p>
            <p>
                <label for="preco">Preço:</label>
                <input type="number" step="0.5" name="preco" id="preco" value="<%= rs.getString("preco") %>">
            </p>
            <p>
                <input type="submit" value="Salvar Alterações">
            </p>
        </form>        
        <%            
                }
            }catch (Exception x) {
                    out.print("Erro: " + x.getMessage());
            }
        %>        
    </body>
</html>
