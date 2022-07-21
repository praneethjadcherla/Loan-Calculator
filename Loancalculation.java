package Loanrepayment;

import java.text.DecimalFormat;

public class Loancalculation {
	
	float P;
	float Payment;
	float R;
	float P1,PP;
	float Interest;
	float Balance;
	public Loancalculation(){}
	
	
	public float PaymentAmount(float A,float interestrate,float N) {
		
        DecimalFormat df= new DecimalFormat("#.000");
        DecimalFormat df2= new DecimalFormat("#.00");
        
        R=interestrate/12/100;
		R=Float.parseFloat(df.format(R));
		
		P=(float)Math.pow((1+R),N);	
		
		Payment=(R*A*P)/(P-1);
		Payment=Float.parseFloat(df2.format(Payment));
		return Payment;
		
	}
	
	public float PrincipleAmountPaid(float interestrate,float N,int n) {
		
		DecimalFormat df= new DecimalFormat("#.000");
		DecimalFormat df2= new DecimalFormat("#.00");
		  
        R=interestrate/12/100;
		R=Float.parseFloat(df.format(R));
		
		P1=(float)Math.pow(1+R,1+N-n);
		PP=(float)Payment/P1;
		
		PP=Float.parseFloat(df2.format(PP));
		return PP;
	}
	
	public float InterestAmountPaid() {
		
		DecimalFormat df2= new DecimalFormat("#.00");
		Interest=(float)Payment-PP;
		Interest=Float.parseFloat(df2.format(Interest));
		return Interest;
	}
	
	public float LoanOutstandingBalance(float interestrate) {
		
		DecimalFormat df= new DecimalFormat("#.000");
		DecimalFormat df2= new DecimalFormat("#.00");
		
        R=interestrate/12/100;
		R=Float.parseFloat(df.format(R));
		
		Balance=(Interest/R)-PP;
		Balance=Float.parseFloat(df2.format(Balance));
		
		return Balance;
	}
	
	public static void main(String[] args) {
		
		
		Loancalculation lc=new Loancalculation();
	    lc.PaymentAmount(100000,5,36);
	}

}
