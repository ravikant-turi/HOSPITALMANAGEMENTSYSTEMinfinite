
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<center>
	<f:view>
		<html>
		<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<h2>Search by id</h2>

	<h:form>
		<div class="form-group">
			<h:outputLabel for="patientId" value="patientId" />
			<h:inputText id="patientId" value="#{medicationHistoryController.patientId}" />
			<h:commandButton value="Search"
				action="#{medicationHistoryController.getPatientMedicalHistoryByPatientIdController}" />
		</div>

		<!-- Data Table to show list of doctors -->
		<h:dataTable value="#{medicationHistoryController.medicationHistoryList}" var="medical"
			border="3">

			<h:column>
				<f:facet name="header">
					<h:outputText value="Doctor Name" />
				</f:facet>
				<h:outputText value="#{medical.medId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputText value="Specialization" />
				</f:facet>
				<h:outputText value="#{medical.medicines}" />
			</h:column>

			

			<h:column>
				<f:facet name="header">
					<h:outputText value="location" />
				</f:facet>
				<h:outputText value="#{medical.tests}" />
			</h:column>

			
		</h:dataTable>
	</h:form>
</body>
		</html>

	</f:view>
</center>