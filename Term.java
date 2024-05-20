import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Term {
    private Map<Course, Teacher>  courseTeacherMap = new HashMap<>();

    public void setCourseTeacherMap(Map<Course, Teacher> courseTeacherMap) {
        this.courseTeacherMap = courseTeacherMap;
    }

    public Map<Course, Teacher> getCourseTeacherMap() {
        return courseTeacherMap;
    }

}
