import java.util.*;
import java.util.Scanner;
public class Main {
public static void main(String[] args){Course AP = new Course("Ap","vahidi", 3, true, "20/12/1402");
    Course dif = new Course("Dif", "mitra",3, true,"13/11/1402");
    Course Ap = new Course("Ap", "Vahidi", 3, true,"-");
    Course math = new Course("math","rahimi",3,true,"21/7/1402");
    Teacher Vahidi = new Teacher("Vahid", "vahidi");
    Teacher Hoseini = new Teacher("mohammad", "Hoseini");
    Teacher Rahimi = new Teacher("sadegh","Rahimi");
    Teacher Hassani = new Teacher("mitra", "Hassani");
    Student Moh = new Student("Mohadese", "79");
    Student Zahra = new Student("Zahra", "67");
    Assignment a1 = new Assignment("first ap assignment", AP, "20/4/2024", true);
    Assignment a2 = new Assignment("second dif assignment", dif, "12/4/2024", false);
   Vahidi.addCourse(AP);
   Rahimi.addCourse(math);
   Vahidi.addStudent(AP,Zahra);
   Rahimi.addStudent(math,Zahra);
   Zahra.score(19.5,Ap);
   Zahra.score(15.75,math);
   Zahra.printListOfCourses();
   Vahidi.addScore(Zahra,19.0,Ap);




}
}
