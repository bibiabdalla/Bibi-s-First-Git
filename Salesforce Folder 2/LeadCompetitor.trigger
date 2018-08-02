trigger LeadCompetitor on Opportunity (before insert,before update) {
	For(Opportunity opp : trigger.new){
		// put competitor price in list 
		list<decimal> compitorPrice = new list <Decimal> ();
		
			compitorPrice.add(opp.Competitor_1_Price__c);
			compitorPrice.add(opp.Competitor_2_Price__c);
			compitorPrice.add(opp.Competitor_3_Price__c);

		// put competitor names in list
		list<string> compitorNames = new list <String> ();
		
			compitorNames.add(opp.Competitor_1__c);
			compitorNames.add(opp.Competitor_2__c);
			compitorNames.add(opp.Competitor_3__c);
			

		//create loop to find the position of the lowest price 
		decimal lowestPrice;
		integer lowestPricePosition;
		for(integer i = 0 ; i < compitorPrice.size(); i ++){
			decimal currentPrice = compitorPrice.get(i);
		
			if(lowestPrice == null || currentPrice > lowestPrice ){
				lowestPrice=currentPrice;
				lowestPricePosition =i ;


			}
		}
		// set the lead competitor to competitor with lowest price
		Opp.Leading_Competitor__c = compitorNames.get(lowestPricePosition);
		opp.leading_Competer_Price__c = compitorPrice.get(lowestPricePosition);

		







	}

}