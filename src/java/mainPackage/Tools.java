/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import models.Order;

/**
 *
 * @author sanjeewa
 */
public class Tools {
    
    
    
    
    public static String convertToSQL(String input){
        String inputc=input.replace("\'", "\"*");
        return inputc.replace("\\", "/*");
    
    }
    public static String reversToText(String input){
        String inputc=input.replace("\"*", "\'");
        return inputc.replace("/*", "\\");
    
    }
    public static String digitFormat(int a){
        if(a<10){
            return "00"+a;
        }else if(a<100){
            return "0"+a;
        }
        else{
            return a+"";
        }
    }
    public static double percentValue(int a,int total){
        return (double)a*100/total;
    } 
    
    public static String[] getOrderColor(Order a){
        String c="";
        String stt = "";
        switch (a.getStatus()) {
            case 1:
                c="bg-yellow-200 text-yellow-400";
                stt="New";
                break;
            case 2:
                c="bg-purple-200 text-purple-400";
                stt="Processing";
                break;
            case 3:
                c="bg-blue-200 text-blue-400";
                stt="Shipped";
                break;
            case 4:
                c="bg-green-200 text-green-400";
                stt="Delivered";
                break;
            case 5:
                c="bg-red-200 text-red-400";
                stt="Canceled";
                break;
            case 6:
                c="bg-red-200 text-red-400";
                stt="Declined";
                break;
            default:
                c="bg-red-200 text-red-400";
                stt="Returned";
                break;
        }
                  
        String[] d = {c,stt};
        return d;          
    }
    public static String getStringVal(ArrayList<Integer> a){
        String val = "["+a.get(0);
        for(int i=1;i<a.size();i++){
            val+=","+a.get(i);
        }
        val+="]";
        return val;
    }
    
    public static String getWeekDays(){
        ArrayList<String> week = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMMM");
        LocalDate today = LocalDate.now();
        for (int i = 6; i >= 0; i--) {
            LocalDate pastDate = today.minusDays(i);
            week.add(pastDate.format(formatter));
        }
        String val = "['"+week.get(0);
        for(int i=1;i<week.size();i++){
            val+="','"+week.get(i);
        }
        val+="']";
        return val;
    }
}
