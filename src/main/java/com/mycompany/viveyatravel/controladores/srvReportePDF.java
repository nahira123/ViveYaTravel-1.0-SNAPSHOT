package com.mycompany.viveyatravel.controladores;

import com.mycompany.viveyatravel.modelo.dao.usuarioDAO;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;

public class srvReportePDF extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        if ("pdf".equals(accion)) {
            try {
                //Llenar el reporte con datos
                JasperPrint jasperPrint = new usuarioDAO().exportarPDF(getServletContext());

                // Configurar el encabezado para descarga del archivo
                response.setHeader("Content-Disposition", "attachment; filename=reporte.pdf");

                // Exportar el reporte a la salida del servlet
                JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());

            } catch (JRException e) {
                throw new ServletException("Error en la generación del reporte", e);
            }
        } else {
            throw new ServletException("Acción no válida para generación de PDF");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportFormat = request.getParameter("format");

        if ("pdf".equalsIgnoreCase(reportFormat)) {
            InputStream jasperStream = null;
            ServletOutputStream servletOutputStream = null;

            try {
                // Cargar el archivo JasperReport (.jasper)
                String jasperFilePath = "/reporteJasper/ReporteUsuarios.jasper";  // Ruta al archivo .jasper
                jasperStream = getServletContext().getResourceAsStream(jasperFilePath);

                if (jasperStream == null) {
                    throw new ServletException("Archivo Jasper no encontrado en la ruta especificada: " + jasperFilePath);
                }

                // Configurar la respuesta HTTP
                response.setContentType("application/pdf");
                response.setCharacterEncoding("UTF-8");
                response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");

                servletOutputStream = response.getOutputStream();

                // Generar el reporte PDF
                JasperPrint jasperPrint = JasperFillManager.fillReport(jasperStream, new HashMap<>(), new JREmptyDataSource());
                JasperExportManager.exportReportToPdfStream(jasperPrint, servletOutputStream);

            } catch (JRException e) {
                throw new ServletException("Error al generar el reporte PDF", e);
            } finally {
                if (jasperStream != null) {
                    try {
                        jasperStream.close();
                    } catch (IOException e) {
                        // Manejo de errores al cerrar el flujo de entrada
                        e.printStackTrace();
                    }
                }
                if (servletOutputStream != null) {
                    try {
                        servletOutputStream.flush();
                        servletOutputStream.close();
                    } catch (IOException e) {
                        // Manejo de errores al cerrar el flujo de salida del servlet
                        e.printStackTrace();
                    }
                }
            }
        }
    }

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
