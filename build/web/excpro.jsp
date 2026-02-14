
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir produtos</title>
    </head>
    <body>
        <%
            //Receber código
            int cod;
            cod = Integer.parseInt(request.getParameter("codigo"));
            try{
            //conexão com o banco de dados
                Connection conecta;
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                conecta = DriverManager.getConnection("jdbc:mysql://localhost:3306/loja", "root", "Pirikito");
                //Excluem o produto de código informado
                st = conecta.prepareStatement("DELETE FROM produt WHERE codigo=?");
                st.setInt(1, cod);
                int resultado = st.executeUpdate(); //Executa o comando DELETE
                //Verifica se o produto foi excluido ou não
                if(resultado == 0){
                    out.print("<p style='color:red;font-size:15px'>Este profuto não está cadastrado ❌</p>");
                }else{
                    out.print("<p style='color:blue;font-size:15px'>O produto de código " + cod + " foi excluido em sucesso! 👍</p>");
                }
            }catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                out.print("Entre em contato com o suporte e informe o erro: <p style='color:red;font-size:15px'>"+ mensagemErro + "❌</p>");
            }
                
        %>        
    </body>
</html>
