package dao;

import java.util.*;
import dto.Place;

public class PlaceManager {
	private Map<String, Place[]> data = null;
	
	private static PlaceManager instance = new PlaceManager();
	public static PlaceManager getInstance() {
		return instance;
	}
	
	public PlaceManager() {
		this.data = new HashMap<String, Place[]>();
		Place[] place = {new Place("수지구",37.32215,127.0974374),new Place("풍덕천동",37.3241541,127.0932899),new Place("신봉동",37.3321339,127.0618084),new Place("죽전동", 37.3290605,127.1264906),new Place("동천동",37.3412587,127.0994637),new Place("고기동",37.35822,127.0336602)
				,new Place("상현동",37.3032495,127.0796515),new Place("성복동",37.3130678,127.0808273)};
		this.data.put("수지구", place);
		place = new Place[]{new Place("기흥구",37.2801554,127.114659),new Place("신갈동",37.2833789,127.1017312),new Place("영덕동",37.2595166,127.091005),new Place("하갈동",37.2499685,127.0893846),new Place("구갈동",37.2728516,127.1271299),new Place("상갈동",37.2616855,127.1051884),new Place("보라동",37.2540454,127.1142145)
				,new Place("지곡동",37.2380526,127.1391654),new Place("공세동",37.2387332,127.1122523),new Place("고매동",37.2240821,127.1181004),new Place("농서동",37.2468258,127.0734139),new Place("서천동",37.2397806,127.0738117),new Place("언남동",37.2955753,127.1277974),new Place("청덕동",37.2971075,127.1516753),new Place("마북동",37.3117159,127.1336089),new Place("동백동",37.2722401,127.1511556)
				,new Place("중동",37.2649393,127.1626385),new Place("상하동",37.257145,127.1463124),new Place("보정동",37.313179,127.112455)};
		this.data.put("기흥구",place);
		place = new Place[] {new Place("처인구",37.2033296,127.2529221),new Place("포곡읍",37.2777711,127.2308233),new Place("모현읍",37.329568,127.2423358),new Place("이동읍",37.1410777,127.1961791),new Place("남사읍",37.1157082,127.1504934),new Place("원삼면",37.1665762,127.3131912),new Place("백암면",37.1633788,127.3753719)
				,new Place("양지면",37.2354752,127.2798159),new Place("중앙동",37.4841276,126.9497523),new Place("역북동", 37.2455654,127.1885461),new Place("삼가동",37.2422929,127.1641793),new Place("유림동" ,37.2522716,127.2122613)};
		this.data.put("처인구", place);
	}
	
	//get gu place by name(gu)
	public Place get(String name) {
		return this.data.get(name)[0];
	}
	

	//getData return Map
	public Map<String, Place[]> getData() {
		return data;
	}
	
	//get array of dong
	public Place[] getBldg(String gu, String[] bldg) {
		List<Place> list = new ArrayList<Place>();
		for(Place place : this.data.get(gu)) {
			for(String str : bldg) {
				if(str.contentEquals(place.getName())) {
					list.add(place);
				}
			}
		}
		Place[] p = list.toArray(new Place[list.size()]);
		return p;
	}

}
