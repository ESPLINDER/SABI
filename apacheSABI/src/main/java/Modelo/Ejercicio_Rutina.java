package Modelo;

/**
 * @author William
 */
public class Ejercicio_Rutina {
    int idEjercicio_Rutina;
    Ejercicio fkIdEjercicio;
    Rutina fkIdRutina;
    int semana;
    int dia;
    int ordenEjercicio;
    int serie;
    int repeticiones;
    int peso;
    String intensidad; //'baja', 'intermedia', 'alta', 'maxima'
    int descanso; //En segundos

    public Ejercicio_Rutina() {
    }

    public Ejercicio_Rutina(int idEjercicio_Rutina, Ejercicio fkIdEjercicio, Rutina fkIdRutina, int semana, int dia, int ordenEjercicio, int serie, int repeticiones, int peso, String intensidad, int descanso) {
        this.idEjercicio_Rutina = idEjercicio_Rutina;
        this.fkIdEjercicio = fkIdEjercicio;
        this.fkIdRutina = fkIdRutina;
        this.semana = semana;
        this.dia = dia;
        this.ordenEjercicio = ordenEjercicio;
        this.serie = serie;
        this.repeticiones = repeticiones;
        this.peso = peso;
        this.intensidad = intensidad;
        this.descanso = descanso;
    }

    public int getIdEjercicio_Rutina() {
        return idEjercicio_Rutina;
    }

    public Ejercicio getFkIdEjercicio() {
        return fkIdEjercicio;
    }

    public Rutina getFkIdRutina() {
        return fkIdRutina;
    }

    public int getSemana() {
        return semana;
    }

    public int getDia() {
        return dia;
    }

    public int getOrdenEjercicio() {
        return ordenEjercicio;
    }

    public int getSerie() {
        return serie;
    }

    public int getRepeticiones() {
        return repeticiones;
    }

    public int getPeso() {
        return peso;
    }

    public String getIntensidad() {
        return intensidad;
    }

    public int getDescanso() {
        return descanso;
    }

    public void setIdEjercicio_Rutina(int idEjercicio_Rutina) {
        this.idEjercicio_Rutina = idEjercicio_Rutina;
    }

    public void setFkIdEjercicio(Ejercicio fkIdEjercicio) {
        this.fkIdEjercicio = fkIdEjercicio;
    }

    public void setFkIdRutina(Rutina fkIdRutina) {
        this.fkIdRutina = fkIdRutina;
    }

    public void setSemana(int semana) {
        this.semana = semana;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    public void setOrdenEjercicio(int ordenEjercicio) {
        this.ordenEjercicio = ordenEjercicio;
    }

    public void setSerie(int serie) {
        this.serie = serie;
    }

    public void setRepeticiones(int repeticiones) {
        this.repeticiones = repeticiones;
    }

    public void setPeso(int peso) {
        this.peso = peso;
    }

    public void setIntensidad(String intensidad) {
        this.intensidad = intensidad;
    }

    public void setDescanso(int descanso) {
        this.descanso = descanso;
    }

    @Override
    public String toString() {
        return "Ejercicio_Rutina{" + "idEjercicio_Rutina=" + idEjercicio_Rutina + ", fkIdEjercicio=" + fkIdEjercicio + ", fkIdRutina=" + fkIdRutina + ", semana=" + semana + ", dia=" + dia + ", ordenEjercicio=" + ordenEjercicio + ", serie=" + serie + ", repeticiones=" + repeticiones + ", peso=" + peso + ", intensidad=" + intensidad + ", descanso=" + descanso + '}';
    }
}
