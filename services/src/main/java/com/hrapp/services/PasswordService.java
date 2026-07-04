package com.hrapp.services;

import jakarta.inject.Singleton;
import org.mindrot.jbcrypt.BCrypt;

@Singleton
public class PasswordService {
    public String hashPassword(String password){
        return BCrypt.hashpw(password, BCrypt.gensalt(12));
    }

    public boolean comparePassword(String password, String hashedPassword){
        try{
            return BCrypt.checkpw(password, hashedPassword);
        }catch (Exception e){
            return false;
        }
    }
}
