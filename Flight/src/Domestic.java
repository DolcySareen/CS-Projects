//Dolcy Sareen
// 300336691
// Lab1
public class Domestic extends Commercial{
	
    protected double airportFee;
    public Domestic(String departLocation, String destination, Time departTime, Time duration,double securityFee,double airportFee)
    {
    	super(departLocation,destination,departTime,duration,securityFee);
    	this.airportFee=airportFee;
    	flightNumber= getFlightNumber() + "-D";
    	
    }
    public double getAirportFee()
    {
    	return airportFee;
    }
    public String toString()
    {
    	return super.toString();
    }
    
    
}
