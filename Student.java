import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Student {
    private String name;
    private String id;
    private int NumberOfSubject;
    private int NumberOfCredits;
    private int NumberOfCourses = 0;
    private String password;
    private Map <Course, Double> courseIntegerMap = new HashMap<>();
    private double FinalScore;
    private double TotalAverage;
    private double CurrentAverage;
    Student(String id, String password){
        this.id = id;
        this.password = password;
    }
    public void participateInCourse(Course course) {
        if (!this.getCourseIntegerMap().containsKey(course)) {
            courseIntegerMap.put(course, null);
            NumberOfCourses++;
            NumberOfCredits += course.getNumberOfCredit();
            System.out.println("student with id " + this.getId() + " has participate in " + course.getCourseName());
        }
    }
    public void leftTheCourse(Course course) {
        if (this.getCourseIntegerMap().containsKey(course)) {
            courseIntegerMap.remove(course);
            NumberOfCourses--;
            NumberOfCredits -= course.getNumberOfCredit();
            System.out.println("student with id " + this.getId() + " has left the " + course.getCourseName());
        }
    }

    public void printListOfCourses(){
        courseIntegerMap.forEach((course, integer) -> {
            System.out.println(course.getCourseName());
        });
    }
    public double printCurrentAverage(){
        double sum = 0;
        for (Double value : courseIntegerMap.values()){
            sum+=value;
        }
        CurrentAverage = sum /this.NumberOfCourses;
            return CurrentAverage;
    }
    public void printNumberOfCredits(){
        System.out.println(NumberOfCredits);
    }
    public void score(Double score, Course course){
        FinalScore += score;
        courseIntegerMap.put(course, FinalScore);
    }
    public void setFinalScore(Double finalScore, Course course){
        courseIntegerMap.put(course, finalScore);
    }
        public void setName(String name) {
        this.name = name;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNumberOfCredits(int numberOfCredits) {
        NumberOfCredits = numberOfCredits;
    }

    public void setNumberOfCourses(int numberOfCourses) {
        NumberOfCourses = numberOfCourses;
    }


    public void setCurrentAverage(double currentAverage) {
        CurrentAverage = currentAverage;
    }

    public void setFinalScore(Double finalScore) {
        FinalScore = finalScore;
    }

    public void setTotalAverage(double totalAverage) {
        TotalAverage = totalAverage;
    }

    public void setNumberOfSubject(int numberOfSubject) {
        NumberOfSubject = numberOfSubject;
    }

    public String getName() {
        return name;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public String getId() {
        return id;
    }

    public int getNumberOfCredits() {
        return NumberOfCredits;
    }

    public Double getFinalScore() {
        return FinalScore;
    }

    public int getNumberOfCourses() {
        return NumberOfCourses;
    }

    public int getNumberOfSubject() {
        return NumberOfSubject;
    }

    public double getCurrentAverage() {
        return CurrentAverage;
    }

    public double getTotalAverage() {
        return TotalAverage;
    }

    public Map<Course, Double> getCourseIntegerMap() {
        return courseIntegerMap;
    }
}
