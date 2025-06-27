package Modelo;

import java.time.LocalDate;

public class Diagnostico {
    private int idDiagnostico;
    private int fkIdCliente;
    private Integer fkIdRutina; // Nullable
    private String genero;
    private int edad;
    private float estatura;
    private float peso;
    private float imcCliente;
    private LocalDate fechaDiagnostico;
    private int frecuenciaDiagnostico;
    private LocalDate proxDiagnostico;
    private String objetivo;
    private float medidaBrazo;
    private float medidaCintura;
    private float medidaPierna;
    private String condicionMedica;
    private String medicamentos;
    private String frecCardiaca;
    private String nivelHidratacion;
    private String tipoHidratacion;
    private String nivelActividadFisica;
    private String suplementos;

    // Constructor vacío
    public Diagnostico() {
    }

    // Constructor completo
    public Diagnostico(int idDiagnostico, int fkIdCliente, Integer fkIdRutina, String genero, 
                      int edad, float estatura, float peso, float imcCliente, 
                      LocalDate fechaDiagnostico, int frecuenciaDiagnostico, 
                      LocalDate proxDiagnostico, String objetivo, float medidaBrazo, 
                      float medidaCintura, float medidaPierna, String condicionMedica, 
                      String medicamentos, String frecCardiaca, String nivelHidratacion, 
                      String tipoHidratacion, String nivelActividadFisica, String suplementos) {
        this.idDiagnostico = idDiagnostico;
        this.fkIdCliente = fkIdCliente;
        this.fkIdRutina = fkIdRutina;
        this.genero = genero;
        this.edad = edad;
        this.estatura = estatura;
        this.peso = peso;
        this.imcCliente = imcCliente;
        this.fechaDiagnostico = fechaDiagnostico;
        this.frecuenciaDiagnostico = frecuenciaDiagnostico;
        this.proxDiagnostico = proxDiagnostico;
        this.objetivo = objetivo;
        this.medidaBrazo = medidaBrazo;
        this.medidaCintura = medidaCintura;
        this.medidaPierna = medidaPierna;
        this.condicionMedica = condicionMedica;
        this.medicamentos = medicamentos;
        this.frecCardiaca = frecCardiaca;
        this.nivelHidratacion = nivelHidratacion;
        this.tipoHidratacion = tipoHidratacion;
        this.nivelActividadFisica = nivelActividadFisica;
        this.suplementos = suplementos;
    }

    // Constructor sin ID (para inserción)
    public Diagnostico(int fkIdCliente, Integer fkIdRutina, String genero, int edad, 
                      float estatura, float peso, float imcCliente, LocalDate fechaDiagnostico, 
                      int frecuenciaDiagnostico, LocalDate proxDiagnostico, String objetivo, 
                      float medidaBrazo, float medidaCintura, float medidaPierna, 
                      String condicionMedica, String medicamentos, String frecCardiaca, 
                      String nivelHidratacion, String tipoHidratacion, 
                      String nivelActividadFisica, String suplementos) {
        this.fkIdCliente = fkIdCliente;
        this.fkIdRutina = fkIdRutina;
        this.genero = genero;
        this.edad = edad;
        this.estatura = estatura;
        this.peso = peso;
        this.imcCliente = imcCliente;
        this.fechaDiagnostico = fechaDiagnostico;
        this.frecuenciaDiagnostico = frecuenciaDiagnostico;
        this.proxDiagnostico = proxDiagnostico;
        this.objetivo = objetivo;
        this.medidaBrazo = medidaBrazo;
        this.medidaCintura = medidaCintura;
        this.medidaPierna = medidaPierna;
        this.condicionMedica = condicionMedica;
        this.medicamentos = medicamentos;
        this.frecCardiaca = frecCardiaca;
        this.nivelHidratacion = nivelHidratacion;
        this.tipoHidratacion = tipoHidratacion;
        this.nivelActividadFisica = nivelActividadFisica;
        this.suplementos = suplementos;
    }

    // Getters y Setters
    public int getIdDiagnostico() {
        return idDiagnostico;
    }

    public void setIdDiagnostico(int idDiagnostico) {
        this.idDiagnostico = idDiagnostico;
    }

    public int getFkIdCliente() {
        return fkIdCliente;
    }

    public void setFkIdCliente(int fkIdCliente) {
        this.fkIdCliente = fkIdCliente;
    }

    public Integer getFkIdRutina() {
        return fkIdRutina;
    }

