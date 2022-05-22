package dto;

public enum Subject {
	OPTH, DENT, DERM, OBST, BRST, PLST, COLO, ORTH, GENE, MEDI, NEUR, THOR, PEDI,CANC,NURS,MENT,ETC;
	
	
	public static Subject valueOf(int value) {
		switch(value) {
		case 0: return OPTH; //�Ȱ� 
		case 1: return DENT; //ġ�� 
		case 2: return DERM; //�Ǻΰ� 
		case 3: return OBST; //����ΰ� 
		case 4: return BRST; //����ܰ�
		case 5: return PLST; //�����ܰ�
		case 6: return COLO; //�����׹��ܰ�
		case 7: return ORTH; //�����ܰ�
		case 8: return GENE; //�Ϲݿܰ� 
		case 9: return MEDI; //���� 
		case 10: return NEUR; //�Ű�ܰ�
		case 11: return THOR; //��οܰ�
		case 12: return PEDI; //�Ҿư� 
		case 13: return CANC; //�ϼ��� 
		case 14: return NURS; //��纴�� 
		case 15: return MENT; //���Űǰ����а� 
		case 16: return ETC; //��Ÿ ����
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
