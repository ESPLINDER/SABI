package Modelo;

import java.time.LocalDate;

/**
 *
 * @author William
 */
public class Rutina {
    int idRutina;
    int semanasRutina;
    String descRutina;
    String nivelRutina; //basico, intermedio, avanzado
    LocalDate creacionRutina;
    int autRutina;
    int autorCliente;
    String nomRutina;
    
    //para la creacion base de la rutina
    int numDias;

    public Rutina() {
    }

    public Rutina(int idRutina, int semanasRutina, String descRutina, String nivelRutina, LocalDate creacionRutina, int autRutina, int autorCliente, String nomRutina, int numDias) {
        this.idRutina = idRutina;
        this.semanasRutina = semanasRutina;
        this.descRutina = descRutina;
        this.nivelRutina = nivelRutina;
        this.creacionRutina = creacionRutina;
        this.autRutina = autRutina;
        this.autorCliente = autorCliente;
        this.nomRutina = nomRutina;
        this.numDias = numDias;
    }

    public int getIdRutina() {
        return idRutina;
    }

    public int getSemanasRutina() {
        return semanasRutina;
    }

    public String getDescRutina() {
        return descRutina;
    }

    public String getNivelRutina() {
        return nivelRutina;
    }

    public LocalDate getCreacionRutina() {
        return creacionRutina;
    }

    public int getAutRutina() {
        return autRutina;
    }

    public int getAutorCliente() {
        return autorCliente;
    }

    public String getNomRutina() {
        return nomRutina;
    }

    public int getNumDias() {
        return numDias;
    }

    public void setIdRutina(int idRutina) {
        this.idRutina = idRutina;
    }

    public void setSemanasRutina(int semanasRutina) {
        this.semanasRutina = semanasRutina;
    }

    public void setDescRutina(String descRutina) {
        this.descRutina = descRutina;
    }

    public void setNivelRutina(String nivelRutina) {
        this.nivelRutina = nivelRutina;
    }

    public void setCreacionRutina(LocalDate creacionRutina) {
        this.creacionRutina = creacionRutina;
    }

    public void setAutRutina(int autRutina) {
        this.autRutina = autRutina;
    }

    public void setAutorCliente(int autorCliente) {
        this.autorCliente = autorCliente;
    }

    public void setNomRutina(String nomRutina) {
        this.nomRutina = nomRutina;
    }

    public void setNumDias(int numDias) {
        this.numDias = numDias;
    }

    @Override
    public String toString() {
        return "Rutina{" + "idRutina=" + idRutina + ", semanasRutina=" + semanasRutina + ", descRutina=" + descRutina + ", nivelRutina=" + nivelRutina + ", creacionRutina=" + creacionRutina + ", autRutina=" + autRutina + ", autorCliente=" + autorCliente + ", nomRutina=" + nomRutina + ", numDias=" + numDias + '}';
    }
}
