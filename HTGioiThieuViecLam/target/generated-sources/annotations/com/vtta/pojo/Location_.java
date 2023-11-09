package com.vtta.pojo;

import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-11-07T09:21:30")
@StaticMetamodel(Location.class)
public class Location_ { 

    public static volatile SingularAttribute<Location, String> name;
    public static volatile SingularAttribute<Location, Integer> id;
    public static volatile SetAttribute<Location, User> userSet;
    public static volatile SetAttribute<Location, Job> jobSet;

}