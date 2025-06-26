package Modelo;
/**
 * @author William
 */
public class Redes {
    int idRed;
    Entrenador idEntrenador;
    String nombreRed;
    String urlRed;

    public Redes() {
    }

    public Redes(int idRed, Entrenador idEntrenador, String nombreRed, String urlRed) {
        this.idRed = idRed;
        this.idEntrenador = idEntrenador;
        this.nombreRed = nombreRed;
        this.urlRed = urlRed;
    }

    public int getIdRed() {
        return idRed;
    }

    public Entrenador getIdEntrenador() {
        return idEntrenador;
    }

    public String getNombreRed() {
        return nombreRed;
    }

    public String getUrlRed() {
        return urlRed;
    }

    public void setIdRed(int idRed) {
        this.idRed = idRed;
    }

    public void setIdEntrenador(Entrenador idEntrenador) {
        this.idEntrenador = idEntrenador;
    }

    public void setNombreRed(String nombreRed) {
        this.nombreRed = nombreRed;
    }

    public void setUrlRed(String urlRed) {
        this.urlRed = urlRed;
    }

    @Override
    public String toString() {
        return "Redes{" + "idRed=" + idRed + ", idEntrenador=" + idEntrenador + ", nombreRed=" + nombreRed + ", urlRed=" + urlRed + '}';
    }
    
}
