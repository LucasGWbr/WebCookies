/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import exception.senhaerradaException;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
import negocio.Pessoa;
import negocio.cripto;
import persistencia.DAOPessoa;
import persistencia.DataBaseException;

/**
 *
 * @author Nubia
 */
@WebServlet(urlPatterns = {"/controller", "/login"})
public class controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controller</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controller at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String action = request.getServletPath();
        RequestDispatcher dispatcher = null;
        
        if(action.equals("/login")){
            String user = request.getParameter("nome");
            String pass = null;
            try {
                pass = cripto.criptografar(request.getParameter("pass"));
            } catch (NoSuchAlgorithmException ex) {
                Logger.getLogger(controller.class.getName()).log(Level.SEVERE, null, ex);
            }
            DAOPessoa dao = new DAOPessoa();
            Pessoa p = new Pessoa(user,pass);
            try {
                if(dao.verifyUP(p)){
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    
                    dispatcher = request.getRequestDispatcher("menu.jsp");
                    request.setAttribute("pessoa", p);
                    //true
                }else{
                    dao.create(p);
                    
                    request.setAttribute("mensagem", "Usuario não encontrado, agora foi criado, pode logar!");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                    //false
                }
            } catch (senhaerradaException ex) {
                
                //mandar pra tela de cadastro
                dispatcher = request.getRequestDispatcher("login.jsp");
                request.setAttribute("mensagem", "Senha incorreta!");
            } catch(DataBaseException ex){
                dispatcher = request.getRequestDispatcher("login.jsp");
                request.setAttribute("mensagem", "Falha de conexão com o banco de dados!");
            }
            
        }
        dispatcher.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
