package dao;

import java.util.List;
import entity.Cours;

public interface IGestionCours {
    void ajouterCours(Cours e);
    void modifierCours(Cours e);
    void supprimerCours(int id);
    Cours getCours(int id);
    List<Cours> getAllCours();
}
