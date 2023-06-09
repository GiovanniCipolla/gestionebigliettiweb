package it.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.gestionebigliettiweb.model.Biglietto;
import it.gestionebigliettiweb.service.MyServiceFactory;
import it.gestionebigliettiweb.utility.UtilityBigliettoForm;

/**
 * Servlet implementation class ExecuteUpdateBigliettoServlet
 */
@WebServlet("/ExecuteUpdateBigliettoServlet")
public class ExecuteUpdateBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// BINDING
		String idDaPagina = request.getParameter("id");
		String provenienzaDaPagina = request.getParameter("provenienza");
		String destinazioneDaPagina = request.getParameter("destinazione");
		String prezzoDaPaginaString = request.getParameter("prezzo");
		String dataDaPagina = request.getParameter("data");
		Biglietto bigliettoInstance = UtilityBigliettoForm.createBigliettoFromParams(provenienzaDaPagina,
				destinazioneDaPagina, prezzoDaPaginaString, dataDaPagina);
		bigliettoInstance.setId(Long.parseLong(idDaPagina));

		// VALIDAZIONE
		if (!NumberUtils.isCreatable(idDaPagina)) {
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if (!UtilityBigliettoForm.validateBigliettoBean(bigliettoInstance) || !NumberUtils.isCreatable(idDaPagina)) {
			request.setAttribute("bigliettoDaAggiornare", bigliettoInstance);
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("/biglietto/update.jsp").forward(request, response);
			return;
		}

		// BUSINESS
		try {

			MyServiceFactory.getBigliettoServiceInstance().aggiorna(bigliettoInstance);
			request.setAttribute("listaBigliettiAttribute", MyServiceFactory.getBigliettoServiceInstance().lista());
		} catch (Exception e) {
			request.setAttribute("bigliettoDaAggiornare", bigliettoInstance);
			request.setAttribute("errorMessage", "Attenzione sono presenti errori di validazione");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}

		// FORWARD
		request.getRequestDispatcher("/biglietto/results.jsp").forward(request, response);
	}

}
