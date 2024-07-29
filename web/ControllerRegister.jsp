<%-- 
    Document   : ControllerRegister
    Created on : May 11, 2023, 3:40:04 PM
    Author     : amrsh
--%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="u" class="objects.Users" scope="request">
<jsp:setProperty      property="*" name="u"/>
</jsp:useBean>

<jsp:useBean id="uToStore" class="objects.Users" scope="request">
<jsp:setProperty      property="*" name="uToStore"/>
</jsp:useBean>

<%
import java.util.regex.Pattern;
import java.util.regex.Matcher;

boolean flag = false;

if(u.getU_name.length()<3)
{
	out.println("Name length must be 3 or more");%><br><%
	flag = true;
	
	 for(int i = 0 ; i<name.length();i++)
	    {
	    	char c = u.getU_name().charAt(i);
                
	    	if(c != ' ' && !Character.isLetter(c))
	    	{
	    		flag = true;
	    		out.println("Name must contain letters only ");%><br><%
	    		break;
	    	}
	
            }
}
	 
	 if(u.getU_password() > 8)
	    {
                out.println("Password length must be 8 or more ");%><br><%
	    	flag = true;

                if(!u.getU_password()==request.getParameter("passwordconfirm"))
                {
                    out.println("Password length must be 8 or more ");%><br><%
                }
                
	    }
	 
	 
	 if(db.CheckEmail(u.getU_email()))
	 {
		 flag = true;
		 out.println("Email already exists");%><br><%
	 }
	 else
	 {
		 if(u.getU_namelength()<3)
		 {
		 	out.println("Name length must be 3 or more");%><br><%
		 	flag = true;
		 	
		 	 for(int i = 0 ; i<name.length();i++)
		 	    {
		 	    	char c = u.getU_name().charAt(i);
		 	    	if(c != ' ' && !Character.isLetter(c))
		 	    	{
		 	    		flag = true;
		 	    		out.println("Name must contain letters only ");%><br><%
		 	    		break;
		 	    	}
	 }
		 	 if(u.getU_password() < 8)
			    {
			    	out.println("Password length must be 8 or more ");%><br><%
			    	flag = true;
			    	Pattern pattern = Pattern.compile("[^a-zA-Z0-9]");
			        Matcher matcher = pattern.matcher(u.getU_password());

			        if (matcher.find()) {
			            System.out.println("Special character found!");
			        } 
			        else
                                {
			            System.out.println("No special characters found.");
                                }

			    }
	 
	 
	 

%>