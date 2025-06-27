package Modelo;
/**
 * @author William
 */
public class Redes {
    int idRed;
    int idUsuario;
    String nomRed;
    String urlRed;

    public Redes() {
    }

    public Redes(int idRed, int idUsuario, String nomRed, String urlRed) {
        this.idRed = idRed;
        this.idUsuario = idUsuario;
        this.nomRed = nomRed;
        this.urlRed = urlRed;
    }

    public int getIdRed() {
        return idRed;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNomRed() {
        return nomRed;
    }

    public String getUrlRed() {
        return urlRed;
    }

    public void setIdRed(int idRed) {
        this.idRed = idRed;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNomRed(String nomRed) {
        this.nomRed = nomRed;
    }

    public void setUrlRed(String urlRed) {
        this.urlRed = urlRed;
    }

    @Override
    public String toString() {
        return "Redes{" + "idRed=" + idRed + ", idUsuario=" + idUsuario + ", nomRed=" + nomRed + ", urlRed=" + urlRed + '}';
    }
}
