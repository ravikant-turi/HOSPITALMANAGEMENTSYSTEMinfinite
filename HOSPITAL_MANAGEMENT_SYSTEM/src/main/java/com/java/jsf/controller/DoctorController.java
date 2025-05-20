package com.java.jsf.controller;

import java.util.List;

import com.java.jsf.dao.DoctorDao;
import com.java.jsf.model.Doctor;

public class DoctorController {
	
	private DoctorDao doctordao=null;
	
	private Doctor doctor=null;
	
	private List<Doctor> doctorlist=null;
	
	private String specializations="";
	
	private String doctorId="";
	
	
	
	

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public String getSpecializations() {
		return specializations;
	}

	public void setSpecializations(String specializations) {
		this.specializations = specializations;
	}

	public List<Doctor> getDoctorlist() {
		return doctorlist;
	}

	public void setDoctorlist(List<Doctor> doctorlist) {
		this.doctorlist = doctorlist;
	}

	public DoctorDao getDoctordao() {
		return doctordao;
	}

	public void setDoctordao(DoctorDao doctordao) {
		this.doctordao = doctordao;
	}
	
	
	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public String addDoctors(Doctor doctor) {
		return doctordao.addDoctor(doctor);
	}
	
	public List<Doctor> searchBySpecilization(String specialization) {
        doctorlist = doctordao.getDoctorListByDept(specialization);
        return doctorlist;
    }

    // ✅ Add this method for JSF page search button
	public String fetchDoctors() {
        this.doctorlist = searchBySpecilization(specializations);
        return null;
    }
	
	public String getDoctorById() {
		
		doctor=doctordao.SearchByDoctorsID(doctorId);
		
		if(doctor!=null) {
			return "doctorSearchById";
		}
		return "notFoundError";
	}

	

}
