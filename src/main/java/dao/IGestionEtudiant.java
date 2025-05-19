package dao;

import java.util.List;
import entity.Etudiant;

public interface IGestionEtudiant {
    void ajouterEtudiant(Etudiant e);
    void modifierEtudiant(Etudiant e);
    void supprimerEtudiant(int id);
    Etudiant getEtudiant(int id);
    List<Etudiant> getAllEtudiants();
}
