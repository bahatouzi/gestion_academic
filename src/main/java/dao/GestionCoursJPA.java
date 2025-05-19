package dao;

import entity.Cours;

import javax.persistence.*;
import java.util.List;

public class GestionCoursJPA implements IGestionCours {
    private EntityManagerFactory emf;
    private EntityManager em;

    public GestionCoursJPA() {
        emf = Persistence.createEntityManagerFactory("gestion_etudiants");
        em = emf.createEntityManager();
    }

    public void ajouterCours(Cours cours) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.persist(cours);
        tx.commit();
    }

    public void modifierCours(Cours cours) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        em.merge(cours);
        tx.commit();
    }

    public void supprimerCours(int id) {
        EntityTransaction tx = em.getTransaction();
        tx.begin();
        Cours cours = em.find(Cours.class, id);
        if (cours != null) {
            em.remove(cours);
        }
        tx.commit();
    }

    public Cours getCours(int id) {
        return em.find(Cours.class, id);
    }

    public List<Cours> getAllCours() {
        return em.createQuery("SELECT c FROM Cours c", Cours.class).getResultList();
    }

}
