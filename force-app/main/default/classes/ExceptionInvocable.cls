public with sharing class ExceptionInvocable {
    @InvocableMethod(label='Throw Exception' 
        description='throws an exception'
        category='Exception')
    public static void throwException(List<String> exceptions) {
        throw new CustomException(exceptions[0]);
    }

    public class CustomException extends Exception { }
}
