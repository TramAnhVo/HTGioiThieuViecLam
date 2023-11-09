/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.vtta.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author TramAnh
 */
@Entity
@Table(name = "job")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Job.findAll", query = "SELECT j FROM Job j"),
    @NamedQuery(name = "Job.findById", query = "SELECT j FROM Job j WHERE j.id = :id"),
    @NamedQuery(name = "Job.findByTitle", query = "SELECT j FROM Job j WHERE j.title = :title"),
    @NamedQuery(name = "Job.findByCreateDay", query = "SELECT j FROM Job j WHERE j.createDay = :createDay"),
    @NamedQuery(name = "Job.findByOutOfDay", query = "SELECT j FROM Job j WHERE j.outOfDay = :outOfDay"),
    @NamedQuery(name = "Job.findByExperience", query = "SELECT j FROM Job j WHERE j.experience = :experience"),
    @NamedQuery(name = "Job.findBySalary", query = "SELECT j FROM Job j WHERE j.salary = :salary")})
public class Job implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    
    @Basic(optional = false)
    @NotNull(message = "{job.title.notNullMsg}")
    @Size(min = 5, max = 255, message = "{job.title.lenErrMsg}")
    @Column(name = "title")
    private String title;
    
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 5, max = 2147483647, message = "{job.description.lenErrMsg}")
    @Column(name = "description")
    private String description;
    
    @Basic(optional = false)
    @NotNull
    @Lob
    @Size(min = 5, max = 2147483647, message = "{job.requirement.lenErrMsg}")
    @Column(name = "requirement")
    private String requirement;
    
    @Column(name = "create_day")
    @Temporal(TemporalType.DATE)
    private Date createDay;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "out_of_day")
    @Temporal(TemporalType.DATE)
    private Date outOfDay;
    @Size(max = 45)
    
    @Column(name = "experience")
    private String experience;
    @Size(max = 255)
    @Column(name = "salary")
    private String salary;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "jobId")
    @JsonIgnore
    private Set<Cv> cvSet;
        
    @JoinColumn(name = "company_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Company companyId;
    
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Location locationId;
    
    @JoinColumn(name = "major_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Major majorId;
    
    @JoinColumn(name = "position_id", referencedColumnName = "id")
    @ManyToOne
    private Position positionId;

    public Job() {
    }

    public Job(Integer id) {
        this.id = id;
    }

    public Job(Integer id, String title, String description, String requirement) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.requirement = requirement;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public Date getCreateDay() {
        return createDay;
    }

    public void setCreateDay(Date createDay) {
        this.createDay = createDay;
    }

    public Date getOutOfDay() {
        return outOfDay;
    }

    public void setOutOfDay(Date outOfDay) {
        this.outOfDay = outOfDay;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    @XmlTransient
    public Set<Cv> getCvSet() {
        return cvSet;
    }

    public void setCvSet(Set<Cv> cvSet) {
        this.cvSet = cvSet;
    }

    public Company getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Company companyId) {
        this.companyId = companyId;
    }

    public Location getLocationId() {
        return locationId;
    }

    public void setLocationId(Location locationId) {
        this.locationId = locationId;
    }

    public Major getMajorId() {
        return majorId;
    }

    public void setMajorId(Major majorId) {
        this.majorId = majorId;
    }

    public Position getPositionId() {
        return positionId;
    }

    public void setPositionId(Position positionId) {
        this.positionId = positionId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Job)) {
            return false;
        }
        Job other = (Job) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.vtta.pojo.Job[ id=" + id + " ]";
    }
    
}
