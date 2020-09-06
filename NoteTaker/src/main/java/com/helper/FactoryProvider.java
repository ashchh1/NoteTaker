package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    private static SessionFactory factory;
    
    public  static SessionFactory getFactory(){
        if(factory==null){
            factory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
        }
        return factory;
    }
    public static void closeFactory(){
        if(factory.isOpen()){
            factory.close();
        }
    }
}
