/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

/**
 *
 * @author sanjeewa
 */
public class Tools {
    
    
    
    
    public String convertToSQL(String input){
        String inputc=input.replace("\'", "\"*");
        return inputc.replace("\\", "/*");
    
    }
    public String reversToText(String input){
        String inputc=input.replace("\"*", "\'");
        return inputc.replace("/*", "\\");
    
    }
    
}
