<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Homepage for normal user</title>

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
	
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Launch my idea!</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">Accueil <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">Mes id�es</a></li>
	      </ul>
	      <form class="navbar-form navbar-left" role="search" method="POST" action="searchIdea">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Rechercher une id�e">
	        </div>
	        <button type="submit" class="btn btn-default">Rechercher</button>
	      </form>
	      <form class="navbar-form navbar-right" method="GET" action="/user/addIdea">
	      <div class="form-group">
	      	<button type="submit" class="btn btn-success">Proposer mon id�e</button>
	      </div>
	      </form>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	
	<div class="page-header">
	   <h1>${idea.name} <small>propos�e par ${creator.prenom} ${creator.nom} le ${idea.proposedDate}</small></h1>
	</div>
	<h2>Description</h2>
	<p>${idea.shortDescription}</p>
	
	<h4>Montant demand� : ${idea.fundingRequested} euros</h4>
	
	<h2>Notes</h2>
	<c:choose>
		<c:when test="${not empty feasibility}">
			<p>Faisabilit� : ${feasibility}</p>
			<p>Int�r�t du march� : ${marketInterest}</p>
			<p>Impact : ${impact}</p>
			<p>Note moyenne : ${mean}</p>
		</c:when>
		<c:otherwise>
		<p>Aucune notes n'a �t� donn�e</p>
		</c:otherwise> 
	</c:choose>
	
	<h2>Commentaires</h2>
	<c:choose>
		<c:when test="${not empty comments}">
			<c:forEach var="entry" items="${comments}">
			  <h3>Post� par ${entry.value.prenom} ${entry.value.nom} le ${entry.key.commentDate}</h3>
			  <p>${entry.key.description}</p>
			</c:forEach>
		</c:when>
		<c:otherwise>
		<p>Aucun commentaire n'a �t� post�</p>
		</c:otherwise> 
	</c:choose>

</body>
</html>