trigger WarrentySummary on Case (before insert) {
	For(case myCase : trigger.new){

		String purchaseDate         	    = myCase.Product_Purchase_Data__c.format();
		String createdDate       		    = Datetime.now().format();
		Decimal totalWarrantyDays 		    = myCase.Product_Total_Warranty_days__c;
		Decimal warrentyPercent   		    = (100*(myCase.Product_Purchase_Data__c.daysBetween(Date.today())/totalWarrantyDays)).setScale(0);
		boolean hasExtendedWarranty         = myCase.Product_Has_Extended_Warranty__c;
		myCase.Warranty_Summary__c          = 'product purchased on '+ purchaseDate + ' and case was created on '
								   + createdDate +' warranty is for ' + totalWarrantyDays +
								   ' days and is ' + warrentyPercent + '% through its warranty period.'+'/n ' +
								   'Extended Warranty:' + hasExtendedWarranty;
	}

}