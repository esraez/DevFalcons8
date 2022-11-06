@isTest
public with sharing class StudentCtrlTest {
   @TestSetup
   static void makeData(){
              //1.Prepare DATA(more than 200)
              list<Student__c> listStudent = new list<Student__c>();
              for (Integer i = 0; i < 200; i++) {
                  student__c std = new student__c();
                  std.Student_Name__c = 'Test Student'+i;
                  std.Postal_Code__c = '40000'+i;
                  listStudent.add(std);
              }

              system.debug('size of list = ' + listStudent.size());
              if (!listStudent.isEmpty()) {
                  insert listStudent;
              }
    }
    @isTest
    static void searchStudentsbyPCTest(){
        Test.startTest();
        list<Student__c> students = StudentCtrl.searchStudentbyPostalCodes('40002');
        system.assert(students.size()!=0);
        Test.stopTest();
    }
         
    
   }



