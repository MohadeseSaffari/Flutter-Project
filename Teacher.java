import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class Teacher {
    private String firstname;
    private String lastname;
    private int NumberOfCourseProvides;
    private List <Course> CourseProvideslist = new ArrayList<>();
    private List <Student> studentList = new ArrayList<>();
    Scanner scanner = new Scanner(System.in);
    public Teacher(String firstname, String lastname){
        this.firstname = firstname;
        this.lastname = lastname;
    }
    public void addCourse(Course course){
        CourseProvideslist.add(course);
        NumberOfCourseProvides++;
        System.out.println(course.getCourseName() + " has been successfully added");
    }
    public void addStudent(Course course,Student newStudent){
        if (this.CourseProvideslist.contains(course)) {
            studentList.add(newStudent);
            newStudent.participateInCourse(course);
            System.out.println("Student" + " " + newStudent.getName() + " added to the class " + course.getCourseName());
        }
        else
            System.out.println(this.getLastname() + " doesn't teach " + course.getCourseName());
    }
    public void removeStudent(Student student, Course course) {
        if (student.getCourseIntegerMap().containsKey(course)) {
            studentList.remove(student);
            student.leftTheCourse(course);
            System.out.println("Student" + " " + student.getName() + " removed from class");
        }
    }
    public void addScore(Student student,Double score,Course course){
            student.setFinalScore(score,course);
    }
    public void setAssignment(Course course, Assignment assignment){
        if (this.getCourseProvideslist().contains(course) && course.isSubjectActivation()){
            course.getAssignmentList().add(assignment);
            System.out.println(assignment.getName() + " has been set.");
        }
        else if (!this.getCourseProvideslist().contains(course))
            System.out.println(this.getFirstname() + " " + this.getLastname() + " doesn't teach this course.");
        else
            System.out.println("This is an inactive subject");
    }
    public void removeAssignment(Course course, Assignment assignment, Teacher teacher){
        if (teacher.getCourseProvideslist().contains(course) && course.isSubjectActivation()){
            course.getAssignmentList().remove(assignment);
            System.out.println(assignment.getName() + " has been removed.");
        }
        else if (!teacher.getCourseProvideslist().contains(course))
            System.out.println(teacher.getFirstname() + " " + teacher.getLastname() + " doesn't teach this course.");
        else
            System.out.println("This is an inactive subject");
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public void setNumberOfCourseProvides(int numberOfCourseProvides) {
        NumberOfCourseProvides = numberOfCourseProvides;
    }

    public void setCourseProvideslist(List<Course> courseProvideslist) {
        CourseProvideslist = courseProvideslist;
    }

    public void setStudentList(List<Student> studentList) {
        this.studentList = studentList;
    }

    public String getFirstname() {
        return firstname;
    }

    public String getLastname() {
        return lastname;
    }


    public int getNumberOfCourseProvides() {
        return NumberOfCourseProvides;
    }

    public List<Course> getCourseProvideslist() {
        return CourseProvideslist;
    }

    public List<Student> getStudentList() {
        return studentList;
    }
}
