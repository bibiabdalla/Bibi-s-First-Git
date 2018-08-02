trigger SecretInfo on Case (after insert,after update) {
	// create a bucket for the keywords 
	Set<string> keyWords = New Set<String>();
		keyWords.add('SSN');
		keyWords.add('password');
		keyWords.add('I like you');
	// check to the see if the new created case has the keywords and if case has keyword keeyp keep track of the case
	List<Case> caseWKeyword = new List <Case>();
	
	set<string> theKeyword = new set<string>();

	for(Case myCase : Trigger.new) {
	// identify how many key words are in the description by looping through them
		for(string nKeyword : keyWords){
			if(myCase.Description != null && myCase.Description.contains(nKeyword) ){
			theKeyword.add(nKeyword);
		}	

		}
		for(String K : keyWords){
			if(myCase.Description != null && myCase.Description.contains(K) ){
		 	caseWKeyword.add(myCase);
		
		 System.debug('this case' + myCase.Id  + 'contains');
		  
		 Break;
		 }
			
		}

		}
		// create child case for cases containing Keyword
		for(case newCase : caseWKeyword){
		 
		 Case childCase = new Case ();

		 System.debug('this case ' + childCase.Id  + ' uniquie child case' );
		 childCase.ParentId 						= newCase.Id;
		 childCase.Subject 							= 'CONTAINS SECRET KeyWord ' + theKeyword;
		 childCase.Origin 							= 'phone'; 
		 childCase.Product_Purchase_Data__c         = Date.today();
		 childCase.Product_Total_Warranty_days__c	= 20;
		  
		  
		 insert childCase;
		 }
		}