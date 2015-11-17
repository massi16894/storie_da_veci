/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.io.Serializable;

public class Categoria implements Serializable {
    
    private String id;
    private String nome;
    private String colore;

    
    
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }    
    
    public String getNome() {
        return nome;
    }

    
    public void setNome(String nome) {
        this.nome = nome;
    }
    
    
    public String getColore() {
        return colore;
    }

    
    public void setColore(String colore) {
        this.colore = colore;
    }
    
    
}
