package com.java.jsf.dao;

import java.util.List;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import com.java.jsf.model.Doctor;
import com.java.jsf.model.Patient;

public class PatientDaoImpl implements PatientDao {
	SessionFactory sessionFactory;
	Session session;
	
	@Override
	public Patient searchPatientId(String patientId) {
		
		sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
	    session = sessionFactory.openSession();

//	    Query query = session.createQuery("from Patient where patientId = :pid");
	    Query query = session.createQuery(
	            "from Patient p join fetch p.doctor where p.patientId = :pid"
	        );
	    query.setParameter("pid", patientId);

	    Patient patient = (Patient) query.uniqueResult();

	    session.close(); // good practice
	    return patient;
		}
	
	
	// Fetch patients by doctorId
    public List<Patient> getPatientsByDoctorId(String doctorId) {
        sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        session = sessionFactory.openSession();
        Query query = session.createQuery("from Patient where doctor.doctorId = :doctorId");
        query.setParameter("doctorId", doctorId);
        return query.list();
    }
    
    @Override
    public String createPatientData(Patient patient) {
    	SessionFactory sf = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sf.openSession();
        Transaction tx = session.beginTransaction();

        // Fetch doctor
        Doctor doctor = (Doctor) session.get(Doctor.class, patient.getDoctor().getDoctorId());
        if (doctor == null) {
            FacesContext.getCurrentInstance().addMessage(null,
                new FacesMessage(FacesMessage.SEVERITY_ERROR, "Doctor not found with ID: " + patient.getDoctor().getDoctorId(), null));
            session.close();
            return null;
            
        }

        // Generate patient ID (if needed)
        String newPatientId = getNextPatientId(session);
        patient.setPatientId(newPatientId);
        patient.setDoctor(doctor); // set doctor reference

        session.save(patient);
        tx.commit();
        session.close();
        return "MainMenu.jsp?faces-redirect=true";
    }
    
    public static String getNextPatientId(Session session) {
        String prefix = "PTH";
        String sql = "select max(patientId) from Patient";
        String maxId = (String) session.createQuery(sql).uniqueResult();

        if (maxId == null) {
            return prefix + "001";
        }

        int number = Integer.parseInt(maxId.substring(prefix.length()));
        number++;

        return String.format("%s%03d", prefix, number);
    }

    
    
	

}
