package dao;

import java.util.List;

import entity.Produit;


public class Test {
    public static void main(String[] args) {
        GestionProduit gestionProduit = new GestionProduit();
        
        Produit p1 = new Produit( 1 ,"BB", 22.0, 54);
        Produit p2 = new Produit( 2 ,"AA",11.0, 14);
        Produit p3 = new Produit(  3 ,"CC",82.0, 8);
        
        gestionProduit.adProduit(p1);
        gestionProduit.adProduit(p2);
        gestionProduit.adProduit(p3);
        
        List<Produit> Produits = gestionProduit.getAllProduit();
        System.out.println(Produits);
}
}