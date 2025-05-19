package dao;

import entity.Professeur;
import java.util.List;

public interface IGestionProfesseur {
    void ajouterProfesseur(Professeur p);
    void modifierProfesseur(Professeur p);
    void supprimerProfesseur(int id);
    Professeur getProfesseur(int id);
    List<Professeur> getAllProfesseurs();
}
