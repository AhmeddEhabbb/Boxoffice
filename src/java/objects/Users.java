/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package objects;

/**
 *
 * @author amrsh
 */
public class Users 
{
    private String u_id, u_name,
            u_password,
            u_email
            ;
private boolean admin;
    
    
    public String getU_id() {
        return u_id;
    }

    public void setU_id(String u_id) {
        this.u_id = u_id;
    }
    

    public String getU_name() {
        return u_name;
    }

    public void setU_name(String u_name) {
        this.u_name = u_name;
    }

    public String getU_password() {
        return u_password;
    }

    public void setU_password(String u_password) {
        this.u_password = u_password;
    }

    public String getU_email() {
        return u_email;
    }

    public void setU_email(String u_email) {
        this.u_email = u_email;
    }

    public int isAdmin()
    {
        //return admin? 1: 0;
        
        if (admin)
        {
            return 1;
            
        }
        else
        {
            return 0;
        }
    }

    public void setAdmin(boolean admin) 
    {
        this.admin = admin;
    }
    
    
    
    
    
    

    
    
    
    
}
