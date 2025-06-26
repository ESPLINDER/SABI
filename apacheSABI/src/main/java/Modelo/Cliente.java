package Modelo;

class Cliente {
    private int idCliente;
    private String tipCliente;
    private String planCliente;
    private int fkIdUsuario;
    private String nomCliente;
    private String apeCliente;
    
    // Para el registro completo
    private Usuario usuario;

    // Constructor vacío
    public Cliente() {}

    // Constructor completo
    public Cliente(int idCliente, String tipCliente, String planCliente, 
                   int fkIdUsuario, String nomCliente, String apeCliente) {
        this.idCliente = idCliente;
        this.tipCliente = tipCliente;
        this.planCliente = planCliente;
        this.fkIdUsuario = fkIdUsuario;
        this.nomCliente = nomCliente;
        this.apeCliente = apeCliente;
    }

    // Getters y Setters
    public int getIdCliente() { return idCliente; }
    public void setIdCliente(int idCliente) { this.idCliente = idCliente; }

    public String getTipCliente() { return tipCliente; }
    public void setTipCliente(String tipCliente) { this.tipCliente = tipCliente; }

    public String getPlanCliente() { return planCliente; }
    public void setPlanCliente(String planCliente) { this.planCliente = planCliente; }

    public int getFkIdUsuario() { return fkIdUsuario; }
    public void setFkIdUsuario(int fkIdUsuario) { this.fkIdUsuario = fkIdUsuario; }

    public String getNomCliente() { return nomCliente; }
    public void setNomCliente(String nomCliente) { this.nomCliente = nomCliente; }

    public String getApeCliente() { return apeCliente; }
    public void setApeCliente(String apeCliente) { this.apeCliente = apeCliente; }

    public Usuario getUsuario() { return usuario; }
    public void setUsuario(Usuario usuario) { this.usuario = usuario; }

    @Override
    public String toString() {
        return "Cliente{" +
                "idCliente=" + idCliente +
                ", tipCliente='" + tipCliente + '\'' +
                ", planCliente='" + planCliente + '\'' +
                ", fkIdUsuario=" + fkIdUsuario +
                ", nomCliente='" + nomCliente + '\'' +
                ", apeCliente='" + apeCliente + '\'' +
                '}';
    }
}
 
