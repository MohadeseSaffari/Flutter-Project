import java.util.ArrayList;
import java.util.List;
import java.util.*;

public class Teacher {
    private String firstname;
    private String lastname;
    private int NumberOfCourseProvides;
    private List <Course> CourseProvideslist = new ArrayList<>();
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
            course.addStudent(newStudent);
            newStudent.participateInCourse(course);
            System.out.println("Student " + newStudent.getName() + " added to the class " + course.getCourseName());
        } else if (!this.CourseProvideslist.contains(course)) {
            System.out.println(this.getLastname() + " doesn't teach " + course.getCourseName());
        }
        else
            System.out.println("Student " + newStudent.getName() + " is already participate in " + course.getCourseName());
    }
    public void removeStudent(Student student, Course course) {
        if (student.getCourseIntegerMap().containsKey(course) && this.CourseProvideslist.contains(course)) {
            course.removeStudent(student);
            student.leftTheCourse(course);
            System.out.println("Student " + student.getName() + " removed from " + course.getCourseName());
        } else if (!this.CourseProvideslist.contains(course)) {
            System.out.println(this.getLastname() + " doesn't teach " + course.getCourseName());
        } else
            System.out.println("Student " + student.getName() + "doesn't participate in " + course.getCourseName());
    }
    public void addScore(Student student,Double score,Course course){
        if (this.CourseProvideslist.contains(course) && student.getCourseIntegerMap().containsKey(course))
            student.setFinalScore(score,course);
        else if (!this.CourseProvideslist.contains(course)) {
            System.out.println(this.getLastname() + " doesn't teach " + course.getCourseName());
        }
        else
            System.out.println("Student " + student.getName() + "doesn't participate in " + course.getCourseName());
    }
    public void setAssignment(Course course, Assignment assignment){
        if (this.getCourseProvideslist().contains(course) && course.getActivation()){
            course.getAssignmentList().add(assignment);
            System.out.println(assignment.getName() + " has been set.");
        }
        else if (!this.getCourseProvideslist().contains(course))
            System.out.println(this.getFirstname() + " " + this.getLastname() + " doesn't teach this course.");
        else
            System.out.println("This is an inactive subject");
    }
    public void removeAssignment(Course course, Assignment assignment){
        if (this.getCourseProvideslist().contains(course) && course.getActivation()){
            course.getAssignmentList().remove(assignment);
            System.out.println(assignment.getName() + " has been removed.");
        }
        else if (!this.getCourseProvideslist().contains(course))
            System.out.println(this.getFirstname() + " " + this.getLastname() + " doesn't teach this course.");
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
    public void PrintCourse(){
        for (Course course : CourseProvideslist) {
            System.out.println(course.getCourseName());
        }
    }
    public void setCourseProvidesList(List<Course> courseProvideslist) {
        CourseProvideslist = courseProvideslist;
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

    public void setVisible(boolean b) {
    }
}
