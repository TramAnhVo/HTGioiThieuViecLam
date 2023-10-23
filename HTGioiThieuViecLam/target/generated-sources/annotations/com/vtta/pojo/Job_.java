package com.vtta.pojo;

import com.vtta.pojo.Company;
import com.vtta.pojo.Cv;
import com.vtta.pojo.Location;
import com.vtta.pojo.Major;
import com.vtta.pojo.Position;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-23T14:31:27")
@StaticMetamodel(Job.class)
public class Job_ { 

    public static volatile SingularAttribute<Job, Date> outOfDay;
    public static volatile SingularAttribute<Job, Major> majorId;
    public static volatile SetAttribute<Job, Cv> cvSet;
    public static volatile SingularAttribute<Job, String> description;
    public static volatile SingularAttribute<Job, Date> createDay;
    public static volatile SingularAttribute<Job, String> requirement;
    public static volatile SingularAttribute<Job, String> title;
    public static volatile SingularAttribute<Job, String> experience;
    public static volatile SingularAttribute<Job, String> salary;
    public static volatile SingularAttribute<Job, Company> companyId;
    public static volatile SingularAttribute<Job, Position> positionId;
    public static volatile SingularAttribute<Job, Location> locationId;
    public static volatile SingularAttribute<Job, Integer> id;

}