package it.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.gestionebigliettiweb.model.Biglietto;
import it.gestionebigliettiweb.service.MyServiceFactory;
import it.gestionebigliettiweb.utility.UtilityBigliettoForm;

/**
 * Servlet implementation class ExecuteInsertBigliettoServlet
 */
@WebServlet("/ExecuteInsertBigliettoServlet")
public class ExecuteInsertBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ----------------BINDING
		String provenienzaInputParam = request.getParameter("provenienza");
		String destinazioneInputParam = request.getParameter("destinazione");
		String prezzoInputStringParam = request.getParameter("prezzo");
		String dataArrivoStringParam = request.getParameter("data");

		Biglietto bigliettoInstance = UtilityBigliettoForm.createBigliettoFromParams(provenienzaInputParam,
				destinazioneInputParam, prezzoInputStringParam, dataArrivoStringParam);
		
		
		// ----------------VALIDAZIONE
		if (!UtilityBigliettoForm.validateBigliettoBean(bigliettoInstance)) {
			request.setAttribute("insert_biglietto_attr", bigliettoInstance);
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("/biglietto/insert.jsp").forward(request, response);
			return;
		}
		
		
		
		// ----------------BUSINESS
		try {
			MyServiceFactory.getBigliettoServiceInstance().inserisciNuovo(bigliettoInstance);
			request.setAttribute("listaBigliettiAttribute", MyServiceFactory.getBigliettoServiceInstance().lista());
			request.setAttribute("successMessage", "Operazione effettuata con successo");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}

		
		
		
		// ----------------FORWARD
		request.getRequestDispatcher("/biglietto/results.jsp").forward(request, response);
		
	
	}

}
