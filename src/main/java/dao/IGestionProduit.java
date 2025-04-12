package dao;

import java.util.List;
import entity.Produit;

public interface IGestionProduit {
	
	public void adProduit(Produit p);
	public List<Produit> getAllProduit();
	public List<Produit> getProduitsByMC(String mc);
	public Produit getProduit(int id);
	public void deleteProduit(int id);
	public void updateProduit(Produit p);

}
