<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
 <script>
	function validateForm() {
		var provenienza = document.getElementById("provenienza");
		var destinazione = document.getElementById("destinazione");
		var prezzo = document.getElementById("prezzo");
		var data = document.getElementById("data");
		var formIsValid = true;

		if (provenienza.value === "") {
			provenienza.classList.add("is-invalid");
			formIsValid = false;
		} else {
			provenienza.classList.remove("is-invalid");
		}

		if (destinazione.value === "") {
			destinazione.classList.add("is-invalid");
			formIsValid = false;
		} else {
			destinazione.classList.remove("is-invalid");
		}

		if (prezzo.value === "") {
			prezzo.classList.add("is-invalid");
			formIsValid = false;
		} else {
			prezzo.classList.remove("is-invalid");
		}

		if (data.value === "") {
			data.classList.add("is-invalid");
			formIsValid = false;
		} else {
			data.classList.remove("is-invalid");
		}

		return formIsValid;
	}
	</script> 
	<meta charset="ISO-8859-1">
	<jsp:include page="../header.jsp" />
	<title>Update</title>
</head>
 <body class="d-flex flex-column h-100">
	   
	   		<!-- Fixed navbar -->
	   		<jsp:include page="../navbar.jsp"></jsp:include>
	    
			
			<!-- Begin page content -->
			<main class="flex-shrink-0">
			  <div class="container">
			  
			  		<div class="alert alert-danger alert-dismissible fade show ${errorMessage==null?'d-none':'' }" role="alert">
					  ${errorMessage}
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
					<div class="alert alert-danger alert-dismissible fade show d-none" role="alert">
					  Esempio di operazione fallita!
					  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
					<div class="alert alert-info alert-dismissible fade show d-none" role="alert">
					  Aggiungere d-none nelle class per non far apparire
					   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
					</div>
			  
			  <div class='card'>
				    <div class='card-header'>
				        <h5>Modifica l'elemento selezionato</h5> 
				    </div>
				    <div class='card-body'>
		
							<h6 class="card-title">I campi con <span class="text-danger">*</span> sono obbligatori</h6>
		
		
							<form method="post" action="ExecuteUpdateBigliettoServlet" class="row g-3" novalidate="novalidate" >
							
								<c:set var="bigliettoInPagina" value="${requestScope.bigliettoDaAggiornare}" />
							
								<div class="col-md-6">
									<label for="provenienza" class="form-label">Provenienza <span class="text-danger">*</span></label>
									<input type="text" name="provenienza" id="provenienza" class="form-control"
										value="<c:out value="${not empty bigliettoInPagina.provenienza ? bigliettoInPagina.provenienza : ''}" />" required>
								<div class="invalid-feedback">
									Campo obbligatorio
								</div>
								</div>
							
								<div class="col-md-6">
									<label for="destinazione" class="form-label">Destinazione <span class="text-danger">*</span></label>
									<input type="text" name="destinazione" id="destinazione" class="form-control"   
										value="<c:out value="${not empty bigliettoInPagina.destinazione ? bigliettoInPagina.destinazione : ''}" />" required>
								<div class="invalid-feedback">
									Campo obbligatorio
								</div>
								</div>
							
								<div class="col-md-6">
									<label for="prezzo" class="form-label">Prezzo <span class="text-danger">*</span></label>
									<input type="number" class="form-control" name="prezzo" id="prezzo"  
									value="<c:out value="${not empty bigliettoInPagina.prezzo ? bigliettoInPagina.prezzo : ''}" />" required>
								<div class="invalid-feedback">
									Campo obbligatorio
								</div>
								</div>
								
								<div class="col-md-3">
									<label for="data" class="form-label">Data<span class="text-danger">*</span></label>
									<input class="form-control"  name="data" id="data" type="date"  title="formato : gg/mm/aaaa" 
										value="<c:out value="${not empty bigliettoInPagina.data ? bigliettoInPagina.data.format(DateTimeFormatter.ofPattern('yyyy-MM-dd')) : ''}" />" required/>
								<div class="invalid-feedback">
									Campo obbligatorio
								</div>
								</div>
								
							<div class="col-12">
							<input type="hidden" name="id" value="<c:out value="${bigliettoInPagina.id}" />">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary" onclick="return validateForm()">Modifica</button>
							</div>
		
						</form>
  
				    
				    
					<!-- end card-body -->			   
				    </div>
				<!-- end card -->
				</div>		
					  
			    
			  <!-- end container -->  
			  </div>
			  
			</main>
			
			<!-- Footer -->
			<jsp:include page="../footer.jsp" />
	  </body>
</html>