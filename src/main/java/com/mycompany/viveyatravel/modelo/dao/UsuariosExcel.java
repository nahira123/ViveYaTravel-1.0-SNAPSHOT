package com.mycompany.viveyatravel.modelo.dao;

import com.mycompany.viveyatravel.modelo.dto.usuario;
import com.mycompany.viveyatravel.servicios.ConectarBD;
import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class UsuariosExcel {

    private Connection cn;

    public UsuariosExcel() {
        cn = new ConectarBD().getConexion();   //Inicia la conexion a la BD
    }

    public static void main(String[] args) {

        //Obtener lista de usuarios
        List<usuario> repUsuario = ListaUsuario();
        //Field[] campos = usuario.class.getDeclaredFields();

        //Crear el librp y hoja de excel
        XSSFWorkbook libro = new XSSFWorkbook();
        XSSFSheet hoja = libro.createSheet("Usuarios");

        // Crear la fila de cabecera y poner los titulos
        Row cabecera = hoja.createRow(0);
        String[] titulos = {"ID", "NOMBRE", "APELLIDO", "TELÉFONO", "DNI", "CORREO", "CONTRASEÑA"};

        // Crear estilo para la cabecera
        XSSFCellStyle estiloCabecera = libro.createCellStyle();
        estiloCabecera.setFillForegroundColor(IndexedColors.LIGHT_BLUE.getIndex());
        estiloCabecera.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        estiloCabecera.setBorderTop(BorderStyle.THIN);
        estiloCabecera.setBorderBottom(BorderStyle.THIN);
        estiloCabecera.setBorderLeft(BorderStyle.THIN);
        estiloCabecera.setBorderRight(BorderStyle.THIN);
        Font font = libro.createFont();
        font.setBold(true);
        estiloCabecera.setFont(font);

        // Llenar la cabecera con los títulos
        for (int i = 0; i < titulos.length; i++) {
            Cell cell = cabecera.createCell(i);
            cell.setCellValue(titulos[i]);
            //Aplicar el estilo
            cell.setCellStyle(estiloCabecera);
        }

        // Estilo para las celdas de datos
        XSSFCellStyle estiloCelda = libro.createCellStyle();
        estiloCelda.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
        estiloCelda.setFillPattern(FillPatternType.SOLID_FOREGROUND);
        estiloCelda.setBorderTop(BorderStyle.THIN);
        estiloCelda.setBorderBottom(BorderStyle.THIN);
        estiloCelda.setBorderLeft(BorderStyle.THIN);
        estiloCelda.setBorderRight(BorderStyle.THIN);

        // Llenar la hoja con los datos de los usuarios
        for (int i = 0; i < repUsuario.size(); i++) {
            usuario us = repUsuario.get(i);
            Row fd = hoja.createRow(i + 1); // Se empieza desde la segunda fila
            fd.createCell(0).setCellValue(us.getIdUsuario());
            fd.createCell(1).setCellValue(us.getNombre());
            fd.createCell(2).setCellValue(us.getApellido());
            fd.createCell(3).setCellValue(us.getNroCelular());
            fd.createCell(4).setCellValue(us.getNroDni());
            fd.createCell(5).setCellValue(us.getCorreoElectronico());
            fd.createCell(6).setCellValue(us.getClave());
            
            // Aplicar estilo a cada celda de la fila de datos
            for (int j = 0; j < titulos.length; j++) {
                fd.getCell(j).setCellStyle(estiloCelda);
            }
        }

        //Configuracion de hoja
        for (int i = 0; i < titulos.length; i++) {
            hoja.autoSizeColumn(i);
        }

        //Guardar el libro en un archivo
        try {
            File archivo = new File("ArchivoUsuariosExcel.xlsx");
            FileOutputStream out = new FileOutputStream(archivo);
            libro.write(out); // Escribir el contenido del libro en el archivo

            libro.close();
            out.close(); // Cerrar el flujo de salida
            System.out.println("Archivo Excel creado correctamente.");
        } catch (Exception e) {
            System.err.println("ERROR AL CREAR EL ARCHIVO!");
            e.printStackTrace();
        }
    }

    public static List<usuario> ListaUsuario() {

        List<usuario> repUsuario = new ArrayList<>();
        String reporte = "SELECT idUsuario, nombre, apellido, nroCelular, nroDni, correoElectronico, clave FROM usuario WHERE idCargo = 1";
        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // Obtener la conexión
            cn = new ConectarBD().getConexion();
            ps = cn.prepareStatement(reporte);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario u = new usuario();
                u.setIdUsuario(rs.getInt("idUsuario"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setNroCelular(rs.getInt("nroCelular"));
                u.setNroDni(rs.getInt("nroDni"));
                u.setCorreoElectronico(rs.getString("correoElectronico"));
                u.setClave(rs.getString("clave"));
                repUsuario.add(u);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener usuarios: " + e.getMessage());
        } finally {
            try {
                if (rs != null && !rs.isClosed()) {
                    rs.close();
                }
                if (ps != null && !ps.isClosed()) {
                    ps.close();
                }
            } catch (SQLException e) {
                System.out.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
        return repUsuario;
    }
}
