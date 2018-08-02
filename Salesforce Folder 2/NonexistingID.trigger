trigger NonexistingID on Case (after insert) {

    for(case Mycase: Trigger.new){
        CaseComment cc = new CaseComment();
        cc.CommentBody='Bibi made this commoment';
        cc.ParentId = Mycase.Id;
        insert cc;
        opportunity opp = new opportunity();
        opp.AccountId = Mycase.AccountId;
        Opp.Name ='Bb did it';
        opp.CloseDate= Date.today();
        Opp.StageName='new';
        insert opp;
    
    
    }

}