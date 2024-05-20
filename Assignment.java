import java.time.Duration;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class Assignment {
    private String name;
    private Course course;
    private String deadLine;
    private boolean activation;
    private List <Assignment> archive = new ArrayList<>();
    private List <Assignment> assignmentList = new ArrayList<>();
    Assignment(String name, Course course,String deadLine, boolean activation){
        this.name = name;
        this.course = course;
        this.deadLine = deadLine;
        this.activation = activation;
    }
    public int TimeLeft(){
        LocalDate currentTime = LocalDate.now();
        Period period = Period.between(LocalDate.parse(deadLine),currentTime);
        return period.getDays();
    }
    public void check(){
        for (Assignment assignment : assignmentList) {
            if (TimeLeft() == 0) {
                activation = false;
                archive.add(assignment);
            }
        }
    }
    public void changeDeadline(String newDeadLine, Course course, Teacher teacher){
        if (teacher.getCourseProvideslist().contains(course)){
            deadLine = newDeadLine;
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
