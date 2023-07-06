package com.lec.ex11_account;
//accountNO, owenrName, balance,cardNO, deposit() withdraw(), infoPrint(), infoString(), pay() 
public class CreditLineAccount extends CheckingAccount {
	private int creditLine; //ī���ѵ�
	public CreditLineAccount(String accountNo, String ownerName, int balance, String cardNo , int creditLine) {
		super(accountNo, ownerName, balance, cardNo);
		this.creditLine = creditLine;
	}
	public CreditLineAccount(String accountNo, String ownerName, String cardNo , int creditLine) {
		super(accountNo, ownerName, cardNo);
		this.creditLine = creditLine;
	}
	//ca1,pay("1234123412341234",10000)
	@Override
	public void pay(String cardNo, int amount) {
		if(cardNo.equals(getCardNo())) { // �ùٸ� ī���ȣ�� ���
			if(creditLine >= amount) { //���Ұ���
				//balance = balance - amount;
				creditLine -= amount;
				//setBalance(creditLine - amount ); // �ѵ��� amount ��ŭ ����
				System.out.printf("%s�� %d�� �����Ͽ� �ѵ� %d�� ���ҽ��ϴ�\n",getOwnerName(), amount, creditLine);
			}else { //�ܾ׺������� ���� �Ұ�
				System.out.println(getOwnerName()+"�� �ѵ��������� ���� �Ұ��մϴ�");
			}
		}else {
			System.out.println("��ȿ�� ī���ȣ�� �ƴմϴ�");
		}
	}

}
