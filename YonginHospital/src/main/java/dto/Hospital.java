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
		if(subject.contains("�ܰ�")) {
			if(subject.contains("����")) {
				this.subject.add(Subject.BRST);
			}
			if(subject.contains("����")) {
				this.subject.add(Subject.PLST);
			}
			if(subject.contains("����")||subject.contains("�׹�")) {
				this.subject.add(Subject.COLO);
			}
			if(subject.contains("����")) {
				this.subject.add(Subject.ORTH);
			}
			if(subject.contains("�Ű�")) {
				this.subject.add(Subject.NEUR);
			}
			if(subject.contains("���")) {
				this.subject.add(Subject.THOR);
			}
			if(this.subject.size()==0)
				this.subject.add(Subject.MEDI);
		}
		if(subject.contains("�Ȱ�")) {
			this.subject.add(Subject.OPTH);
		}
		if(subject.contains("ġ��")) {
			this.subject.add(Subject.DENT);
		}
		if(subject.contains("�Ǻΰ�")) {
			this.subject.add(Subject.DERM);
		}
		if(subject.contains("���")) {
			this.subject.add(Subject.OBST);
		}
		if(subject.contains("����")) {
			this.subject.add(Subject.MEDI);
		}
		if(subject.contains("�Ҿ�")) {
			this.subject.add(Subject.PEDI);
		}
		if(subject.contains("��")) {
			this.subject.add(Subject.CANC);
		}
		if(subject.contains("���")) {
			this.subject.add(Subject.NURS);
		}
		if(subject.contains("����")) {
			this.subject.add(Subject.MENT);
		}
		if(this.subject.size()==0)
			this.subject.add(Subject.ETC);
		this.location_kor = location_kor;
		this.gu = gu;
		if(gu.contentEquals("������")) {
			if(location_kor.contains("ǳ��õ")) 
				this.bldg = "ǳ��õ��";
			else if(location_kor.contains("�ź�"))
				this.bldg = "�ź���";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("��õ"))
				this.bldg = "��õ��";
			else if(location_kor.contains("���"))
				this.bldg = "��⵿";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("����"))
				this.bldg = "���ϵ�";
			else
				this.bldg = "������";
		}
		else if(gu.contentEquals("���ﱸ")) {
			if(location_kor.contains("�Ű�")) 
				this.bldg = "�Ű���";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("�ϰ�"))
				this.bldg = "�ϰ���";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("��"))
				this.bldg = "�󰥵�";
			else if(location_kor.contains("����"))
				this.bldg = "����";
			else if(location_kor.contains("����"))
				this.bldg = "���";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("���"))
				this.bldg = "��޵�";
			else if(location_kor.contains("��"))
				this.bldg = "�󼭵�";
			else if(location_kor.contains("��õ"))
				this.bldg = "��õ��";
			else if(location_kor.contains("��"))
				this.bldg = "�𳲵�";
			else if(location_kor.contains("û��"))
				this.bldg = "û����";
			else if(location_kor.contains("����"))
				this.bldg = "���ϵ�";
			else if(location_kor.contains("����"))
				this.bldg = "���鵿";
			else if(location_kor.contains("�ߵ�"))
				this.bldg = "�ߵ�";
			else if(location_kor.contains("����"))
				this.bldg = "���ϵ�";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else
				this.bldg = "���ﱸ";
		}
		else {
			if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("�̵�"))
				this.bldg = "�̵���";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("����"))
				this.bldg = "�����";
			else if(location_kor.contains("���"))
				this.bldg = "��ϸ�";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else if(location_kor.contains("�߾�"))
				this.bldg = "�߾ӵ�";
			else if(location_kor.contains("����"))
				this.bldg = "���ϵ�";
			else if(location_kor.contains("�ﰡ"))
				this.bldg = "�ﰡ��";
			else if(location_kor.contains("����"))
				this.bldg = "������";
			else
				this.bldg = "ó�α�";
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
