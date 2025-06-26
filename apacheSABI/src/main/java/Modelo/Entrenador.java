/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author William
 */
public class Entrenador {
    int idEntrenador;
    Usuario fkIdUsuario;
    String espeEntrenador; //Especialidad
    String expEntrenador;
    String bioEntrenador; //biografia que se muestra en su perfil
    String nomEntrenador;
    String apeEntrenador;
    String estadoEntrenador;
    float calificacion;

    public Entrenador() {
    }

    public Entrenador(int idEntrenador, Usuario fkIdUsuario, String espeEntrenador, String expEntrenador, String bioEntrenador, String nomEntrenador, String apeEntrenador, String estadoEntrenador, float calificacion) {
        this.idEntrenador = idEntrenador;
        this.fkIdUsuario = fkIdUsuario;
        this.espeEntrenador = espeEntrenador;
        this.expEntrenador = expEntrenador;
        this.bioEntrenador = bioEntrenador;
        this.nomEntrenador = nomEntrenador;
        this.apeEntrenador = apeEntrenador;
        this.estadoEntrenador = estadoEntrenador;
        this.calificacion = calificacion;
    }

    public int getIdEntrenador() {
        return idEntrenador;
    }

    public Usuario getFkIdUsuario() {
        return fkIdUsuario;
    }

    public String getEspeEntrenador() {
        return espeEntrenador;
    }

    public String getExpEntrenador() {
        return expEntrenador;
    }

    public String getBioEntrenador() {
        return bioEntrenador;
    }

    public String getNomEntrenador() {
        return nomEntrenador;
    }

    public String getApeEntrenador() {
        return apeEntrenador;
    }

    public String getEstadoEntrenador() {
        return estadoEntrenador;
    }

    public float getCalificacion() {
        return calificacion;
    }

    public void setIdEntrenador(int idEntrenador) {
        this.idEntrenador = idEntrenador;
    }

    public void setFkIdUsuario(Usuario fkIdUsuario) {
        this.fkIdUsuario = fkIdUsuario;
    }

    public void setEspeEntrenador(String espeEntrenador) {
        this.espeEntrenador = espeEntrenador;
    }

    public void setExpEntrenador(String expEntrenador) {
        this.expEntrenador = expEntrenador;
    }

    public void setBioEntrenador(String bioEntrenador) {
        this.bioEntrenador = bioEntrenador;
    }

    public void setNomEntrenador(String nomEntrenador) {
        this.nomEntrenador = nomEntrenador;
    }

    public void setApeEntrenador(String apeEntrenador) {
        this.apeEntrenador = apeEntrenador;
    }

    public void setEstadoEntrenador(String estadoEntrenador) {
        this.estadoEntrenador = estadoEntrenador;
    }

    public void setCalificacion(float calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "Entrenador{" + "idEntrenador=" + idEntrenador + ", fkIdUsuario=" + fkIdUsuario + ", espeEntrenador=" + espeEntrenador + ", expEntrenador=" + expEntrenador + ", bioEntrenador=" + bioEntrenador + ", nomEntrenador=" + nomEntrenador + ", apeEntrenador=" + apeEntrenador + ", estadoEntrenador=" + estadoEntrenador + ", calificacion=" + calificacion + '}';
    }
    
    
}
