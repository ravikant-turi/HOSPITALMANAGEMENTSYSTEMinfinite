<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>
 
<center>
<f:view>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Add Doctor</title>
        <style>
            body { font-family: Arial; background-color: #f0f8ff; padding: 40px; }
            .form-group { margin-bottom: 15px; }
            label { display: block; font-weight: bold; }
            input, select { width: 300px; padding: 8px; }
        </style>
    </head>
    <body>
        <%-- <jsp:include page="Menu.jsp" />--%>
 
        <h2>Add Doctor</h2>
 
        <h:form>
           <%-- <div class="form-group">
                <h:outputLabel for="doctorId" value="Doctor ID" />
                <h:inputText id="doctorId" value="#{doctor.doctorId}" />
            </div>--%>
 
            <div class="form-group">
                <h:outputLabel for="doctorName" value="Doctor Name" />
                <h:inputText id="doctorName" value="#{doctor.doctorName}" />
            </div>
 
            <div class="form-group">
                <h:outputLabel for="specialization" value="Specialization" />
                <h:selectOneMenu id="specialization" value="#{doctor.specialization}">
                    <f:selectItem itemLabel="--Select--" itemValue="" />
                    <f:selectItem itemLabel="HEART" itemValue="HEART" />
                    <f:selectItem itemLabel="SKIN" itemValue="SKIN" />
                    <f:selectItem itemLabel="GENERAL" itemValue="GENERAL" />
                    <f:selectItem itemLabel="KIDNEY" itemValue="KIDNEY" />
                </h:selectOneMenu>
            </div>
 
            <div class="form-group">
                <h:outputLabel for="location" value="Location" />
                <h:inputText id="location" value="#{doctor.location}" />
            </div>
 
            <div class="form-group">
                <h:outputLabel for="mobileNo" value="Mobile No" />
                <h:inputText id="mobileNo" value="#{doctor.mobileNo}" />
            </div>
 
            <div class="form-group">
                <h:outputLabel for="isStatus" value="Status" />
                <h:selectOneMenu id="isStatus" value="#{doctor.isStatus}">
                    <f:selectItem itemLabel="--Select--" itemValue="" />
                    <f:selectItem itemLabel="ACTIVE" itemValue="ACTIVE" />
                    <f:selectItem itemLabel="INACTIVE" itemValue="INACTIVE" />
                </h:selectOneMenu>
            </div>
 
            <div class="form-group">
                <h:commandButton value="Add Doctor" action="#{doctorController.addDoctors(doctor)}" />
            </div>
        </h:form>
    </body>
</html>
</f:view>
</center>