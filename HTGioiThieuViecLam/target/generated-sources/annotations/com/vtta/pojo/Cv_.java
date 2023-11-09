package com.vtta.pojo;

import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-11-07T09:21:30")
@StaticMetamodel(Cv.class)
public class Cv_ { 

    public static volatile SingularAttribute<Cv, Job> jobId;
    public static volatile SingularAttribute<Cv, String> cv;
    public static volatile SingularAttribute<Cv, Date> dayApply;
    public static volatile SingularAttribute<Cv, Boolean> active;
    public static volatile SingularAttribute<Cv, Integer> id;
    public static volatile SingularAttribute<Cv, User> userId;
    public static volatile SingularAttribute<Cv, String> content;

}