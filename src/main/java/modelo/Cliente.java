package modelo;

public class Cliente {
    private int id;
    private String nome;
    private String sobrenome;
    private String cpf;
    private String telCelular;
    private String telFixo;
    private String email;
    private String cidade;
    private String logradouro;
    private int casa;
    private int apto;
    private String senha;
    private boolean status;
    private Imagem imagem;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Imagem getImagem() {
        return imagem;
    }

    public void setImagem(Imagem imagem) {
        this.imagem = imagem;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }
    
    public String getTelCelular() {
        return telCelular;
    }

    public void setTelCelular(String telCelular) {
        this.telCelular = telCelular;
    }

    public String getTelFixo() {
        return telFixo;
    }

    public void setTelFixo(String telFixo) {
        this.telFixo = telFixo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getLogradouro() {
        return logradouro;
    }

    public void setLogradouro(String logradouro) {
        this.logradouro = logradouro;
    }

    public int getCasa() {
        return casa;
    }

    public void setCasa(int casa) {
        this.casa = casa;
    }

    public int getApto() {
        return apto;
    }

    public void setApto(int apto) {
        this.apto = apto;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Cliente() {
    }

    public Cliente(int id, String nome, String sobrenome, String cpf, String telCelular, String telFixo, String email, String cidade, String logradouro, int casa, int apto, String senha, boolean status) {
        this.id = id;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.cpf = cpf;
        this.telCelular = telCelular;
        this.telFixo = telFixo;
        this.email = email;
        this.cidade = cidade;
        this.logradouro = logradouro;
        this.casa = casa;
        this.apto = apto;
        this.senha = senha;
        this.status = status;
    }

    
}
