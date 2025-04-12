package entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Produit {
	
	private double prix;
	@Id @GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	private String nom;
	private int quanite;
	
	public Produit(int id, String nom, double prix, int quanite) {
		super();
		this.id = id;
		this.nom = nom;
		this.prix = prix;
		this.quanite = quanite;
	}
	
	public Produit(String nom, double prix, int quanite) {
        this.nom = nom;
        this.prix = prix;
        this.quanite = quanite;
    }
	
	public Produit() {
		super();
		// TODO Auto-generated constructor stub
	}


	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public int getQuanite() {
		return quanite;
	}
	public void setQuanite(int quanite) {
		this.quanite = quanite;
	}
	
	@Override
	public String toString() {
		return "Produit [prix=" + prix + ", id=" + id + ", nom=" + nom + ", quanite=" + quanite + "]";
	}
	
	
	
	

}
