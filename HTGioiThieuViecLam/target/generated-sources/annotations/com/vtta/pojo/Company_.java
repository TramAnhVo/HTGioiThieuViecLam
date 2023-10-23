package com.vtta.pojo;

import com.vtta.pojo.Comment;
import com.vtta.pojo.Job;
import com.vtta.pojo.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-10-23T14:31:27")
@StaticMetamodel(Company.class)
public class Company_ { 

    public static volatile SingularAttribute<Company, String> image;
    public static volatile SingularAttribute<Company, String> address;
    public static volatile SetAttribute<Company, Comment> commentSet;
    public static volatile SingularAttribute<Company, String> link;
    public static volatile SingularAttribute<Company, String> name;
    public static volatile SingularAttribute<Company, String> description;
    public static volatile SingularAttribute<Company, Integer> id;
    public static volatile SetAttribute<Company, User> userSet;
    public static volatile SingularAttribute<Company, String> establish;
    public static volatile SetAttribute<Company, Job> jobSet;
    public static volatile SingularAttribute<Company, String> email;

}