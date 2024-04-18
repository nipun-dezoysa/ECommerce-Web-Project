/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;
import mainPackage.DatabaseLogIn;

/**
 *
 * @author sanjeewa
 */
public class userUpdate {
    //DatabaseLogIn db = DatabaseLogIn();
    public int updateEmail(String email ,String password,int id){
        int status;
        DatabaseLogIn db = new DatabaseLogIn();
        String passworddb=db.getPasswd(id);
        if(password.equals(passworddb)){
            db.updateEmail(id, email);
            status=1;
        
        }
        else{
            status=0;
            
        }
        return status;
    
    }
    public int updatePasswd(String passwordold ,String passwordnew,int id){
        int status;
        DatabaseLogIn db = new DatabaseLogIn();
        String passworddb=db.getPasswd(id);
        if(passwordold.equals(passworddb)){
            db.updatePasswd(id, passwordnew);
            status=1;
        
        }
        else{
            status=0;
            
        }
        return status;
    
    }
    
}

    
