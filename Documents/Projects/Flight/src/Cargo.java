// Dolcy Sareen
// 300336691
// Lab1


public class Cargo extends Flight {
   
    protected String freightDescription;
     public Cargo(String departLocation, String destination,Time departTime, Time duration,String freightDescription)
     {
    	 super(departLocation,destination,departTime,duration);
    	 this.freightDescription=freightDescription;
    	 flightNumber= getFlightNumber()+ "-C";
     }
     
     public String getFreightDescription()
     {
    	 return freightDescription;
     }
     public String toString()
     {
    	 return super.toString()+"Frieght: "+getFreightDescription()+"\n";
     }
     
}
