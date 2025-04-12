package dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import entity.Produit;

public class GestionProduitJPA implements IGestionProduit{
	
	EntityManagerFactory emf=Persistence.createEntityManagerFactory("catalogue");
	EntityManager em=emf.createEntityManager();

	@Override
	public void adProduit(Produit p) {
		// TODO Auto-generated method stub
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.persist(p);
		et.commit();
	}

	@Override
	public List<Produit> getAllProduit() {
		// TODO Auto-generated method stub
		Query q=em.createQuery("select p from Produit p");
		return q.getResultList();
	}

	@Override
	public List<Produit> getProduitsByMC(String mc) {
		// TODO Auto-generated method stub
		Query q=em.createQuery("select p from Produit p where p.nom like :x");
		q.setParameter("x", "%"+mc+"%");
				return q.getResultList();
	}

	@Override
	public Produit getProduit(int id) {
		// TODO Auto-generated method stub
		return em.find(Produit.class, id);
	}

	@Override
	public void deleteProduit(int id) {
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.remove(getProduit(id));
		et.commit();		
	}

	@Override
	public void updateProduit(Produit p) {
		// TODO Auto-generated method stub
		EntityTransaction et=em.getTransaction();
		et.begin();
		em.merge(p);
		et.commit();
	}

}
