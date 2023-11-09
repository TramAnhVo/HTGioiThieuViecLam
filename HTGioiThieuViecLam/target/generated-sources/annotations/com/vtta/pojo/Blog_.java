package com.vtta.pojo;

import com.vtta.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-11-07T09:21:30")
@StaticMetamodel(Blog.class)
public class Blog_ { 

    public static volatile SingularAttribute<Blog, Date> createdDay;
    public static volatile SingularAttribute<Blog, Boolean> active;
    public static volatile SingularAttribute<Blog, Integer> id;
    public static volatile SingularAttribute<Blog, User> userId;
    public static volatile SingularAttribute<Blog, String> content;

}