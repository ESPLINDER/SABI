package Modelo;

public class Usuario {
    int idUsuario;
    String nomUsuario;
    String apeUsuario;
    String emaUsuario;
    String passUsuario;
    String tipDocumento;
    int numDocumento;
    String ciudadUsuario;
    String rolUsuario; //cliente, entrenador
    String especialidad;
    String xpAños;
    String biogreafia; //Se muestra en su perfil
    float promCalificacion;
    String estadoUsuario;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nomUsuario, String apeUsuario, String emaUsuario, String pasUssuario, String tipDocumento, int numDocumento, String ciudadUsuario, String rolUsuario, String especialidad, String xpAños, String biogreafia, float promCalificacion, String estadoUsuario) {
        this.idUsuario = idUsuario;
        this.nomUsuario = nomUsuario;
        this.apeUsuario = apeUsuario;
        this.emaUsuario = emaUsuario;
        this.passUsuario = pasUssuario;
        this.tipDocumento = tipDocumento;
        this.numDocumento = numDocumento;
        this.ciudadUsuario = ciudadUsuario;
        this.rolUsuario = rolUsuario;
        this.especialidad = especialidad;
        this.xpAños = xpAños;
        this.biogreafia = biogreafia;
        this.promCalificacion = promCalificacion;
        this.estadoUsuario = estadoUsuario;
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

    public String getXpAños() {
        return xpAños;
    }

    public String getBiogreafia() {
        return biogreafia;
    }

    public float getPromCalificacion() {
        return promCalificacion;
    }

    public String getEstadoUsuario() {
        return estadoUsuario;
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

    public void setPassUsuario(String pasUssuario) {
        this.passUsuario = pasUssuario;
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

    public void setXpAños(String xpAños) {
        this.xpAños = xpAños;
    }

    public void setBiogreafia(String biogreafia) {
        this.biogreafia = biogreafia;
    }

    public void setPromCalificacion(float promCalificacion) {
        this.promCalificacion = promCalificacion;
    }

    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }
    
    
}

