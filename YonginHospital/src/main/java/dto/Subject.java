package dto;

public enum Subject {
	OPTH, DENT, DERM, OBST, BRST, PLST, COLO, ORTH, GENE, MEDI, NEUR, THOR, PEDI,CANC,NURS,MENT,ETC;
	
	
	public static Subject valueOf(int value) {
		switch(value) {
		case 0: return OPTH; //안과 
		case 1: return DENT; //치과 
		case 2: return DERM; //피부과 
		case 3: return OBST; //산부인과 
		case 4: return BRST; //유방외과
		case 5: return PLST; //성형외과
		case 6: return COLO; //대장항문외과
		case 7: return ORTH; //정형외과
		case 8: return GENE; //일반외과 
		case 9: return MEDI; //내과 
		case 10: return NEUR; //신경외과
		case 11: return THOR; //흉부외과
		case 12: return PEDI; //소아과 
		case 13: return CANC; //암센터 
		case 14: return NURS; //요양병원 
		case 15: return MENT; //정신건강의학과 
		case 16: return ETC; //기타 병원
		default: return null;
		}
	}
	
	public static String[] names() {
		String[] names = new String[Subject.values().length];
		for (Subject t : Subject.values()) 
			names[t.ordinal()] = t.toString();
		return names;
	}
}
