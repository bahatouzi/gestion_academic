package dao;

import java.util.List;

import javax.persistence.*;

import entity.Etudiant;

public class GestionEtudiantJPA implements IGestionEtudiant {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("gestion_etudiants");
    private EntityManager em = emf.createEntityManager();

    @Override
    public void ajouterEtudiant(Etudiant e) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(e);
        tx.commit();
    }

    @Override
    public void modifierEtudiant(Etudiant e) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(e);
        tx.commit();
    }

    @Override
    public void supprimerEtudiant(int id) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        Etudiant e = em.find(Etudiant.class, id);
        if (e != null) em.remove(e);
        tx.commit();
    }

    @Override
    public Etudiant getEtudiant(int id) {
        return em.find(Etudiant.class, id);
    }

    @Override
    public List<Etudiant> getAllEtudiants() {
        return em.createQuery("SELECT e FROM Etudiant e", Etudiant.class).getResultList();
    }
}
