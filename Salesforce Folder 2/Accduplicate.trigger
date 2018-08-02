trigger Accduplicate on Account (after insert) {
    for(Account acc : Trigger.new){
        Case Mycase = new Case();
        Mycase.OwnerId ='00G7F000001gaPY';
        Mycase.Subject = 'Dedepute';
        Mycase.AccountId=Acc.Id;
        Insert Mycase;
    }

}