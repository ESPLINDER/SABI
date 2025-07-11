package Modelo;

import Config.Conexion; // Importa la clase de conexión
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class DiagnosticoDao {
    
    private Connection connection;
    
    public DiagnosticoDao() {
        try {
            // Inicializa la conexión a la base de datos
            this.connection = new Conexion().Conexion();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

// Crear diagnóstico y retornar ID insertado
public Integer crearDiagnosticoYRetornarId(Diagnostico diagnostico) {
    String sql = "INSERT INTO diagnostico (fkIdCliente, fkIdRutina, genero, edad, estatura, peso, " +
                 "imcCliente, fechaDiagnostico, frecuenciaDiagnostico, proxDiagnostico, objetivo, " +
                 "medidaBrazo, medidaCintura, medidaPierna, condicionMedica, medicamentos, " +
                 "frecCardiaca, nivelHidratacion, tipoHidratacion, nivelActividadFisica, suplementos) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    try (PreparedStatement pstmt = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
        pstmt.setInt(1, diagnostico.getFkIdCliente());
        if (diagnostico.getFkIdRutina() != null) {
            pstmt.setInt(2, diagnostico.getFkIdRutina());
        } else {
            pstmt.setNull(2, Types.INTEGER);
        }
        pstmt.setString(3, diagnostico.getGenero());
        pstmt.setInt(4, diagnostico.getEdad());
        pstmt.setFloat(5, diagnostico.getEstatura());
        pstmt.setFloat(6, diagnostico.getPeso());
        pstmt.setFloat(7, diagnostico.getImcCliente());
        pstmt.setDate(8, Date.valueOf(diagnostico.getFechaDiagnostico()));
        pstmt.setInt(9, diagnostico.getFrecuenciaDiagnostico());
        pstmt.setDate(10, Date.valueOf(diagnostico.getProxDiagnostico()));
        pstmt.setString(11, diagnostico.getObjetivo());
        pstmt.setFloat(12, diagnostico.getMedidaBrazo());
        pstmt.setFloat(13, diagnostico.getMedidaCintura());
        pstmt.setFloat(14, diagnostico.getMedidaPierna());
        pstmt.setString(15, diagnostico.getCondicionMedica());
        pstmt.setString(16, diagnostico.getMedicamentos());
        pstmt.setString(17, diagnostico.getFrecCardiaca());
        pstmt.setString(18, diagnostico.getNivelHidratacion());
        pstmt.setString(19, diagnostico.getTipoHidratacion());
        pstmt.setString(20, diagnostico.getNivelActividadFisica());
        pstmt.setString(21, diagnostico.getSuplementos());

        int rows = pstmt.executeUpdate();
        if (rows > 0) {
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1); // ID generado
            }
        }
    } catch (SQLException e) {
        System.err.println("Error al crear diagnóstico: " + e.getMessage());
    }
    return null;
}
    
    // Obtener diagnóstico por ID
    public Diagnostico obtenerDiagnosticoPorId(int idDiagnostico) {
        String sql = "SELECT * FROM diagnostico WHERE idDiagnostico = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idDiagnostico);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return mapearResultSetADiagnostico(rs);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener diagnóstico por ID: " + e.getMessage());
        }
        return null;
    }
    
    // Obtener todos los diagnósticos de un cliente
    public List<Diagnostico> obtenerDiagnosticosPorCliente(int idCliente) {
        String sql = "SELECT * FROM diagnostico WHERE fkIdCliente = ? ORDER BY fechaDiagnostico DESC";
        List<Diagnostico> diagnosticos = new ArrayList<>();
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCliente);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                diagnosticos.add(mapearResultSetADiagnostico(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener diagnósticos por cliente: " + e.getMessage());
        }
        return diagnosticos;
    }
    
    
    // Obtener el último diagnóstico de un cliente
    public Diagnostico obtenerUltimoDiagnosticoCliente(int idCliente) {
        String sql = "SELECT * FROM diagnostico WHERE fkIdCliente = ? ORDER BY fechaDiagnostico DESC LIMIT 1";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCliente);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return mapearResultSetADiagnostico(rs);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener último diagnóstico: " + e.getMessage());
        }
        return null;
    }
    
    // Obtener diagnósticos por rutina
    public List<Diagnostico> obtenerDiagnosticosPorRutina(int idRutina) {
        String sql = "SELECT * FROM diagnostico WHERE fkIdRutina = ?";
        List<Diagnostico> diagnosticos = new ArrayList<>();
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idRutina);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                diagnosticos.add(mapearResultSetADiagnostico(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener diagnósticos por rutina: " + e.getMessage());
        }
        return diagnosticos;
    }
    
    // Actualizar diagnóstico
    public boolean actualizarDiagnostico(Diagnostico diagnostico) {
        String sql = "UPDATE diagnostico SET fkIdCliente = ?, fkIdRutina = ?, genero = ?, edad = ?, " +
                    "estatura = ?, peso = ?, imcCliente = ?, fechaDiagnostico = ?, frecuenciaDiagnostico = ?, " +
                    "proxDiagnostico = ?, objetivo = ?, medidaBrazo = ?, medidaCintura = ?, medidaPierna = ?, " +
                    "condicionMedica = ?, medicamentos = ?, frecCardiaca = ?, nivelHidratacion = ?, " +
                    "tipoHidratacion = ?, nivelActividadFisica = ?, suplementos = ? WHERE idDiagnostico = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, diagnostico.getFkIdCliente());
            if (diagnostico.getFkIdRutina() != null) {
                pstmt.setInt(2, diagnostico.getFkIdRutina());
            } else {
                pstmt.setNull(2, Types.INTEGER);
            }
            pstmt.setString(3, diagnostico.getGenero());
            pstmt.setInt(4, diagnostico.getEdad());
            pstmt.setFloat(5, diagnostico.getEstatura());
            pstmt.setFloat(6, diagnostico.getPeso());
            pstmt.setFloat(7, diagnostico.getImcCliente());
            pstmt.setDate(8, Date.valueOf(diagnostico.getFechaDiagnostico()));
            pstmt.setInt(9, diagnostico.getFrecuenciaDiagnostico());
            pstmt.setDate(10, Date.valueOf(diagnostico.getProxDiagnostico()));
            pstmt.setString(11, diagnostico.getObjetivo());
            pstmt.setFloat(12, diagnostico.getMedidaBrazo());
            pstmt.setFloat(13, diagnostico.getMedidaCintura());
            pstmt.setFloat(14, diagnostico.getMedidaPierna());
            pstmt.setString(15, diagnostico.getCondicionMedica());
            pstmt.setString(16, diagnostico.getMedicamentos());
            pstmt.setString(17, diagnostico.getFrecCardiaca());
            pstmt.setString(18, diagnostico.getNivelHidratacion());
            pstmt.setString(19, diagnostico.getTipoHidratacion());
            pstmt.setString(20, diagnostico.getNivelActividadFisica());
            pstmt.setString(21, diagnostico.getSuplementos());
            pstmt.setInt(22, diagnostico.getIdDiagnostico());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar diagnóstico: " + e.getMessage());
            return false;
        }
    }
    
    // Eliminar diagnóstico
    public boolean eliminarDiagnostico(int idDiagnostico) {
        String sql = "DELETE FROM diagnostico WHERE idDiagnostico = ?";
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idDiagnostico);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error al eliminar diagnóstico: " + e.getMessage());
            return false;
        }
    }
    
    // Obtener todos los diagnósticos
    public List<Diagnostico> obtenerTodosLosDiagnosticos() {
        String sql = "SELECT * FROM diagnostico ORDER BY fechaDiagnostico DESC";
        List<Diagnostico> diagnosticos = new ArrayList<>();
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                diagnosticos.add(mapearResultSetADiagnostico(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener todos los diagnósticos: " + e.getMessage());
        }
        return diagnosticos;
    }
    
    // Obtener diagnósticos próximos a vencer (para seguimiento)
    public List<Diagnostico> obtenerDiagnosticosProximosAVencer(int diasAnticipacion) {
        String sql = "SELECT * FROM diagnostico WHERE proxDiagnostico <= DATE_ADD(CURDATE(), INTERVAL ? DAY) " +
                    "AND proxDiagnostico >= CURDATE() ORDER BY proxDiagnostico ASC";
        List<Diagnostico> diagnosticos = new ArrayList<>();
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, diasAnticipacion);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                diagnosticos.add(mapearResultSetADiagnostico(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener diagnósticos próximos a vencer: " + e.getMessage());
        }
        return diagnosticos;
    }
    
    // Obtener estadísticas de progreso de un cliente
    public List<Diagnostico> obtenerProgresoCliente(int idCliente, int numeroRegistros) {
        String sql = "SELECT * FROM diagnostico WHERE fkIdCliente = ? " +
                    "ORDER BY fechaDiagnostico DESC LIMIT ?";
        List<Diagnostico> diagnosticos = new ArrayList<>();
        
        try (PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setInt(1, idCliente);
            pstmt.setInt(2, numeroRegistros);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                diagnosticos.add(mapearResultSetADiagnostico(rs));
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener progreso del cliente: " + e.getMessage());
        }
        return diagnosticos;
    }
    
    // Método auxiliar para mapear ResultSet a objeto Diagnostico
    private Diagnostico mapearResultSetADiagnostico(ResultSet rs) throws SQLException {
        Diagnostico diagnostico = new Diagnostico();
        
        diagnostico.setIdDiagnostico(rs.getInt("idDiagnostico"));
        diagnostico.setFkIdCliente(rs.getInt("fkIdCliente"));
        
        // Manejar fkIdRutina que puede ser null
        Integer fkIdRutina = rs.getObject("fkIdRutina", Integer.class);
        diagnostico.setFkIdRutina(fkIdRutina);
        
        diagnostico.setGenero(rs.getString("genero"));
        diagnostico.setEdad(rs.getInt("edad"));
        diagnostico.setEstatura(rs.getFloat("estatura"));
        diagnostico.setPeso(rs.getFloat("peso"));
        diagnostico.setImcCliente(rs.getFloat("imcCliente"));
        
        // Convertir Date a LocalDate
        Date fechaDiagnostico = rs.getDate("fechaDiagnostico");
        if (fechaDiagnostico != null) {
            diagnostico.setFechaDiagnostico(fechaDiagnostico.toLocalDate());
        }
        
        diagnostico.setFrecuenciaDiagnostico(rs.getInt("frecuenciaDiagnostico"));
        
        Date proxDiagnostico = rs.getDate("proxDiagnostico");
        if (proxDiagnostico != null) {
            diagnostico.setProxDiagnostico(proxDiagnostico.toLocalDate());
        }
        
        diagnostico.setObjetivo(rs.getString("objetivo"));
        diagnostico.setMedidaBrazo(rs.getFloat("medidaBrazo"));
        diagnostico.setMedidaCintura(rs.getFloat("medidaCintura"));
        diagnostico.setMedidaPierna(rs.getFloat("medidaPierna"));
        diagnostico.setCondicionMedica(rs.getString("condicionMedica"));
        diagnostico.setMedicamentos(rs.getString("medicamentos"));
        diagnostico.setFrecCardiaca(rs.getString("frecCardiaca"));
        diagnostico.setNivelHidratacion(rs.getString("nivelHidratacion"));
        diagnostico.setTipoHidratacion(rs.getString("tipoHidratacion"));
        diagnostico.setNivelActividadFisica(rs.getString("nivelActividadFisica"));
        diagnostico.setSuplementos(rs.getString("suplementos"));
        
        return diagnostico; 
    }
    
    
    // Cerrar conexión
    public void cerrarConexion() {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar la conexión: " + e.getMessage());
            }
        }
    }
}
