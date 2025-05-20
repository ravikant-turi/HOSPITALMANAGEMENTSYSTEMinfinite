
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

   
   <h:form>

        <h:outputLabel for="tests" value="Tests:" />
        <h:inputText id="tests" value="#{medicationHistoryController.medicationHistory.tests}" />
        <br/><br/>

        <h:outputLabel for="medicines" value="Medicines:" />
        <h:inputText id="medicines" value="#{medicationHistoryController.medicationHistory.medicines}" />
        <br/><br/>

        

        <h:outputLabel for="medId" value="Med ID:" />
        <h:inputText id="medId" value="#{medicationHistoryController.medicationHistory.medId}" />
        <br/><br/>

        <h:commandButton value="Add Medical History"
                         action="#{medicationHistoryController.addMedicalHistoryController}" />

    </h:form>


</body>
		</html>
	</f:view>
</center>