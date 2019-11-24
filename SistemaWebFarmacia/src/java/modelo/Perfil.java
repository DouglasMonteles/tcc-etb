package modelo;

import java.util.ArrayList;

public class Perfil {
    private int id;
    private String nome;
    private String descricao;
    private ArrayList<Menu> menus;
    
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    public ArrayList<Menu> getMenus() {
        return menus;
    }

    public void setMenus(ArrayList<Menu> menus) {
        this.menus = menus;
    }
    
    public Perfil() {
    }

    public Perfil(int id, String nome, String descricao, ArrayList<Menu> menus) {
        this.id = id;
        this.nome = nome;
        this.descricao = descricao;
        this.menus = menus;
    }

    @Override
    public String toString() {
        return "Perfil{" + "id=" + id + ", nome=" + nome + ", descricao=" + descricao + ", menus=" + menus + '}';
    }

    
    
}
