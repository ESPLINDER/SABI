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
    int semanasRutina;
    String descRutina;
    String nivelRutina; //basico, intermedio, avanzado
    LocalDateTime creacionRutina;
    Usuario autRutina;
    Cliente autorCliente;
    
    //para la creacion base de la rutina
    int numDias;

    public Rutina() {
    }

    public Rutina(int idRutina, int semanasRutina, String descRutina, String nivelRutina, LocalDateTime creacionRutina, Usuario autRutina, Cliente autorCliente) {
        this.idRutina = idRutina;
        this.semanasRutina = semanasRutina;
        this.descRutina = descRutina;
        this.nivelRutina = nivelRutina;
        this.creacionRutina = creacionRutina;
        this.autRutina = autRutina;
        this.autorCliente = autorCliente;
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

    public LocalDateTime getCreacionRutina() {
        return creacionRutina;
    }

    public Usuario getAutRutina() {
        return autRutina;
    }

    public Cliente getAutorCliente() {
        return autorCliente;
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

    public void setCreacionRutina(LocalDateTime creacionRutina) {
        this.creacionRutina = creacionRutina;
    }

    public void setAutRutina(Usuario autRutina) {
        this.autRutina = autRutina;
    }

    public void setAutorCliente(Cliente autorCliente) {
        this.autorCliente = autorCliente;
    }
}
