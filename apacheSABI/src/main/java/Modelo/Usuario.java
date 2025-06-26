package Modelo;

import java.time.LocalDate;

public class Usuario {
    int idUsuario;
    String tipUsuario;
    String emaUsuario;
    LocalDate nacUsuario;
    int edadUsuario;
    String pasUsuario;
    String genUsuario;
    String tipDocumento;
    int docUsuario;
    String ciuUsuario;
    String domicilio;

    // Constructor vacío
    public Usuario() {}

    // Constructor completo
    public Usuario(int idUsuario, String tipUsuario, String emaUsuario, LocalDate nacUsuario,
                   int edadUsuario, String pasUsuario, String genUsuario, String tipDocumento,
                   int docUsuario, String ciuUsuario, String domicilio) {
        this.idUsuario = idUsuario;
        this.tipUsuario = tipUsuario;
        this.emaUsuario = emaUsuario;
        this.nacUsuario = nacUsuario;
        this.edadUsuario = edadUsuario;
        this.pasUsuario = pasUsuario;
        this.genUsuario = genUsuario;
        this.tipDocumento = tipDocumento;
        this.docUsuario = docUsuario;
        this.ciuUsuario = ciuUsuario;
        this.domicilio = domicilio;
    }

    // Getters y Setters
    public int getIdUsuario() { return idUsuario; }
    public void setIdUsuario(int idUsuario) { this.idUsuario = idUsuario; }

    public String getTipUsuario() { return tipUsuario; }
    public void setTipUsuario(String tipUsuario) { this.tipUsuario = tipUsuario; }

    public String getEmaUsuario() { return emaUsuario; }
    public void setEmaUsuario(String emaUsuario) { this.emaUsuario = emaUsuario; }

    public LocalDate getNacUsuario() { return nacUsuario; }
    public void setNacUsuario(LocalDate nacUsuario) { this.nacUsuario = nacUsuario; }

    public int getEdadUsuario() { return edadUsuario; }
    public void setEdadUsuario(int edadUsuario) { this.edadUsuario = edadUsuario; }

    public String getPasUsuario() { return pasUsuario; }
    public void setPasUsuario(String pasUsuario) { this.pasUsuario = pasUsuario; }

    public String getGenUsuario() { return genUsuario; }
    public void setGenUsuario(String genUsuario) { this.genUsuario = genUsuario; }

    public String getTipDocumento() { return tipDocumento; }
    public void setTipDocumento(String tipDocumento) { this.tipDocumento = tipDocumento; }

    public int getDocUsuario() { return docUsuario; }
    public void setDocUsuario(int docUsuario) { this.docUsuario = docUsuario; }

    public String getCiuUsuario() { return ciuUsuario; }
    public void setCiuUsuario(String ciuUsuario) { this.ciuUsuario = ciuUsuario; }

    public String getDomicilio() { return domicilio; }
    public void setDomicilio(String domicilio) { this.domicilio = domicilio; }

    @Override
    public String toString() {
        return "Usuario{" +
                "idUsuario=" + idUsuario +
                ", tipUsuario='" + tipUsuario + '\'' +
                ", emaUsuario='" + emaUsuario + '\'' +
                ", nacUsuario=" + nacUsuario +
                ", edadUsuario=" + edadUsuario +
                ", genUsuario='" + genUsuario + '\'' +
                ", tipDocumento='" + tipDocumento + '\'' +
                ", docUsuario=" + docUsuario +
                ", ciuUsuario='" + ciuUsuario + '\'' +
                ", domicilio='" + domicilio + '\'' +
                '}';
    }
}

