package com.mycompany.viveyatravel.controladores;

import com.mycompany.viveyatravel.modelo.dao.usuarioDAO;
import com.mycompany.viveyatravel.modelo.dto.usuario;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

public class srvReporteUsuarios extends HttpServlet {
    
    usuarioDAO usdao = new usuarioDAO();
    List<usuario> repUsuario = new ArrayList<>();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OutputStream out = response.getOutputStream();
        Connection conn = null;
        repUsuario = usdao.repUsuario();
        if (request.getParameter("accion") != null) {
            String accion = request.getParameter("accion");
            switch (accion) {
                case "excel":
                    ByteArrayInputStream flujo = new usuarioDAO().exportarExcel();
                    response.setContentType("application/vnd.ms-excel");
                    response.setHeader("Content-Disposition", "attachment; filename=data.xls");

                    //OutputStream out = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = flujo.read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                    out.flush();
                    out.close();
                    flujo.close();
                    break;

                case "pdf":
                        try {
                    //Llenar el reporte con datos
                    JasperPrint jasperPrint = new usuarioDAO().exportarPDF(getServletContext());

                    //Configurar la respuesta HTTP
                    response.setContentType("application/pdf");
                    response.setCharacterEncoding("UTF-8");
                    response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");

                    //Esportar el reporte a la salida del servlet
                    JasperExportManager.exportReportToPdfStream(jasperPrint,
                            response.getOutputStream());

                } catch (JRException e) {
                    throw new ServletException("Error en la generación del reporte", e);
                }

                break;
            }

        } else {
            request.setAttribute("repUsuario", repUsuario);
            request.getRequestDispatcher("./vista/reporteUsuarios.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
