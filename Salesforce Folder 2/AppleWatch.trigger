trigger AppleWatch on Opportunity (after insert) {
    for(Opportunity opp: Trigger.new){
        Task t = new Task();
        t.Subject     ='Apple Watch Promo';
        t.Description ='Send the one ASAP';
        t.Priority    ='High';
        t.WhatId     = opp.Id;
        Insert t;
    
    
    }
    
    


}