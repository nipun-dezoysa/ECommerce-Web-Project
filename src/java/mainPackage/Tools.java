/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainPackage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import models.*;

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
    
    public static String[] getOrderColorUser(Order a){
        String c="";
        String stt = "";
        switch (a.getStatus()) {
            case 1:
                c="bg-purple-200 text-purple-400";
                stt="Processing";
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
    
    public static String makeProductsQuery(String name,String type,String brand){
        String query="";
        if(name!=null||type!=null||brand!=null){
            query+="WHERE ";
            if(name!=null){
                query+="name LIKE '%"+name+"%'";
                if(type!=null||brand!=null)query+=" AND ";
            }
            if(brand!=null){
                query+="brand LIKE '%"+brand+"%'";
                if(type!=null)query+=" AND ";
            }
            if(type!=null){
                if(type.equals("mens"))query+="type=1";
                else if(type.equals("womens"))query+="type=2";
                else query+="type=3";
            }
        }
        
        return query;
    }
    
    public static ArrayList<Product> filterList(ArrayList<Product> list,String color,String size){
        ArrayList<Product> result = new ArrayList<>();
        for(Product a : list){
            boolean cc = false;
            boolean ss = false;
            if(color!=null){
                for(Color c : a.getColors()){
                    if(c.getValue().equals(color))cc=true;
                }
            }else cc=true;
            
            if(size!=null){
                for(Size s : a.getSizes()){
                    if(s.getValue().equals(size))ss=true;
                }
            }else ss=true;
            if(cc && ss)result.add(a);
        }
        return result;
    }
    
    public static ArrayList<Order> filterOrders(ArrayList<Order> list ,String type){
         ArrayList<Order> result = new ArrayList<>();
         int st = 8;
         if(type != null){
             if(type.equals("toship")) st=2;
             else if(type.equals("toreceive")) st=3;
             else if(type.equals("delivered")) st=4;
         }
         for(Order a:list){
             if(st==8)result.add(a);
             else if(st==2 && a.getStatus()<=2)result.add(a);
             else if(st==3 && a.getStatus()==3)result.add(a);
             else if(st==4 && (a.getStatus()==4 || a.getStatus()==7))result.add(a);
         }
         return result;
    }
}
