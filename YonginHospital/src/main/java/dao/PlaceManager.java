package dao;

import java.util.*;
import dto.Place;

public class PlaceManager {
	private List<Place> data = null;
	
	private static PlaceManager instance = new PlaceManager();
	public static PlaceManager getInstance() {
		return instance;
	}
	
	public PlaceManager() {
		this.data = new ArrayList<Place>();
		this.data.add(new Place("수지구",37.31444,127.092));
		this.data.add(new Place("기흥구",37.2521,127.1075));
		this.data.add(new Place("처인구",37.2759,127.1886));
	}
	
	//get by index
	public Place get(int index) {
		return this.data.get(index);
	}
	
	//get by name
	public Place get(String name) {
		Place p = null;
		for (Place place : this.data) {
			if(place.getName().contentEquals(name))
			{
				p = place;
				break;
			}
		}
		return p;
	}
	
	//getList
	public List<Place> getList(){
		return this.data;
	}
	
	//add data
	public void add(Place place) {
		this.data.add(place);
	}
}
