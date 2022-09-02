/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qlbx.configs;

import java.util.Properties;
import javax.sql.DataSource;
import static org.hibernate.cfg.AvailableSettings.DIALECT;
import static org.hibernate.cfg.AvailableSettings.SHOW_SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import static org.hibernate.cfg.Environment.*;
import org.springframework.orm.hibernate5.HibernateTransactionManager;

/**
 *
 * @author ASUS
 */
@Configuration
@PropertySource("classpath:database.properties")
public class HibernateConfig {
    @Autowired
    private Environment env;
    
    @Bean
    public LocalSessionFactoryBean sessionFactory(){
        LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
        factory.setPackagesToScan("com.qlbx.pojo");
        factory.setDataSource(dataSource());
        factory.setHibernateProperties(hibernateProperties());
        
        return factory;
    }
    
    @Bean
    public HibernateTransactionManager transactionManager(){
        HibernateTransactionManager transaction = new HibernateTransactionManager();
        transaction.setSessionFactory(sessionFactory().getObject());
        
        return transaction;
    }

    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource d = new DriverManagerDataSource();
        d.setDriverClassName(env.getProperty("hibernate.connection.driverClass"));
        d.setUrl(env.getProperty("hibernate.connection.url"));
        d.setUsername(env.getProperty("hibernate.connection.username"));
        d.setPassword(env.getProperty("hibernate.connection.password"));
        
        return d;
    }

    public Properties hibernateProperties() {
        Properties props = new Properties();
        props.setProperty(SHOW_SQL, env.getProperty("hibernate.showSql"));
        props.setProperty(DIALECT, env.getProperty("hibernate.dialect"));
        
        return props;
    }
}
