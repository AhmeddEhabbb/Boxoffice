/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objects;

import java.util.ArrayList;

/**
 *
 * @author amrsh
 */
public class Booking 
{
    private String b_s_time,b_u_email,b_m_name,b_No;
    private ArrayList<String> b_Seat=new ArrayList<>();
    private int b_price,b_popcorn,b_soda;

    public String getB_s_time() {
        return b_s_time;
    }

    public void setB_s_time(String b_s_time) {
        this.b_s_time = b_s_time;
    }
   

    public String getB_m_name() {
        return b_m_name;
    }

    public void setB_m_name(String b_m_name) {
        this.b_m_name = b_m_name;
    }


    public int getB_price() {
        return b_price;
    }

    public void setB_price(int b_price) {
        this.b_price = b_price*b_Seat.size();
    }

    public String getB_u_email() {
        return b_u_email;
    }

    public void setB_u_email(String b_u_email) {
        this.b_u_email = b_u_email;
    }


    public String getB_No() {
        return b_No;
    }

    public void setB_No(String b_No) {
        this.b_No = b_No;
    }

    public ArrayList<String> getB_Seat() {
        return b_Seat;
    }

    public void setB_Seat(ArrayList<String> b_Seat) {
        this.b_Seat = b_Seat;
    }

    public int getB_popcorn() {
        return b_popcorn;
    }

    public void setB_popcorn(int b_popcorn) {
        this.b_popcorn = b_popcorn;
    }

    public int getB_soda() {
        return b_soda;
    }

    public void setB_soda(int b_soda) {
        this.b_soda = b_soda;
    }
    
    
    
    

    

    
    
}