    public void setFkIdRutina(Integer fkIdRutina) {
        this.fkIdRutina = fkIdRutina;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public float getEstatura() {
        return estatura;
    }

    public void setEstatura(float estatura) {
        this.estatura = estatura;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getImcCliente() {
        return imcCliente;
    }

    public void setImcCliente(float imcCliente) {
        this.imcCliente = imcCliente;
    }

    public LocalDate getFechaDiagnostico() {
        return fechaDiagnostico;
    }

    public void setFechaDiagnostico(LocalDate fechaDiagnostico) {
        this.fechaDiagnostico = fechaDiagnostico;
    }

    public int getFrecuenciaDiagnostico() {
        return frecuenciaDiagnostico;
    }

    public void setFrecuenciaDiagnostico(int frecuenciaDiagnostico) {
        this.frecuenciaDiagnostico = frecuenciaDiagnostico;
    }

    public LocalDate getProxDiagnostico() {
        return proxDiagnostico;
    }

    public void setProxDiagnostico(LocalDate proxDiagnostico) {
        this.proxDiagnostico = proxDiagnostico;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public float getMedidaBrazo() {
        return medidaBrazo;
    }

    public void setMedidaBrazo(float medidaBrazo) {
        this.medidaBrazo = medidaBrazo;
    }

    public float getMedidaCintura() {
        return medidaCintura;
    }

    public void setMedidaCintura(float medidaCintura) {
        this.medidaCintura = medidaCintura;
    }

    public float getMedidaPierna() {
        return medidaPierna;
    }

    public void setMedidaPierna(float medidaPierna) {
        this.medidaPierna = medidaPierna;
    }

    public String getCondicionMedica() {
        return condicionMedica;
    }

    public void setCondicionMedica(String condicionMedica) {
        this.condicionMedica = condicionMedica;
    }

    public String getMedicamentos() {
        return medicamentos;
    }

    public void setMedicamentos(String medicamentos) {
        this.medicamentos = medicamentos;
    }

    public String getFrecCardiaca() {
        return frecCardiaca;
    }

    public void setFrecCardiaca(String frecCardiaca) {
        this.frecCardiaca = frecCardiaca;
    }

    public String getNivelHidratacion() {
        return nivelHidratacion;
    }

    public void setNivelHidratacion(String nivelHidratacion) {
        this.nivelHidratacion = nivelHidratacion;
    }

    public String getTipoHidratacion() {
        return tipoHidratacion;
    }

    public void setTipoHidratacion(String tipoHidratacion) {
        this.tipoHidratacion = tipoHidratacion;
    }

    public String getNivelActividadFisica() {
        return nivelActividadFisica;
    }

    public void setNivelActividadFisica(String nivelActividadFisica) {
        this.nivelActividadFisica = nivelActividadFisica;
    }

    public String getSuplementos() {
        return suplementos;
    }

    public void setSuplementos(String suplementos) {
        this.suplementos = suplementos;
    }

    // Método para calcular IMC automáticamente
    public void calcularIMC() {
        if (peso > 0 && estatura > 0) {
            this.imcCliente = peso / (estatura * estatura);
        }
    }

    // Método toString
    @Override
    public String toString() {
        return "Diagnostico{" +
                "idDiagnostico=" + idDiagnostico +
                ", fkIdCliente=" + fkIdCliente +
                ", fkIdRutina=" + fkIdRutina +
                ", genero='" + genero + '\'' +
                ", edad=" + edad +
                ", estatura=" + estatura +
                ", peso=" + peso +
                ", imcCliente=" + imcCliente +
                ", fechaDiagnostico=" + fechaDiagnostico +
                ", frecuenciaDiagnostico=" + frecuenciaDiagnostico +
                ", proxDiagnostico=" + proxDiagnostico +
                ", objetivo='" + objetivo + '\'' +
                ", medidaBrazo=" + medidaBrazo +
                ", medidaCintura=" + medidaCintura +
                ", medidaPierna=" + medidaPierna +
                ", condicionMedica='" + condicionMedica + '\'' +
                ", medicamentos='" + medicamentos + '\'' +
                ", frecCardiaca='" + frecCardiaca + '\'' +
                ", nivelHidratacion='" + nivelHidratacion + '\'' +
                ", tipoHidratacion='" + tipoHidratacion + '\'' +
                ", nivelActividadFisica='" + nivelActividadFisica + '\'' +
                ", suplementos='" + suplementos + '\'' +
                '}';
    }
}