package it.gestionebigliettiweb.dao;

import java.util.List;

import it.gestionebigliettiweb.model.Biglietto;

public interface BigliettoDAO extends IBaseDAO<Biglietto> {
	public List<Biglietto> findByExample(Biglietto example) throws Exception;
}
