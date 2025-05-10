package modelo;

public class Fornecedor {
    private int id;
    private String nome;
    private String cnpj;
    private String logo;
    private String localizacao;
    private String user;
    private String senha;
    private boolean status;

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

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
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
    
    public Fornecedor() {
    }

    public Fornecedor(int id, String nome, String cnpj, String logo, String localizacao, String user, String senha, boolean status) {
        this.id = id;
        this.nome = nome;
        this.cnpj = cnpj;
        this.logo = logo;
        this.localizacao = localizacao;
        this.user = user;
        this.senha = senha;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Fornecedor{" + "id=" + id + ", nome=" + nome + ", cnpj=" + cnpj + ", logo=" + logo + ", localizacao=" + localizacao + ", user=" + user + ", senha=" + senha + ", status=" + status + '}';
    }
    
}
