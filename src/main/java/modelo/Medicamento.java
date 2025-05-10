package modelo;

import java.util.Date;

public class Medicamento {
    private int id;
    private String nome;
    private Date dataFabricacao;
    private Date dataValidade;
    private String indicacao;
    private String precaucoes;
    private Double preco;
    private int lote;
    private String obs;
    private String laboratorio;
    private String composicao;
    private String file;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Date getDataFabricacao() {
        return dataFabricacao;
    }

    public void setDataFabricacao(Date dataFabricacao) {
        this.dataFabricacao = dataFabricacao;
    }

    public Date getDataValidade() {
        return dataValidade;
    }

    public void setDataValidade(Date dataValidade) {
        this.dataValidade = dataValidade;
    }

    public String getIndicacao() {
        return indicacao;
    }

    public void setIndicacao(String indicacao) {
        this.indicacao = indicacao;
    }

    public String getPrecaucoes() {
        return precaucoes;
    }

    public void setPrecaucoes(String precaucoes) {
        this.precaucoes = precaucoes;
    }

    public Double getPreco() {
        return preco;
    }

    public void setPreco(Double preco) {
        this.preco = preco;
    }

    public int getLote() {
        return lote;
    }

    public void setLote(int lote) {
        this.lote = lote;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }

    public String getLaboratorio() {
        return laboratorio;
    }

    public void setLaboratorio(String laboratorio) {
        this.laboratorio = laboratorio;
    }

    public String getComposicao() {
        return composicao;
    }

    public void setComposicao(String composicao) {
        this.composicao = composicao;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public Medicamento(int id, String nome, Date dataFabricacao, Date dataValidade, String indicacao, String precaucoes, Double preco, int lote, String obs, String laboratorio, String composicao, String file) {
        this.id = id;
        this.nome = nome;
        this.dataFabricacao = dataFabricacao;
        this.dataValidade = dataValidade;
        this.indicacao = indicacao;
        this.precaucoes = precaucoes;
        this.preco = preco;
        this.lote = lote;
        this.obs = obs;
        this.laboratorio = laboratorio;
        this.composicao = composicao;
        this.file = file;
    }
    
    public Medicamento() {
    }

    @Override
    public String toString() {
        return "Medicamento{" + "file=" + file + '}';
    }
    
    
    
}
