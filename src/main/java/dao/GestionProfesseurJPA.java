package dao;

import entity.Professeur;

import javax.persistence.*;
import java.util.List;

public class GestionProfesseurJPA implements IGestionProfesseur {
    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("gestion_etudiants");
    private EntityManager em = emf.createEntityManager();

    @Override
    public void ajouterProfesseur(Professeur p) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(p);
        tx.commit();
    }

    @Override
    public void modifierProfesseur(Professeur p) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(p);
        tx.commit();
    }

    @Override
    public void supprimerProfesseur(int id) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        Professeur p = em.find(Professeur.class, id);
        if (p != null) em.remove(p);
        tx.commit();
    }

    @Override
    public Professeur getProfesseur(int id) {
        return em.find(Professeur.class, id);
    }

    @Override
    public List<Professeur> getAllProfesseurs() {
        return em.createQuery("SELECT p FROM Professeur p", Professeur.class).getResultList();
    }
}
