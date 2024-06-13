/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.viveyatravel.controladores;

import com.mycompany.viveyatravel.modelo.dao.PaqueteDAO;
import com.mycompany.viveyatravel.modelo.dto.Paquete;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class srvADMIPaquete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         //crear el objeto paqDAO dentro de PaqueteDAO
        PaqueteDAO paqdao = new PaqueteDAO();
        List<Paquete> lista = new ArrayList<>();

        String accion = request.getParameter("accion");
        lista = paqdao.listar();
        if (accion != null) {
            if (accion.equals("Registrar")) {
                //Recibir parámetros del formulario
                String nombrePaquete = request.getParameter("nombrePaquete");
                String descripcionPaquete = request.getParameter("descripcionPaquete");
                String precioPaquete = request.getParameter("precioPaquete");
                String imagen = request.getParameter("imagen");
                String categoria = request.getParameter("categoria");
                String detallePaquete = request.getParameter("detallePaquete");

                //request.setAttribute("lista", lista);
                //crear el objeto Paquete y establecer sus atributos
                Paquete p = new Paquete();
                p.setNombrePaquete(nombrePaquete);
                p.setDescripcionPaquete(descripcionPaquete);
                p.setPrecioPaquete(Integer.parseInt(precioPaquete));
                p.setImagen(imagen);
                p.setCategoria(categoria);
                p.setDetallePaquete(detallePaquete);

                //Insertar la sugerencia en la BD por el modelo DAO
                String resp = new PaqueteDAO().insert(p);
                
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("./vista/ADMITours.jsp").forward(request, response);
            }
 
        } else {
            //En caso no haya ninguna acción se ejecutan estos comandos
            request.setAttribute("lista", lista);
            request.getRequestDispatcher("./vista/ADMITours.jsp").forward(request, response);
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
        processRequest(request, response);
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
