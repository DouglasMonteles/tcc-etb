package modelo;

public class Menu {
    private int id;
    private String nome;
    private String link;
    private String icone;

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

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getIcone() {
        return icone;
    }

    public void setIcone(String icone) {
        this.icone = icone;
    }

    public Menu() {
    }

    public Menu(int id, String nome, String link, String icone) {
        this.id = id;
        this.nome = nome;
        this.link = link;
        this.icone = icone;
    }

    @Override
    public String toString() {
        return "Menu{" + "id=" + id + ", nome=" + nome + ", link=" + link + ", icone=" + icone + '}';
    }
    
    
}
