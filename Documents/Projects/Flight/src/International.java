// Dolcy Sareen
// 300336691
// Lab1
public class International extends Commercial {
	
    protected String country;
    public International(String departLocation, String destination, Time departTime, Time duration,double securityFee,String country)
    {
    	super(departLocation,destination,departTime,duration,securityFee);
    	flightNumber= getFlightNumber() +"-I";
    	this.country=country;
  
    }
    public String getCountry()
    {
    	return country;
    }
    public String toString()
    {
    	return super.toString()+"Country: "+getCountry()+"\n";
    }
}
