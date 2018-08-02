trigger HelloWorld on Lead (before Update) {
    for (Lead a : Trigger.new){
    a.FirstName ='Hello';
    a.LastName = 'World';

}
}