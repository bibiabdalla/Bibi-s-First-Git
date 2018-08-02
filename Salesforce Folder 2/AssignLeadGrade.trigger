trigger AssignLeadGrade on Lead (before insert, before update) {

	For( Lead myLead : trigger.new){
		if(myLead.Score__c != null ){
			if(myLead.Score__c == 100){

				myLead.Greade__c = 'A+';
				} else if (myLead.Score__c >= 90){
					myLead.Greade__c = 'fuck off';
				} else{
					myLead.Greade__c = 'you out did yourself';
				}
		}

		


	}
}