package com.hrapp.factory;

import io.micronaut.context.annotation.Factory;
import jakarta.inject.Singleton;
import javax.sql.DataSource;
import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

@Factory
public class BaseMyBatisFactory {
    private final DataSource dataSource;
    public BaseMyBatisFactory(DataSource dataSource){
        this.dataSource = dataSource;
    }
    @Singleton
    public SqlSessionFactory sqlSessionFactory(){
        TransactionFactory tsFactory = new JdbcTransactionFactory();
        Environment env = new Environment("dev", tsFactory,dataSource);
        Configuration cfg = new Configuration(env);
        cfg.addMappers("com.hrapp"); // ß-- write your package here (base)
        return new SqlSessionFactoryBuilder().build(cfg);
    }
}