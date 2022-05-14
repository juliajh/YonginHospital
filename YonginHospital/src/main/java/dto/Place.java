package dto;

public class Place implements java.io.Serializable{
	protected String name;
	protected double lat;
	protected double lng;
	
	public Place() {
		this("",0.0,0.0);
	}
	
	public Place(String name, double lat, double lng) {
		this.name = name;
		this.lat = lat;
		this.lng = lng;
	}

	//getter & setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	//toString
	@Override
	public String toString() {
		return "Place [name=" + name + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
}
