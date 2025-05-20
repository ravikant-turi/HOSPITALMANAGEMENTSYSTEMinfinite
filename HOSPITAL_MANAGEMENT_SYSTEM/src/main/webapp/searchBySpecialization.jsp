<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<f:view>
    <html>
        <head>
            <meta charset="UTF-8">
            <title>Add Doctor</title>
        </head>
        <body>
            <h2>Add Doctor</h2>

            <h:form>
                <div class="form-group">
                    <h:outputLabel for="specializations" value="Specializations" />
                    <h:inputText id="specializations" value="#{doctorController.specializations}" />
                    <h:commandButton value="Search" action="#{doctorController.fetchDoctors}" />
                </div>

                <!-- Data Table to show list of doctors -->
                <h:dataTable value="#{doctorController.doctorlist}" var="doctor" border="3">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Doctor Name" />
                        </f:facet>
                        <h:outputText value="#{doctor.doctorName}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Specialization" />
                        </f:facet>
                        <h:outputText value="#{doctor.specialization}" />
                    </h:column>

                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Status" />
                        </f:facet>
                        <h:outputText value="#{doctor.isStatus}" />
                    </h:column>
                    
                     <h:column>
                        <f:facet name="header">
                            <h:outputText value="location" />
                        </f:facet>
                        <h:outputText value="#{doctor.location}" />
                    </h:column>
                    
                     <h:column>
                        <f:facet name="header">
                            <h:outputText value="mobileNo" />
                        </f:facet>
                        <h:outputText value="#{doctor.mobileNo}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="doctorName" />
                        </f:facet>
                        <h:outputText value="#{doctor.doctorName}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="doctorId" />
                        </f:facet>
                        <h:outputText value="#{doctor.doctorId}" />
                    </h:column>
                </h:dataTable>
            </h:form>
        </body>
    </html>
</f:view>
