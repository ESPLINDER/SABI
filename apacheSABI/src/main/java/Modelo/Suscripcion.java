package Modelo;

import java.time.LocalDateTime;
/**
 *
 * @author Rojas
 */
public class Suscripcion {
    
    int idSuscripcion;
    int fkIdEntrenador;
    int fkIdCliente;
    LocalDateTime inicioSuscripcion;
    LocalDateTime finSuscripcion;
    String estadoSuscripcion;
    int renociones;
    float valorSuscripcion;
    
    public Suscripcion(){}

    public Suscripcion(int idSuscripcion, int fkIdEntrenador, int fkIdCliente, LocalDateTime inicioSuscripcion, LocalDateTime finSuscripcion, String estadoSuscripcion, int renociones, float valorSuscripcion) {
        this.idSuscripcion = idSuscripcion;
        this.fkIdEntrenador = fkIdEntrenador;
        this.fkIdCliente = fkIdCliente;
        this.inicioSuscripcion = inicioSuscripcion;
        this.finSuscripcion = finSuscripcion;
        this.estadoSuscripcion = estadoSuscripcion;
        this.renociones = renociones;
        this.valorSuscripcion = valorSuscripcion;
    }

    public int getIdSuscripcion() {
        return idSuscripcion;
    }

    public int getFkIdEntrenador() {
        return fkIdEntrenador;
    }

    public int getFkIdCliente() {
        return fkIdCliente;
    }

    public LocalDateTime getInicioSuscripcion() {
        return inicioSuscripcion;
    }

    public LocalDateTime getFinSuscripcion() {
        return finSuscripcion;
    }

    public String getEstadoSuscripcion() {
        return estadoSuscripcion;
    }

    public int getRenociones() {
        return renociones;
    }

    public float getValorSuscripcion() {
        return valorSuscripcion;
    }

    public void setIdSuscripcion(int idSuscripcion) {
        this.idSuscripcion = idSuscripcion;
    }

    public void setFkIdEntrenador(int fkIdEntrenador) {
        this.fkIdEntrenador = fkIdEntrenador;
    }

    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }

    public void setInicioSuscripcion(LocalDateTime inicioSuscripcion) {
        this.inicioSuscripcion = inicioSuscripcion;
    }

    public void setFinSuscripcion(LocalDateTime finSuscripcion) {
        this.finSuscripcion = finSuscripcion;
    }

    public void setEstadoSuscripcion(String estadoSuscripcion) {
        this.estadoSuscripcion = estadoSuscripcion;
    }

    public void setRenociones(int renociones) {
        this.renociones = renociones;
    }

    public void setValorSuscripcion(float valorSuscripcion) {
        this.valorSuscripcion = valorSuscripcion;
    }

    @Override
    public String toString() {
        return "Suscripcion{" + "idSuscripcion=" + idSuscripcion + ", fkIdEntrenador=" + fkIdEntrenador + ", fkIdCliente=" + fkIdCliente + ", inicioSuscripcion=" + inicioSuscripcion + ", finSuscripcion=" + finSuscripcion + ", estadoSuscripcion=" + estadoSuscripcion + ", renociones=" + renociones + ", valorSuscripcion=" + valorSuscripcion + '}';
    }
}
