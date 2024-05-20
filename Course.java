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
    private boolean subjectActivation;
    private List <Assignment> assignmentList = new ArrayList<>();
    private int numberOfAssignments;
    private String examDate;
    private boolean projectActivation;
    private int numberOfStudents;
    public Course(String courseName, String masterName, int numberOfCredit, boolean subjectActivation, String examDate){
        this.courseName = courseName;
        this.masterName = masterName;
        this.numberOfCredit = numberOfCredit;
        this.subjectActivation = subjectActivation;
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
    public Double maxScore(){
        Double max = 0.0;
        for (Student student : studentsList) {
            if (student.getFinalScore() > max)
                max = student.getFinalScore();
        }
        return max;
    }
    public void printAssingnmentList(){
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

    public void setSubjectActivation(boolean subjectActivation) {
        this.subjectActivation = subjectActivation;
    }

    public void setAssignmentList(List<Assignment> assignmentList) {
        this.assignmentList = assignmentList;
    }

    public void setNumberOfAssignments(int numberOfAssignments) {
        this.numberOfAssignments = numberOfAssignments;
    }

    public void setProjectActivation(boolean projectActivation) {
        this.projectActivation = projectActivation;
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

    public boolean isSubjectActivation() {
        return subjectActivation;
    }

    public boolean isProjectActivation() {
        return projectActivation;
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
