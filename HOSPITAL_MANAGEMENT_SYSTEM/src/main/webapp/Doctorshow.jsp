
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
<center>
	<f:view>
		<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Show Doctors</title>
</head>
<body>
	<h:form>
		<center>
			<h2>
				<h:outputText value="Doctor Records" />
			</h2>
		</center>

		<h:dataTable value="#{doctorController.showDoctors()}" var="doc"
			border="3">
			border="3" cellpadding="5" cellspacing="0">

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Doctor ID" />
				</f:facet>
				<h:outputText value="#{doc.doctorId}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Doctor Name" />
				</f:facet>
				<h:outputText value="#{doc.doctorName}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Specialization" />
				</f:facet>
				<h:outputText value="#{doc.specialization}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Location" />
				</f:facet>
				<h:outputText value="#{doc.location}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Mobile No" />
				</f:facet>
				<h:outputText value="#{doc.mobileNo}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Status" />
				</f:facet>
				<h:outputText value="#{doc.isStatus}" />
			</h:column>

			<h:column>
				<f:facet name="header">
					<h:outputLabel value="Actions" />
				</f:facet>
				<h:commandButton value="Search Doctor"
					action="#{doctorController.searchDoctor(doc.doctorId)}" />
			</h:column>

		</h:dataTable>
	</h:form>
</body>
		</html>
	</f:view>
</center>
