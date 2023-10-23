package com.vtta.pojo;

import com.vtta.pojo.Job;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-23T14:31:27")
@StaticMetamodel(Position.class)
public class Position_ { 

    public static volatile SingularAttribute<Position, String> name;
    public static volatile SingularAttribute<Position, Integer> id;
    public static volatile SetAttribute<Position, Job> jobSet;

}