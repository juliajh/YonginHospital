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
		Place[] place = {new Place("수지구",37.31444,127.092),new Place("풍덕천동",36.96388082505,127.942903887),new Place("신봉동",37.33397,127.04540),new Place("죽전동", 37.33233199319, 127.13526645806),new Place("동천동",37.342296446704,127.10195655337),new Place("고기동",37.3584399211,127.053012)
				,new Place("상현동",37.3016450846,127.077905379),new Place("성복동",37.31543922992,127.0646514474)};
		this.data.put("수지구", place);
		place = new Place[]{new Place("기흥구",37.2521,127.1075),new Place("신갈동",37.27707498990,127.1094738590),new Place("영덕동",37.2720,127.08832),new Place("하갈동",37.254780690219,127.09261109772),new Place("구갈동",37.26975452798,127.13162677463),new Place("상갈동",37.2696026,127.108726931),new Place("보라동",37.2590608657,127.1060525703)
				,new Place("지곡동",36.0201073329,129.3253098799),new Place("공세동",37.2364,127.10977),new Place("고매동",37.2262898948,127.126423722),new Place("농서동",37.22347289773,127.0885389383),new Place("서천동",37.2377055245,127.0781629418),new Place("언남동",37.2914235942,127.12944646),new Place("청덕동",37.290607279,127.1483097961),new Place("마북동",37.2966385837,127.117868645),new Place("동백동",37.2657095655,127.1603785566)
				,new Place("중동",37.4939409212,126.7665285825),new Place("상하동",37.2696026077,127.10872693156),new Place("보정동", 37.3134116728,127.111402838)};
		this.data.put("기흥구",place);
		place = new Place[] {new Place("처인구",37.2759,127.1886),new Place("포곡읍",37.277119359,127.22694956007),new Place("모현읍",37.31987061044,127.253668449),new Place("이동읍",37.1378571688, 127.1985408643),new Place("남사읍",37.100003979,127.1294125514),new Place("원삼면",37.19820158473,127.3316608599),new Place("백암면",37.153628455841,127.3845477578)
				,new Place("양지면",37.261798288639,127.2470191330),new Place("중앙동",37.234652317703,127.203254095),new Place("역북동", 37.23794668641,127.1971663621),new Place("삼가동",37.31987061044,127.253668449),new Place("유림동" ,37.25767673475,127.212864597726)};
		this.data.put("처인구", place);
	}
	
	//get array by name(gu)
	public Place[] get(String name) {
		return this.data.get(name);
	}

	//getData return Map
	public Map<String, Place[]> getData() {
		return data;
	}

}
