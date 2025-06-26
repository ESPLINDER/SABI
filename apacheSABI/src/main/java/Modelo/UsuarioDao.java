package Modelo;
    
import Config.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UsuarioDao {

    Conexion cn = new Conexion();
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    int r; //Valor que se retorna al agregar un nuevo registro
    
    // Crear usuario
    public int crear(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuario (tipUsuario, emaUsuario, nacUsuario, edadUsuario, " +
                     "pasUsuario, genUsuario, tipDocumento, docUsuario, ciuUsuario, domicilio) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            ps.setString(1, usuario.getTipUsuario());
            ps.setString(2, usuario.getEmaUsuario());
            ps.setDate(3, Date.valueOf(usuario.getNacUsuario()));
            ps.setInt(4, usuario.getEdadUsuario());
            ps.setString(5, hashPassword(usuario.getPasUsuario()));
            ps.setString(6, usuario.getGenUsuario());
            ps.setString(7, usuario.getTipDocumento());
            ps.setInt(8, usuario.getDocUsuario());
            ps.setString(9, usuario.getCiuUsuario());
            ps.setString(10, usuario.getDomicilio());
            
            r = ps.executeUpdate();
        }catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error al agregar usuario: " + e.getMessage());
        }
        return r;
    }

    // Crear usuario y retornar ID generado
    public int crearYRetornarId(Usuario usuario) throws SQLException {
        String sql = "INSERT INTO usuario (tipUsuario, emaUsuario, nacUsuario, edadUsuario, " +
                     "pasUsuario, genUsuario, tipDocumento, docUsuario, ciuUsuario, domicilio) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, usuario.getTipUsuario());
            stmt.setString(2, usuario.getEmaUsuario());
            stmt.setDate(3, Date.valueOf(usuario.getNacUsuario()));
            stmt.setInt(4, usuario.getEdadUsuario());
            stmt.setString(5, hashPassword(usuario.getPasUsuario()));
            stmt.setString(6, usuario.getGenUsuario());
            stmt.setString(7, usuario.getTipDocumento());
            stmt.setInt(8, usuario.getDocUsuario());
            stmt.setString(9, usuario.getCiuUsuario());
            stmt.setString(10, usuario.getDomicilio());
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        }
        return -1;
    }

    // Obtener usuario por ID
    public Usuario obtenerPorId(int id) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE idUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUsuario(rs);
                }
            }
        }
        return null;
    }

    // Obtener usuario por email
    public Usuario obtenerPorEmail(String email) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE emaUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUsuario(rs);
                }
            }
        }
        return null;
    }

    // Obtener usuario por documento
    public Usuario obtenerPorDocumento(int documento) throws SQLException {
        String sql = "SELECT * FROM usuario WHERE docUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, documento);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUsuario(rs);
                }
            }
        }
        return null;
    }

    // Listar todos los usuarios
    public List<Usuario> listarTodos() throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario ORDER BY idUsuario";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                usuarios.add(mapResultSetToUsuario(rs));
            }
        }
        return usuarios;
    }

    // Listar usuarios por tipo
    public List<Usuario> listarPorTipo(String tipo) throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE tipUsuario = ? ORDER BY idUsuario";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, tipo);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    usuarios.add(mapResultSetToUsuario(rs));
                }
            }
        }
        return usuarios;
    }

    // Actualizar usuario
    public boolean actualizar(Usuario usuario) throws SQLException {
        String sql = "UPDATE usuario SET tipUsuario = ?, emaUsuario = ?, nacUsuario = ?, " +
                     "edadUsuario = ?, genUsuario = ?, tipDocumento = ?, docUsuario = ?, " +
                     "ciuUsuario = ?, domicilio = ? WHERE idUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, usuario.getTipUsuario());
            stmt.setString(2, usuario.getEmaUsuario());
            stmt.setDate(3, Date.valueOf(usuario.getNacUsuario()));
            stmt.setInt(4, usuario.getEdadUsuario());
            stmt.setString(5, usuario.getGenUsuario());
            stmt.setString(6, usuario.getTipDocumento());
            stmt.setInt(7, usuario.getDocUsuario());
            stmt.setString(8, usuario.getCiuUsuario());
            stmt.setString(9, usuario.getDomicilio());
            stmt.setInt(10, usuario.getIdUsuario());
            
            return stmt.executeUpdate() > 0;
        }
    }

    // Actualizar contraseña
    public boolean actualizarContrasena(int idUsuario, String nuevaContrasena) throws SQLException {
        String sql = "UPDATE usuario SET pasUsuario = ? WHERE idUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, hashPassword(nuevaContrasena));
            stmt.setInt(2, idUsuario);
            
            return stmt.executeUpdate() > 0;
        }
    }

    // Eliminar usuario
    public boolean eliminar(int id) throws SQLException {
        String sql = "DELETE FROM usuario WHERE idUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

    // Verificar si email existe
    public boolean emailExiste(String email) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE emaUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Verificar si email existe (excluyendo un ID específico)
    public boolean emailExiste(String email, int excludeId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE emaUsuario = ? AND idUsuario != ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setInt(2, excludeId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Verificar si documento existe
    public boolean documentoExiste(int documento) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE docUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, documento);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Verificar si documento existe (excluyendo un ID específico)
    public boolean documentoExiste(int documento, int excludeId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE docUsuario = ? AND idUsuario != ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, documento);
            stmt.setInt(2, excludeId);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        }
        return false;
    }

    // Validar credenciales para login
    public Usuario validarCredenciales(String email, String password) throws SQLException {
        String hashedPassword = hashPassword(password);
        String sql = "SELECT * FROM usuario WHERE emaUsuario = ? AND pasUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, hashedPassword);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return mapResultSetToUsuario(rs);
                }
            }
        }
        return null;
    }

    // Contar usuarios
    public int contarUsuarios() throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // Contar usuarios por tipo
    public int contarUsuariosPorTipo(String tipo) throws SQLException {
        String sql = "SELECT COUNT(*) FROM usuario WHERE tipUsuario = ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, tipo);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return 0;
    }

    // Buscar usuarios por nombre (busca en email o documento)
    public List<Usuario> buscar(String termino) throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario WHERE emaUsuario LIKE ? OR docUsuario LIKE ? ORDER BY idUsuario";
        
        String searchTerm = "%" + termino + "%";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, searchTerm);
            stmt.setString(2, searchTerm);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    usuarios.add(mapResultSetToUsuario(rs));
                }
            }
        }
        return usuarios;
    }

    // Paginación de usuarios
    public List<Usuario> listarConPaginacion(int offset, int limit) throws SQLException {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuario ORDER BY idUsuario LIMIT ? OFFSET ?";
        
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, limit);
            stmt.setInt(2, offset);
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    usuarios.add(mapResultSetToUsuario(rs));
                }
            }
        }
        return usuarios;
    }

    // Método auxiliar para mapear ResultSet a Usuario
    private Usuario mapResultSetToUsuario(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setIdUsuario(rs.getInt("idUsuario"));
        usuario.setTipUsuario(rs.getString("tipUsuario"));
        usuario.setEmaUsuario(rs.getString("emaUsuario"));
        usuario.setNacUsuario(rs.getDate("nacUsuario").toLocalDate());
        usuario.setEdadUsuario(rs.getInt("edadUsuario"));
        usuario.setPasUsuario(rs.getString("pasUsuario"));
        usuario.setGenUsuario(rs.getString("genUsuario"));
        usuario.setTipDocumento(rs.getString("tipDocumento"));
        usuario.setDocUsuario(rs.getInt("docUsuario"));
        usuario.setCiuUsuario(rs.getString("ciuUsuario"));
        usuario.setDomicilio(rs.getString("domicilio"));
        return usuario;
    }

    // Método auxiliar para hashear contraseñas
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder hexString = new StringBuilder();
            
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error al hashear la contraseña", e);
        }
    }
}