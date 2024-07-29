package objects;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

import java.sql.*;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Set;

public class DataBase 
{
    Connection conn;
    String url = "jdbc:mysql://localhost:3306/Box_Office?zeroDateTimeBehavior=CONVERT_TO_NULL";
   
    public DataBase() 
    {
        
        try
        {
                // load driver      
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection
                conn = DriverManager.getConnection (url, "root", "amr1987");

                // Create a statement for running sql
                Statement statement = conn.createStatement();
  
        }
        catch(ClassNotFoundException | SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                        conn.close();
                } 
                catch (SQLException ex) 
                {
                }
        }
	}
   
    
    
    //this method should insert all the data from the user object parameter to the table
    //the method will return the number of updated records by the sql statement
    //Done
    public int storeUser(Users u)
    {
        int updated = 0;

        try {
                conn = DriverManager.getConnection (url, "root", "amr1987");

                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO box_offcie.users (u_email, u_name,u_password,is_admin) VALUES (?,?,?,?);");
                pstmt.setString(1, u.getU_email());
                pstmt.setString(2, u.getU_name());
                pstmt.setString(3, u.getU_password());
                pstmt.setString(4, "0");// to set user as a customer

                updated = pstmt.executeUpdate();

        } catch (SQLException e) 
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                                conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

        return updated;
	}
   
    //DONE
    public int storeBooking(Booking b)
    {
        int updated = 0;

        try {
                conn = DriverManager.getConnection (url, "root", "amr1987");

                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO box_office.booking (b_s_ID,b_u_ID,b_price,b_popcorn,b_soda) VALUES (?,?,?,?,?);");         
                pstmt.setString(1,getS_IDFromDB(b.getB_s_time()));
                pstmt.setString(2,getU_IDFromDB(b.getB_u_email()));
                pstmt.setString(3," "+ b.getB_price());
                pstmt.setString(4, ""+b.getB_popcorn());
                pstmt.setString(5,""+b.getB_soda());
                
                
                               
                updated = pstmt.executeUpdate();
                
                

        } catch (SQLException e) 
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                                conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

            int seats = storeBookedSeats(b);
        return updated *seats ;
	}
    
    //DONE
    public int storeBookedSeats(Booking b)
    {
        int updated = 0;

        
        try {
                conn = DriverManager.getConnection (url, "root", "amr1987");

                
                for (int i = 0; i < b.getB_Seat().size(); i++) 
                {
                PreparedStatement pstmt = conn.prepareStatement("insert into BookedSeats values(?,?)");
                pstmt.setString(1, b.getB_Seat().get(i));
                pstmt.setString(2,b.getB_No());
         
                updated = pstmt.executeUpdate();
                }
                
                    

        } catch (SQLException e) 
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                                conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

        return updated;
	}
    
    //DONE
    public int storeMovie(Movie m)
    {
        int updated = 0;

        try {
                conn = DriverManager.getConnection (url, "root", "amr1987");

                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO box_office.movie (m_name, m_year,m_genre,m_description) VALUES (?,?,?,?)");
                pstmt.setString(1, m.getM_name());
                pstmt.setString(2, m.getM_year());
                pstmt.setString(3, m.getM_genre());
                pstmt.setString(4, m.getM_description());

                updated = pstmt.executeUpdate();

        } catch (SQLException e) 
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                                conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

        return updated;
    }

    //DONE
    public int storeShowtime(Showtime sh)
    {
        int updated = 0;

        try {
                conn = DriverManager.getConnection (url, "root", "amr1987");

                PreparedStatement pstmt = conn.prepareStatement("INSERT INTO box_office.showtime (s_price,s_time,s_m_ID,s_isActive) VALUES (?,?,?,?);");
               
                pstmt.setString(1, String.valueOf((int) sh.getS_price()));
                pstmt.setString(2, sh.getS_time());
                pstmt.setString(3, getM_IdFromDB(sh.getS_m_name()));
                pstmt.setString(4,"1");
 

                updated = pstmt.executeUpdate();

        } catch (SQLException e) 
        {
                e.printStackTrace();
        }
        finally
        {
                try 
                {
                        if(conn != null)
                                conn.close();
                } catch (SQLException e) {
                        e.printStackTrace();
                }
        }

        return updated;
    }
    
    
    //returns 1>customer , 2>admin , 0>not stored
    //DONE
    public int loginUser(Users u)
    {
        int checkAdmin=0;
        
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select * from box_office.users where u_email=? AND u_password=?");
            pstmt.setString(1,u.getU_email());
            pstmt.setString(2,u.getU_password());


           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               u.setAdmin(result.getBoolean("is_admin"));
               u.setU_name(result.getString("u_name"));
                
                
                
                if (u.isAdmin()==1)
                {
                    
                    checkAdmin= 2;
                }
                else
                {
                    checkAdmin = 1;
                }
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
                      
         return checkAdmin;
	}
    
    //returns true if the email is already in the database
    //DONE
    public boolean CheckEmail(Users u)
    {
        boolean checkEmail=false;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement(" SELECT CASE WHEN EXISTS ( select * from box_office.users where u_email=? ) THEN 'TRUE' ELSE 'FALSE' END ");
            pstmt.setString(1,u.getU_email());
            


           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {
                
                
                checkEmail=result.getBoolean(1);
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        return checkEmail;
    }
    
    
    //for inserting Fk(movie id) in showtime
    //DONE
    public String getM_IdFromDB(String m_name)
    {
        String ID = null;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select m_ID from box_office.movie where m_name=?");
            pstmt.setString(1,m_name);



           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               ID= result.getString("m_ID");
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return ID;
    }
    
    //for inserting Fk(show id) in booking
    //Done
    public String getS_IDFromDB(String Sh_time)
    {
        String ID = null;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select s_ID from box_office.showtime sh,box_office.movie m where s_time=? AND sh.s_m_ID=m.m_ID");
            pstmt.setString(1,Sh_time);
          



           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               ID= result.getString("s_ID");
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return ID;
    }
    
    // inserting Fk(user id) in booking
    //Done
    public String getU_IDFromDB(String u_email)
    {
        String email = null;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select u_ID from box_office.users where u_email=?");
            pstmt.setString(1,u_email);



           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               email= result.getString("s_ID");
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return email;
    }
        
    
    
    //DONE 
    //for booking class
    public String getM_name4BFromDB(String m_ID)
    {
        String name = null;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select m_name from box_office.movie m,box_office.showtime s,box_office.booking b where b.b_s_ID=s.s_ID AND s_m_ID=?");
            pstmt.setString(1,m_ID);
            
           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               name= result.getString("m_name");
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return name;
    }    
    
    
    //DONE 
    //for Showtime class
    public String getM_name4ShFromDB(String s_ID)
    {
        String name = null;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select m_name from box_office.movie m,box_office.showtime s where s_ID=?");
            pstmt.setString(1,s_ID);
            
           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               name= result.getString("m_name");
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return name;
    }
    
    
    
    
    //DONE
    //returns an ArrayList of bookedSeats in a specific show
    public ArrayList<String> bookedSeatsInShow(String s_ID)
    {
        ArrayList<String> toreturn = new ArrayList<>();
        
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select seat from box_office.bookedseats s,box_office.showtime sh,box_office.booking b where b.b_s_ID=? AND sh.s_ID=? ");
            pstmt.setString(1,s_ID);
            pstmt.setString(2,s_ID);
            
            
           ResultSet result = pstmt.executeQuery();
           
            while(result.next()) 
            {
               toreturn.add(result.getString("seat"));
            }
    
            

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        
        return toreturn;
    }
    
    
    //DONE
    //returns an ArrayList of all available movies to the user
    public ArrayList<String> getAvailableMovies()
    {
        ArrayList<String> toreturn = new ArrayList<>();
        
        
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select DISTINCT m_name from box_office.showtime, box_office.movie where s_m_ID=m_ID AND S_isActive=1");

                  
           ResultSet result = pstmt.executeQuery();
           
            while(result.next()) 
            {
               toreturn.add(result.getString("m_name"));
            }
    
            

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        
        return toreturn;
    }
    
    
    //DONE
    //returns an ArrayList of all available movies to the user
    public ArrayList<String> AdmingetAvailableMovies()
    {
        ArrayList<String> toreturn = new ArrayList<>();
        
        
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select m_name from box_office.movie ");

                  
           ResultSet result = pstmt.executeQuery();
           
            while(result.next()) 
            {
               toreturn.add(result.getString("m_name"));
            }
    
            

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        
        return toreturn;
    }
    
    
    //DONE
    //returns an ArrayList of all available shows for the selected movie to the user
    public ArrayList<String> UsergetAvailableShows(String movie)
    {
        ArrayList<String> toreturn = new ArrayList<>();
        
        
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select s_time from box_office.showtime sh where sh.s_m_ID=?");
            pstmt.setString(1,getM_IdFromDB(movie));
                
                  
           ResultSet result = pstmt.executeQuery();
           
            while(result.next()) 
            {
               toreturn.add(result.getString("s_time"));
            }
    
            

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        
        return toreturn;
    }
    
    //returns the ticket price for ticket review jsp
    //DONE
    public int getTicketPrice(String time,String m_name)
    {
       int price=0;
        try 
        {
            conn = DriverManager.getConnection (url, "root", "amr1987");
            PreparedStatement pstmt = conn.prepareStatement("select s_price from box_office.movie m , box_office.showtime s where m.m_name=? AND s.s_time=? AND m.m_ID=s.s_m_ID");
            pstmt.setString(1,m_name);
            pstmt.setString(2,time);
            
           ResultSet result = pstmt.executeQuery();

            if(result.next()) 
            {

               
               price = Integer.parseInt(result.getString(1));
                
    
            }

        } 
        catch (SQLException e)
        {
                e.printStackTrace();
        }
        finally
        {
            try 
            {
                    if(conn!= null)
                            conn.close();
            } 
            catch (SQLException e)
            {
                    e.printStackTrace();
            }
        }
        
        
        return 110;
        
        
        
    }
    
    
   
    }
