package Modelo;
/**
 * @author William
 */
public class Maximos {
    int semanas;
    int dias;
    int ejercicios;

    public Maximos() {
    }

    public Maximos(int semanas, int dias, int ejercicios) {
        this.semanas = semanas;
        this.dias = dias;
        this.ejercicios = ejercicios;
    }

    public int getSemanas() {
        return semanas;
    }

    public int getDias() {
        return dias;
    }

    public int getEjercicios() {
        return ejercicios;
    }

    public void setSemanas(int semanas) {
        this.semanas = semanas;
    }

    public void setDias(int dias) {
        this.dias = dias;
    }

    public void setEjercicios(int ejercicios) {
        this.ejercicios = ejercicios;
    }
}
