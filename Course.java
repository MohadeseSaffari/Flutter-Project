import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Course {
    private String courseName;
    private String masterName;
    private int numberOfCredit;
    private List <Student> studentsList = new ArrayList<>();
    private boolean activation;
    private List <Assignment> assignmentList = new ArrayList<>();
    private int numberOfAssignments;
    private String examDate;
    private List<Assignment> activeProjects = new ArrayList<>();
    private List<Assignment> inactiveProjects = new ArrayList<>();
    private int numberOfStudents;
    public Course(String courseName, String masterName, int numberOfCredit, boolean activation, String examDate){
        this.courseName = courseName;
        this.masterName = masterName;
        this.numberOfCredit = numberOfCredit;
        this.activation = activation;
        this.examDate = examDate;
    }
    public void printStudentsList(){
        for (Student student : studentsList){
            System.out.println(student.getName() + student.getId());
        }
    }
    public void addStudent(Student newstudent){
        studentsList.add(newstudent);
        numberOfStudents++;
        newstudent.participateInCourse(this);
    }
    public void removeStudent(Student s){
        studentsList.remove(s);
        numberOfStudents--;
        s.leftTheCourse(this);
    }
    public void maxScore(){
        double max = 0.0;
        for (Student student : studentsList) {
            double grade = student.getCourseIntegerMap().get(this);
            if (grade > max)
                max = grade;
            System.out.println("Top student is " + student.getName() + " with score " + max);
        }
    }
    public void addAssignment(Assignment assignment){
        assignmentList.add(assignment);
        numberOfAssignments++;
        if (assignment.getCourse().getActivation()){
            activeProjects.add(assignment);
        }
        else
            inactiveProjects.add(assignment);
    }
    public void removeAssignment(Assignment assignment){
        assignmentList.remove(assignment);
        numberOfAssignments--;
    }
    public void printAssignmentList(){
        for (Assignment assignment : assignmentList) {
            System.out.println(assignment.getName());
        }
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setMasterName(String masterName) {
        this.masterName = masterName;
    }

    public void setNumberOfCredit(int numberOfCredit) {
        this.numberOfCredit = numberOfCredit;
    }

    public void setStudentsList(List<Student> studentsList) {
        this.studentsList = studentsList;
    }

    public void setActivation(boolean activation) {
        this.activation = activation;
    }

    public void setAssignmentList(List<Assignment> assignmentList) {
        this.assignmentList = assignmentList;
    }

    public void setNumberOfAssignments(int numberOfAssignments) {
        this.numberOfAssignments = numberOfAssignments;
    }

    public void setNumberOfStudents(int numberOfStudents) {
        this.numberOfStudents = numberOfStudents;
    }

    public String getCourseName() {
        return courseName;
    }

    public String getMasterName() {
        return masterName;
    }

    public int getNumberOfCredit() {
        return numberOfCredit;
    }

    public List<Student> getStudentsList() {
        return studentsList;
    }

    public boolean getActivation(){
        return activation;
    }

    public List<Assignment> getAssignmentList() {
        return assignmentList;
    }

    public int getNumberOfAssignments() {
        return numberOfAssignments;
    }

    public int getNumberOfStudents() {
        return numberOfStudents;
    }
}
