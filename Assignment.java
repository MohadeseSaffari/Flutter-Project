import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Assignment {
    private String name;
    private Course course;
    private LocalDate deadLine;
    private boolean activation;
    private List <Assignment> archive = new ArrayList<>();
    Assignment(String name, Course course,String deadLine, boolean activation){
        this.name = name;
        this.course = course;
        this.deadLine = LocalDate.parse(deadLine);
        this.activation = activation;
    }
    public void setDeadLine(){
        Scanner scanner = new Scanner(System.in);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        System.out.println("Enter the homework deadline (yyyy-MM-dd HH:mm): ");
        String deadLine = scanner.nextLine();
        LocalDateTime deadline = LocalDateTime.parse(deadLine, formatter);
    }
    public int TimeLeft(){
        LocalDate currentTime = LocalDate.now();
        Period period = Period.between(deadLine,currentTime);
        return period.getDays();
    }
    public void check(){
        for (int i =0; i < course.getNumberOfAssignments();i++) {
            if (course.getAssignmentList().get(i).TimeLeft() == 0) {
                activation = false;
                archive.add(course.getAssignmentList().get(i));
                System.out.println("Dead Line of this assignment has ended");
            }
        }
    }
    public void changeDeadline(String newDeadLine, Course course, Teacher teacher){
        if (teacher.getCourseProvideslist().contains(course)){
            this.deadLine = LocalDate.parse(newDeadLine);
        }
        else
            System.out.println(course.getCourseName() + " doesn't teach by " + teacher.getFirstname() + " " + teacher.getLastname() );
    }

    public void setActivation(boolean activation) {
        this.activation = activation;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCourse(Course course) {
        this.course = course;
    }


    public boolean isActivation() {
        return activation;
    }

    public String getName() {
        return name;
    }

    public Course getCourse() {
        return course;
    }

}
