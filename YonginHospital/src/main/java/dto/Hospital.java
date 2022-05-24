package dto;
import java.util.*;

public class Hospital implements java.io.Serializable{
	protected Place location;
	protected List<Subject> subject;
	protected String openDate;
	protected String location_kor;
	protected String gu;
	protected String bldg;
	
	//constructor
	public Hospital() {
		this("","","","",0.0,0.0,"");
	}
	
	public Hospital(Place location, List<Subject> subject, String openDate, String location_kor, String gu, String bldg) {
		super();
		this.location = location;
		this.subject = subject;
		this.openDate = openDate;
		this.location_kor = location_kor;
		this.gu = gu;
		this.bldg = bldg;
	}
	
	//constructor by csv file
	public Hospital(String name, String openDate, String subject, String location_kor, double lng, double lat, String gu ) {
		this.location = new Place(name,lat,lng);
		this.openDate = openDate;
		this.subject = new ArrayList<Subject>();
		if(subject.contains("외과")) {
			if(subject.contains("유방")) {
				this.subject.add(Subject.BRST);
			}
			if(subject.contains("성형")) {
				this.subject.add(Subject.PLST);
			}
			if(subject.contains("대장")||subject.contains("항문")) {
				this.subject.add(Subject.COLO);
			}
			if(subject.contains("정형")) {
				this.subject.add(Subject.ORTH);
			}
			if(subject.contains("신경")) {
				this.subject.add(Subject.NEUR);
			}
			if(subject.contains("흉부")) {
				this.subject.add(Subject.THOR);
			}
			if(this.subject.size()==0)
				this.subject.add(Subject.MEDI);
		}
		if(subject.contains("안과")) {
			this.subject.add(Subject.OPTH);
		}
		if(subject.contains("치과")) {
			this.subject.add(Subject.DENT);
		}
		if(subject.contains("피부과")) {
			this.subject.add(Subject.DERM);
		}
		if(subject.contains("산부")) {
			this.subject.add(Subject.OBST);
		}
		if(subject.contains("내과")) {
			this.subject.add(Subject.MEDI);
		}
		if(subject.contains("소아")) {
			this.subject.add(Subject.PEDI);
		}
		if(subject.contains("암")) {
			this.subject.add(Subject.CANC);
		}
		if(subject.contains("요양")) {
			this.subject.add(Subject.NURS);
		}
		if(subject.contains("정신")) {
			this.subject.add(Subject.MENT);
		}
		if(this.subject.size()==0)
			this.subject.add(Subject.ETC);
		this.location_kor = location_kor;
		this.gu = gu;
		if(gu.contentEquals("수지구")) {
			if(location_kor.contains("풍덕천")) 
				this.bldg = "풍덕천동";
			else if(location_kor.contains("신봉"))
				this.bldg = "신봉동";
			else if(location_kor.contains("죽전"))
				this.bldg = "죽전동";
			else if(location_kor.contains("동천"))
				this.bldg = "동천동";
			else if(location_kor.contains("고기"))
				this.bldg = "고기동";
			else if(location_kor.contains("상현"))
				this.bldg = "상현동";
			else if(location_kor.contains("성북"))
				this.bldg = "성북동";
			else
				this.bldg = "수지구";
		}
		else if(gu.contentEquals("기흥구")) {
			if(location_kor.contains("신갈")) 
				this.bldg = "신갈동";
			else if(location_kor.contains("영덕"))
				this.bldg = "영덕동";
			else if(location_kor.contains("하갈"))
				this.bldg = "하갈동";
			else if(location_kor.contains("구갈"))
				this.bldg = "구갈동";
			else if(location_kor.contains("상갈"))
				this.bldg = "상갈동";
			else if(location_kor.contains("보라"))
				this.bldg = "보라동";
			else if(location_kor.contains("지곡"))
				this.bldg = "지곡동";
			else if(location_kor.contains("공세"))
				this.bldg = "공세동";
			else if(location_kor.contains("고메"))
				this.bldg = "고메동";
			else if(location_kor.contains("농서"))
				this.bldg = "농서동";
			else if(location_kor.contains("서천"))
				this.bldg = "서천동";
			else if(location_kor.contains("언남"))
				this.bldg = "언남동";
			else if(location_kor.contains("청덕"))
				this.bldg = "청덕동";
			else if(location_kor.contains("마북"))
				this.bldg = "마북동";
			else if(location_kor.contains("동백"))
				this.bldg = "동백동";
			else if(location_kor.contains("중동"))
				this.bldg = "중동";
			else if(location_kor.contains("상하"))
				this.bldg = "상하동";
			else if(location_kor.contains("보정"))
				this.bldg = "보정동";
			else
				this.bldg = "기흥구";
		}
		else {
			if(location_kor.contains("포곡"))
				this.bldg = "포곡읍";
			else if(location_kor.contains("모현"))
				this.bldg = "모현읍";
			else if(location_kor.contains("이동"))
				this.bldg = "이동읍";
			else if(location_kor.contains("남사"))
				this.bldg = "남사읍";
			else if(location_kor.contains("원삼"))
				this.bldg = "원삼면";
			else if(location_kor.contains("백암"))
				this.bldg = "백암면";
			else if(location_kor.contains("양지"))
				this.bldg = "양지면";
			else if(location_kor.contains("중앙"))
				this.bldg = "중앙동";
			else if(location_kor.contains("역북"))
				this.bldg = "역북동";
			else if(location_kor.contains("삼가"))
				this.bldg = "삼가동";
			else if(location_kor.contains("유림"))
				this.bldg = "유림동";
			else
				this.bldg = "처인구";
		}
	}
	
	//getter & setter 
	public Place getLocation() {
		return location;
	}
	public void setLocation(Place location) {
		this.location = location;
	}
	public List<Subject> getSubject() {
		return subject;
	}
	public void setSubject(List<Subject> subject) {
		this.subject = subject;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getLocation_kor() {
		return location_kor;
	}
	public void setLocation_kor(String location_kor) {
		this.location_kor = location_kor;
	}
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getBldg() {
		return bldg;
	}
	public void setBldg(String bldg) {
		this.bldg = bldg;
	}
	
	
}
