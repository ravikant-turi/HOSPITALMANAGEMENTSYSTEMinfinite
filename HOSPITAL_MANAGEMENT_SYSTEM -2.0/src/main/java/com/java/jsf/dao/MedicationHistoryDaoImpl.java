package com.java.jsf.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;

import com.java.jsf.model.MedicationHistory;
import com.java.jsf.model.Patient;
import com.java.jsf.util.SessionHelper;

public class MedicationHistoryDaoImpl implements MedicationHistoryDao{
      
	
	SessionFactory sessionFactory;
	Session session;
	
//	@Override
//	public String addMedicalHistory(MedicationHistory medicationHistory) {
//		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
//		Session session = sessionFactory.openSession();
//          Transaction transaction = session.beginTransaction();
//         
//          Patient patient=new Patient();
//          patient.setPatientId("PTH622");
//        medicationHistory.setPatient(patient);
//        session.save(medicationHistory);
//
//       
//        transaction.commit();
//        
//		return "MainMenu.jsp?faces-redirect=true";
//	}
//	
	@Override
	public String addMedicalHistory(MedicationHistory medHistory) {
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		String medId = getNextMedId(session);
		medHistory.setMedId(medId);
		Transaction tx = session.beginTransaction();
		session.save(medHistory);
		tx.commit();
		return "MedicalHistoryMenu.jsp?faces-redirect=true";
	}
	
	public static String getNextMedId(Session session) {
		String prefix = "MHD";
		String sql = "select max(medId) from MedicationHistory";
		String maxId = (String) session.createQuery(sql).uniqueResult();
		
		if(maxId == null) {
			return prefix + "0001";
		}
		
		int id = Integer.parseInt(maxId.substring(prefix.length()));
		id++;
		
		return String.format("%s%03d", prefix,id);
	}

	@Override
	public List<MedicationHistory> getPatientMedicalHistoryByPatientId(String patientId) {
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
          Transaction transaction = session.beginTransaction();
         
//          Query query = session.createQuery("from medicationhistory where patient.patientId = :patientId");
          Query query = session.createQuery("from MedicationHistory where patient.patientId = :patientId");

          query.setParameter("patientId", patientId);
          transaction.commit();
          return query.list();
          
        
	}

	@Override
	public List<MedicationHistory> getAllMedicationHistories() {
       
		SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
          Transaction transaction = session.beginTransaction();
		
		return null;
	}
  
	
}
