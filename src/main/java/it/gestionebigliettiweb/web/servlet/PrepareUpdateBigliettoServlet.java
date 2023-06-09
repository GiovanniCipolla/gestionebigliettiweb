package it.gestionebigliettiweb.web.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.math.NumberUtils;

import it.gestionebigliettiweb.service.MyServiceFactory;


/**
 * Servlet implementation class PrepareUpdateBigliettoServlet
 */
@WebServlet("/PrepareUpdateBigliettoServlet")
public class PrepareUpdateBigliettoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//BINDING
		String parametroId = request.getParameter("idBiglietto");
		Long idDaAggionnare = Long.parseLong(parametroId);
		
		//VALIDAZIONE
		if (!NumberUtils.isCreatable(parametroId)) {
			// qui ci andrebbe un messaggio nei file di log costruito ad hoc se fosse attivo
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		//BUSINESS
		try {
			request.setAttribute("bigliettoDaAggiornare",
					MyServiceFactory.getBigliettoServiceInstance().caricaSingoloElemento(idDaAggionnare));
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Attenzione si è verificato un errore.");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		
		
		//FORWARD
		request.getRequestDispatcher("/biglietto/update.jsp").forward(request, response);
	}


}
