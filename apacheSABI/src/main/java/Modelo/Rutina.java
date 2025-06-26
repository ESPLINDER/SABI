/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.time.LocalDateTime;

/**
 *
 * @author William
 */
public class Rutina {
    int idRutina;
    int semRutina;
    String descRutina;
    LocalDateTime creaRutina;
    Entrenador autRutina;
    Cliente autorCachorro;

    public Rutina() {
    }

    public Rutina(int idRutina, int semRutina, String descRutina, LocalDateTime creaRutina, Entrenador autRutina, Cliente autorCachorro) {
        this.idRutina = idRutina;
        this.semRutina = semRutina;
        this.descRutina = descRutina;
        this.creaRutina = creaRutina;
        this.autRutina = autRutina;
        this.autorCachorro = autorCachorro;
    }

    public int getIdRutina() {
        return idRutina;
    }

    public int getSemRutina() {
        return semRutina;
    }

    public String getDescRutina() {
        return descRutina;
    }

    public LocalDateTime getCreaRutina() {
        return creaRutina;
    }

    public Entrenador getAutRutina() {
        return autRutina;
    }

    public Cliente getAutorCachorro() {
        return autorCachorro;
    }

    public void setIdRutina(int idRutina) {
        this.idRutina = idRutina;
    }

    public void setSemRutina(int semRutina) {
        this.semRutina = semRutina;
    }

    public void setDescRutina(String descRutina) {
        this.descRutina = descRutina;
    }

    public void setCreaRutina(LocalDateTime creaRutina) {
        this.creaRutina = creaRutina;
    }

    public void setAutRutina(Entrenador autRutina) {
        this.autRutina = autRutina;
    }

    public void setAutorCachorro(Cliente autorCachorro) {
        this.autorCachorro = autorCachorro;
    }

    @Override
    public String toString() {
        return "Rutina{" + "idRutina=" + idRutina + ", semRutina=" + semRutina + ", descRutina=" + descRutina + ", creaRutina=" + creaRutina + ", autRutina=" + autRutina + ", autorCachorro=" + autorCachorro + '}';
    }
}
