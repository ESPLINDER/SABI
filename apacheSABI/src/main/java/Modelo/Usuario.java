package Modelo;

public class Usuario {
    
    private int idUsuario;             // Identificador único del usuario
    private String nomUsuario;         // Nombre del usuario
    private String apeUsuario;         // Apellido del usuario
    private String emaUsuario;         // Correo electrónico del usuario
    private String passUsuario;        // Contraseña del usuario (hasheada)
    private String tipDocumento;       // Tipo de documento (CC, TI, CE)
    private int numDocumento;          // Número de documento
    private String ciudadUsuario;      // Ciudad del usuario
    private String rolUsuario;         // Rol del usuario (entrenador, cliente)
    private String especialidad;       // Especialidad del entrenador
    private float xpAños;              // Años de experiencia
    private String biografia;          // Biografía del usuario
    private float promCalificacion;    // Promedio de calificación
    private String estadoUsuario;  
    private int fkIdRutina;    // Estado del usuario (activo, inactivo)

    // Constructor vacío
    public Usuario() {}

    public Usuario(int idUsuario, String nomUsuario, String apeUsuario, String emaUsuario, String passUsuario, String tipDocumento, int numDocumento, String ciudadUsuario, String rolUsuario, String especialidad, float xpAños, String biografia, float promCalificacion, String estadoUsuario, int fkIdRutina) {
        this.idUsuario = idUsuario;
        this.nomUsuario = nomUsuario;
        this.apeUsuario = apeUsuario;
        this.emaUsuario = emaUsuario;
        this.passUsuario = passUsuario;
        this.tipDocumento = tipDocumento;
        this.numDocumento = numDocumento;
        this.ciudadUsuario = ciudadUsuario;
        this.rolUsuario = rolUsuario;
        this.especialidad = especialidad;
        this.xpAños = xpAños;
        this.biografia = biografia;
        this.promCalificacion = promCalificacion;
        this.estadoUsuario = estadoUsuario;
        this.fkIdRutina = fkIdRutina;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNomUsuario() {
        return nomUsuario;
    }

    public String getApeUsuario() {
        return apeUsuario;
    }

    public String getEmaUsuario() {
        return emaUsuario;
    }

    public String getPassUsuario() {
        return passUsuario;
    }

    public String getTipDocumento() {
        return tipDocumento;
    }

    public int getNumDocumento() {
        return numDocumento;
    }

    public String getCiudadUsuario() {
        return ciudadUsuario;
    }

    public String getRolUsuario() {
        return rolUsuario;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public float getXpAños() {
        return xpAños;
    }

    public String getBiografia() {
        return biografia;
    }

    public float getPromCalificacion() {
        return promCalificacion;
    }

    public String getEstadoUsuario() {
        return estadoUsuario;
    }

    public int getFkIdRutina() {
        return fkIdRutina;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }

    public void setApeUsuario(String apeUsuario) {
        this.apeUsuario = apeUsuario;
    }

    public void setEmaUsuario(String emaUsuario) {
        this.emaUsuario = emaUsuario;
    }

    public void setPassUsuario(String passUsuario) {
        this.passUsuario = passUsuario;
    }

    public void setTipDocumento(String tipDocumento) {
        this.tipDocumento = tipDocumento;
    }

    public void setNumDocumento(int numDocumento) {
        this.numDocumento = numDocumento;
    }

    public void setCiudadUsuario(String ciudadUsuario) {
        this.ciudadUsuario = ciudadUsuario;
    }

    public void setRolUsuario(String rolUsuario) {
        this.rolUsuario = rolUsuario;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void setXpAños(float xpAños) {
        this.xpAños = xpAños;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public void setPromCalificacion(float promCalificacion) {
        this.promCalificacion = promCalificacion;
    }

    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    public void setFkIdRutina(int fkIdRutina) {
        this.fkIdRutina = fkIdRutina;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nomUsuario=" + nomUsuario + ", apeUsuario=" + apeUsuario + ", emaUsuario=" + emaUsuario + ", passUsuario=" + passUsuario + ", tipDocumento=" + tipDocumento + ", numDocumento=" + numDocumento + ", ciudadUsuario=" + ciudadUsuario + ", rolUsuario=" + rolUsuario + ", especialidad=" + especialidad + ", xpA\u00f1os=" + xpAños + ", biografia=" + biografia + ", promCalificacion=" + promCalificacion + ", estadoUsuario=" + estadoUsuario + ", fkIdRutina=" + fkIdRutina + '}';
    }
}