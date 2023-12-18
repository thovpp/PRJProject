package Helpers;

import java.sql.Date;

public class Helpers {
    public static int parseInt(String x, int defaultValues) {
        int n = defaultValues;
        try {
            n = Integer.parseInt(x);
        } catch (NumberFormatException e) {
            System.out.println("Parseint: ");
        }
        return n;
    }

    public static boolean isNullOrEmpty(String str){
        if (str == null || str.equals("") || str.trim().equals("")){
            return true;
        }
        return false;
    }

    public static Date getDateNow(){
        java.util.Date dateNow = new java.util.Date();
        return new java.sql.Date(dateNow.getTime());
    }
}
