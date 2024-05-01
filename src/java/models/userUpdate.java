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
    public boolean updateEmail(String email ,String password,int id){
        DatabaseLogIn db = new DatabaseLogIn();
        String passworddb=db.getPasswd(id);
        if(password.equals(passworddb)){
            db.updateEmail(id, email);
            db.closeDb();
            return true;
        
        }
        else{
            db.closeDb();
            return false;
            
        }
    
    }
    public boolean updatePasswd(String passwordold ,String passwordnew,String passwordnew2,int id){
        DatabaseLogIn db = new DatabaseLogIn();
        String passworddb=db.getPasswd(id);
        if(passwordold.equals(passworddb) && passwordnew.equals(passwordnew2)){
            db.updatePasswd(id, passwordnew);
            db.closeDb();
            return true;
        
        }
        else{
            db.closeDb();
            return false;
            
        }
    }
    
}

    
