package Modelo;

/**
 * @author William
 */
public class Ejercicio {
    int idEjercicio;
    String nomEjercicio;
    String descEjercicio;
    String tipEjercicio;
    int autorEjercicio;
    String urlVideo;

    public Ejercicio() {
    }

    public Ejercicio(int idEjercicio, String nomEjercicio, String descEjercicio, String tipEjercicio, int autorEjercicio, String urlVideo) {
        this.idEjercicio = idEjercicio;
        this.nomEjercicio = nomEjercicio;
        this.descEjercicio = descEjercicio;
        this.tipEjercicio = tipEjercicio;
        this.autorEjercicio = autorEjercicio;
        this.urlVideo = urlVideo;
    }

    public int getIdEjercicio() {
        return idEjercicio;
    }

    public String getNomEjercicio() {
        return nomEjercicio;
    }

    public String getDescEjercicio() {
        return descEjercicio;
    }

    public String getTipEjercicio() {
        return tipEjercicio;
    }

    public int getAutorEjercicio() {
        return autorEjercicio;
    }

    public String getUrlVideo() {
        return urlVideo;
    }

    public void setIdEjercicio(int idEjercicio) {
        this.idEjercicio = idEjercicio;
    }

    public void setNomEjercicio(String nomEjercicio) {
        this.nomEjercicio = nomEjercicio;
    }

    public void setDescEjercicio(String descEjercicio) {
        this.descEjercicio = descEjercicio;
    }

    public void setTipEjercicio(String tipEjercicio) {
        this.tipEjercicio = tipEjercicio;
    }

    public void setAutorEjercicio(int autorEjercicio) {
        this.autorEjercicio = autorEjercicio;
    }

    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }

    @Override
    public String toString() {
        return "Ejercicio{" + "idEjercicio=" + idEjercicio + ", nomEjercicio=" + nomEjercicio + ", descEjercicio=" + descEjercicio + ", tipEjercicio=" + tipEjercicio + ", autorEjercicio=" + autorEjercicio + ", urlVideo=" + urlVideo + '}';
    }
}
