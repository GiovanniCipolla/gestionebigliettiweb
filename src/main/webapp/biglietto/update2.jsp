<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<jsp:include page="../header.jsp" />
	<title>Update</title>
	<script>
	function validateForm() {
	  var provenienza = document.getElementById("provenienza").value;
	  var destinazione = document.getElementById("destinazione").value;
	  var prezzo = document.getElementById("prezzo").value;
	  var data = document.getElementById("data").value;

	  if (provenienza == "") {
	    document.getElementById("provenienza").classList.add("is-invalid");
	    document.getElementById("provenienza").focus();
	    return false;
	  } else {
	    document.getElementById("provenienza").classList.remove("is-invalid");
	  }

	  if (destinazione == "") {
	    document.getElementById("destinazione").classList.add("is-invalid");
	    document.getElementById("destinazione").focus();
	    return false;
	  } else {
	    document.getElementById("destinazione").classList.remove("is-invalid");
	  }

	  if (prezzo == "") {
	    document.getElementById("prezzo").classList.add("is-invalid");
	    document.getElementById("prezzo").focus();
	    return false;
	  } else {
	    document.getElementById("prezzo").classList.remove("is-invalid");
	  }

	  if (data == "") {
	    document.getElementById("data").classList.add("is-invalid");
	    document.getElementById("data").focus();
	    return false;
	  } else {
	    document.getElementById("data").classList.remove("is-invalid");
	  }

	  return true;
	}
	</script>
	<style>
	input:invalid {
	  border-color: red;
	}
	</style>
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
			  Esempio errore.
			  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" ></button>
			</div>
				  
			<h1>Aggiornamento biglietto</h1>
			
			<form method="post" action="UpdateServlet" onsubmit="return validateForm();">
				<input type="hidden" name="id" value="${biglietto.getId()}" />
				<div class="form-group">
					<label for="provenienza">Provenienza</label>
					<input type="text" class="form-control" id="provenienza" name="provenienza" value="${biglietto.getProvenienza()}" required>
					<div class="invalid-feedback">
           			Inserisci la provenienza.
        			</div>
				</div>
				<div class="form-group">
					<label for="destinazione">Destinazione</label>
					<input type="text" class="form-control" id="destinazione" name="destinazione" value="${biglietto.getDestinazione()}" required>
					<div class="invalid-feedback">
           			Inserisci la destinazione.
        			</div>
				</div>
				<div class="form-group">
					<label for="prezzo">Prezzo</label>
					<input type="number" class="form-control" id="prezzo" name="prezzo" value="${biglietto.getPrezzo()}" required>
					<div class="invalid-feedback">
           			Inserisci il prezzo.
        			</div>
				</div>
				<div class="form-group">
					<label for="data">Data</label>
					<input type="date" class="form-control" id="data" name="data" value="${biglietto.getData().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"))}" required>
					<div class="invalid-feedback">
            			Inserisci la data.
          			</div>
				</div>
				<button type="submit" class="btn btn-primary">Aggiorna</button>
			</form>
			  
		</div>
	</main>

	<jsp:include page="../footer.jsp"></jsp:include>
	
	<!-- Bootstrap core JavaScript -->
	<script src="../js/bootstrap.bundle.min.js"></script>
	
 </body>
</html>

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="it.gestionebigliettiweb.model.Biglietto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<!--   <script>
						  function validateForm() {
							  var provenienza = document.getElementById("provenienza").value;
							  var destinazione = document.getElementById("destinazione").value;
							  var prezzo = document.getElementById("prezzo").value;
							  var data = document.getElementById("data").value;

							  if (provenienza == "") {
								  provenienza.classList.add("is-invalid");
								  provenienza.focus();
							    return false;
							  } else {
								  provenienza.classList.remove("is-invalid");
							  }

							  if (destinazione == "") {
								  destinazione.classList.add("is-invalid");
								  destinazione.focus();
							    return false;
							  } else {
								  destinazione.classList.remove("is-invalid");
							  }

							  if (prezzo == "") {
								  prezzo.classList.add("is-invalid");
								  prezzo.focus();
							    return false;
							  } else {
								  prezzo.classList.remove("is-invalid");
							  }

							  if (data == "") {
								  data.classList.add("is-invalid");
								  data.focus();
							    return false;
							  } else {
								  data.classList.remove("is-invalid");
							  }

							  return true;
							}
							</script>-->
	<meta charset="ISO-8859-1">
	<jsp:include page="../header.jsp" />
	<title>Update</title>
	<style>
	input:invalid {
	  border-color: red;
	}
	</style>
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
										value="<c:out value="${bigliettoInPagina.provenienza}" />" required>
								</div>
							
								<div class="col-md-6">
									<label for="destinazione" class="form-label">Destinazione <span class="text-danger">*</span></label>
									<input type="text" name="destinazione" id="destinazione" class="form-control"   
										value="<c:out value="${bigliettoInPagina.destinazione}" />" required>
								</div>
							
								<div class="col-md-6">
									<label for="prezzo" class="form-label">Prezzo <span class="text-danger">*</span></label>
									<input type="number" class="form-control" name="prezzo" id="prezzo"  
									value="<c:out value="${bigliettoInPagina.prezzo}" />" required>
								</div>
								
								<div class="col-md-3">
									<label for="data" class="form-label">Data<span class="text-danger">*</span></label>
									<input class="form-control"  name="data" id="data" type="date"  title="formato : gg/mm/aaaa" 
										value="<c:out value="${bigliettoInPagina.data.format(DateTimeFormatter.ofPattern('dd/MM/yyyy'))}" />" required/>
								</div>
								
							<div class="col-12">
							<input type="hidden" name="id" value="<c:out value="${bigliettoInPagina.id}" />">
								<button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Modifica</button>
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