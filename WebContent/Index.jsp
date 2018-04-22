<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="com.xinu.Receiver"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
    <HEAD>
        <TITLE>Xinu Devices</TITLE>
    </HEAD>

    <BODY>   
    <div align="center"> 
            <h2>Xinu IOT</h2>
            
             <%! String msgToDisplay = "Please Select your option";
             	 String msgToChange = " "; 
             %>  
               
        	<% 
        
        	String msgToSend = " ";
        	msgToSend = request.getParameter("command");
            String ip = request.getParameter("ip");
            
        	if(request.getParameter("buttonName") != null){

            	if(request.getParameter("buttonName").equals("SendtoXinu")) {
            		if(msgToSend.equals("0")){
            			msgToChange = " Sent Off Signal message to Xinu";
            			Receiver.sendMsgToXinu(ip, 5954, msgToSend);
            		}else if(msgToSend.equals("1")){
            			msgToChange = " Sent On Signal message to Xinu";
            			Receiver.sendMsgToXinu(ip, 5954, msgToSend);
            		}else if(msgToSend.equals("2")){
            			msgToChange = " Sent Temperature Signal message to Xinu";
            			Receiver.sendMsgToXinu(ip, 5954, msgToSend);
            			msgToChange = Receiver.recvMsgFrmXinu();
            			msgToChange = "Received from Xinu : " + msgToChange;
            		}
            		
                }else if(request.getParameter("buttonName").equals("ReceivefromXinu")){
                	//msgToChange = Receiver.recvMsgFrmXinu();
                %>
                    
              <%   	
                }	
        	}
        	%>

		 
            <h3 id="lbl1"><%= msgToDisplay + "  " %></h3><br/>
            <h4 id="lbl2"><%= msgToChange + "  " %></h4><br/>
         	<h3 id="lbl3"></h3><br/>
        
        

        <FORM NAME="form1" METHOD="POST" action="Index.jsp">
        	 <table border="2">
        	 <tr><td>Enter the IP</td> <td><INPUT TYPE="text" name="ip" value="192.168.0.101"/></td></tr>
        	 </table>
        
        	<br/><hr/>
        
        	<INPUT TYPE="radio" NAME="command" VALUE="0" checked="checked"/>Turn Off LED<br/>
	        <INPUT TYPE="radio" name="command" value="1"/>Turn On LED<br/>
			<INPUT TYPE="radio" NAME="command" VALUE="2"/>Get Light Information<br/><hr/>
			
			
            <INPUT TYPE="HIDDEN" NAME="buttonName">
            <table border="5">
            	<tr><td><INPUT TYPE="SUBMIT" VALUE="Send to Xinu" id="btn1" ONCLICK="button1()" style="height:25px;width:150px"></td></tr>
        	   
        	</table>
        </FORM>

        <SCRIPT LANGUAGE="JavaScript">
            
            function button1()
            {
                document.form1.buttonName.value = "SendtoXinu"
                form1.submit()
            }    
            function button2()
            {
                document.form1.buttonName.value = "ReceivefromXinu"
                document.getElementById("btn1").disabled = true;
               	
               	document.getElementById("lbl3").innerHTML = "Waiting for Message from Xinu";
               	document.getElementById("lbl1").innerHTML = "";
               	document.getElementById("lbl2").innerHTML = "";
               	
               	form1.submit()
            }    
            
        </SCRIPT>

</div>
    </BODY>
</HTML>

           
