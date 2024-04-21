// Dolcy Sareen
// 300336691
//Lab1
public class Commercial extends Flight {
	
   
    protected String status="On Time";
    protected double securityFee;
    public Commercial(String departLocation, String destination, Time departTime, Time duration,double securityFee)
    {
    	super(departLocation,destination,departTime,duration);
    	this.securityFee=securityFee;
    }
    public void setStatus(String status)
    {
    	this.status=status;
    }
    public String getStatus()
    {
    	return status;
    }
    public double getSecurityFee()
    {
    	return securityFee;
    }
    public String toString()
    {
    	return super.toString()+"Status: "+status+"\n";
    }
     
}
