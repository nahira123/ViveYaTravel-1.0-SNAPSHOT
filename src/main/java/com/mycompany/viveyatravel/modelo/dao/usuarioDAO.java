package com.mycompany.viveyatravel.modelo.dao;

import com.mycompany.viveyatravel.modelo.dto.cargo;
import com.mycompany.viveyatravel.modelo.dto.usuario;
import com.mycompany.viveyatravel.servicios.ConectarBD;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class usuarioDAO {

    private Connection cn;

    public usuarioDAO() {
        cn = new ConectarBD().getConexion();   //Inicia la conexion a la BD
    }

    public usuario identificar(usuario user) throws SQLException {
        usuario usu = null;     //Va a recibir el objeto usuario
        PreparedStatement ps = null;   //Para preparar la consulta
        ResultSet rs = null;  
        //La consulta desde la base de datos
        String cadSQL = "SELECT u.idUsuario, u.nombre, c.nombreCargo FROM usuario u\n"
                + "inner join cargo c on u.idCargo = c.idCargo\n"
                + "where u.correoElectronico = '" + user.getCorreoElectronico() + "' " 
                + "AND u.clave = '" + user.getClave() + "'";     
        try {
            ps = cn.prepareStatement(cadSQL);
            rs = ps.executeQuery();  
            if (rs.next() == true) {  //Si encuentra una consulta, realiza el bloque de codigo
                usu = new usuario();
                usu.setIdUsuario(rs.getInt("idUsuario"));
                usu.setNombre(rs.getString("nombre"));
                usu.setCorreoElectronico(user.getCorreoElectronico());
                usu.setCargo(new cargo());
                usu.getCargo().setNombreCargo(rs.getString("nombreCargo"));

            }
        } catch (Exception e) {  //Manejo de execpciones
            System.out.println("Error " + e.getMessage());
        } finally { //Cierre del Resulset y preparedStatement
            if (rs != null && rs.isClosed() == false) {  
                rs.close();
            }
            rs = null;
            if (ps != null && ps.isClosed() == false) {
                ps.close();
            }
            ps = null;

        }
        return usu;  
    }

    public usuario registrar(usuario user) throws SQLException {
        usuario usu = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String cadSQL = "INSERT INTO usuario (nombre, apellido, nroCelular, nroDni, correoElectronico, clave, idCargo) VALUES (?, ?, ?, ?, ?, ?, 1)";
        try {
            ps = cn.prepareStatement(cadSQL);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getApellido());
            ps.setInt(3, user.getNroCelular());
            ps.setInt(4, user.getNroDni());
            ps.setString(5, user.getCorreoElectronico());
            ps.setString(6, user.getClave());

            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al registrar el usuario: " + e.getMessage());
        } 
        
        return usu;
    }
    
    //----------------------
    public List<usuario> repUsuario() {
        List<usuario> repUsuario = new ArrayList<>();
        String reporte = "SELECT idUsuario, nombre, apellido, nroCelular, nroDni, correoElectronico, clave FROM usuario WHERE idCargo = 1";
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
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
