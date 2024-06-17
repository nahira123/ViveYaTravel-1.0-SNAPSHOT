package com.mycompany.viveyatravel.modelo.dao;

import com.mycompany.viveyatravel.modelo.dto.Paquete;
import com.mycompany.viveyatravel.servicios.ConectarBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PaqueteDAO {

    Connection cnx;
    ConectarBD cn = new ConectarBD();
    PreparedStatement ps;
    ResultSet rs;

    public PaqueteDAO() {
        cnx = new ConectarBD().getConexion();
    }

    //Para poner dentro de una lista los paquetes registrados
    public List listar() {
        List<Paquete> lista = new ArrayList<>();
        //Consulta SQL para mostrar
        String SQL = "SELECT idPaquete, nombrePaquete, descripcionPaquete, precioPaquete, imagen, categoria, detallePaquete FROM paquete WHERE categoria='T'";
        try {
            cnx = cn.getConexion();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paquete p = new Paquete();
                p.setIdPaquete(rs.getInt("idPaquete"));
                p.setNombrePaquete(rs.getString("nombrePaquete"));
                p.setDescripcionPaquete(rs.getString("descripcionPaquete"));
                p.setPrecioPaquete(rs.getDouble("precioPaquete"));
                p.setImagen(rs.getString("imagen"));
                p.setCategoria(rs.getString("categoria"));
                p.setDetallePaquete(rs.getString("detallePaquete"));
                lista.add(p);
            }
        } catch (SQLException e) {
        }
        return lista;
    }

    //Para poner dentro de una lista las promociones registrados
    public List list() {
        List<Paquete> promociones = new ArrayList<>();
        //Consulta SQL para mostrar
        String SQL = "SELECT idPaquete, nombrePaquete, descripcionPaquete, precioPaquete, imagen, categoria, detallePaquete FROM paquete WHERE categoria='P'";
        try {
            cnx = cn.getConexion();
            ps = cnx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while (rs.next()) {
                Paquete p = new Paquete();
                p.setIdPaquete(rs.getInt("idPaquete"));
                p.setNombrePaquete(rs.getString("nombrePaquete"));
                p.setDescripcionPaquete(rs.getString("descripcionPaquete"));
                p.setPrecioPaquete(rs.getDouble("precioPaquete"));
                p.setImagen(rs.getString("imagen"));
                p.setCategoria(rs.getString("categoria"));
                p.setDetallePaquete(rs.getString("detallePaquete"));
                promociones.add(p);
            }
        } catch (SQLException e) {
        }
        return promociones;
    }

    //Metodo para agregar nuevos tours
    public String insert(Paquete p) {
        String resp = "";
        //Consulta SQL para insertar dentro de la tabla paquete
        String insert_paquete = "INSERT INTO paquete (nombrePaquete, descripcionPaquete, precioPaquete, imagen, categoria, detallePaquete) VALUES(?,?,?,?,?,?)";
        try {
            ps = cnx.prepareStatement(insert_paquete);
            ps.setString(1, p.getNombrePaquete());
            ps.setString(2, p.getDescripcionPaquete());
            ps.setDouble(3, p.getPrecioPaquete());
            ps.setString(4, p.getImagen());
            ps.setString(5, p.getCategoria());
            ps.setString(6, p.getDetallePaquete());

            // Ejecutar la consulta preparada para insertar el paquete
            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                resp = "Paquete insertado correctamente";
            } else {
                resp = "Error al insertar el paquete";
            }
        } catch (SQLException ex) {
            resp = "Error en la inserción: " + ex.getMessage();
        } finally {
            try {
                // Cerrar recursos
                if (ps != null) {
                    ps.close();
                }
                if (cnx != null) {
                    cnx.close();
                }
            } catch (SQLException e) {
                resp = "Error al cerrar la conexión: " + e.getMessage();
            }
        }
        return resp;
    }
}
