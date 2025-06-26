package Modelo;
/**
 * @author SDC
 */
public class Usuario {
    private int idUsuario;
    private String nomUsuario;
    private String apeUsuario;
    private String emaUsuario;
    private String passUsuario;
    private String tipDocumento;
    private int numDocumento;
    private String ciudadUsuario;
    private String rolUsuario;
    private String especialidad;
    private float xpAños;
    private String biografia;
    private int promCalificacion;
    private String estadoUsuario;
    
    public Usuario() {
    }
    
    public Usuario(int idUsuario,String nomUsuario, String apeUsuario, String emaUsuario, String passUsuario, String tipDocumento, int numDocumento, String ciudadUsuario, String rolUsuario) {
        this.idUsuario = idUsuario;
        this.nomUsuario = nomUsuario;
        this.apeUsuario = apeUsuario;
        this.emaUsuario = emaUsuario;
        this.passUsuario = passUsuario;
        this.tipDocumento = tipDocumento;
        this.numDocumento = numDocumento;
        this.ciudadUsuario = ciudadUsuario;
        this.rolUsuario = rolUsuario;
    }
    
    public int getIdUsuario() {
        return idUsuario;
    }
    
    public String getnomUsuario() {
        return nomUsuario;
    }
    
    public String getapeUsuario() {
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
    
    public int getPromCalificacion() {
        return promCalificacion;
    }
    
    public String getEstadoUsuario() {
        return estadoUsuario;
    }
    
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public void setnomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }
        
        public void setapeUsuario(String apeUsuario) {
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
    
    public void setPromCalificacion(int promCalificacion) {
        this.promCalificacion = promCalificacion;
    }
    
    public void setEstadoUsuario(String estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }
    
   @Override
public String toString() {
    return "Usuario{" + "idUsuario=" + idUsuario + ", emaUsuario='" + emaUsuario + "', passUsuario='" + passUsuario + "', tipDocumento=" + tipDocumento + ", numDocumento=" + numDocumento + ", nomUsuario='" + nomUsuario + "', apeUsuario='" + apeUsuario + "', ciudadUsuario='" + ciudadUsuario + "', rolUsuario=" + rolUsuario + ", especialidad='" + especialidad + "', xpAños=" + xpAños + ", biografia='" + biografia + "', promCalificacion=" + promCalificacion + ", estadoUsuario=" + estadoUsuario + '}';
  }
}