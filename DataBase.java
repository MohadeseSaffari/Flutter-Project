import java.io.*;
import java.util.*;

class DataBase {
    static public int usersChecker(String userID, String password) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("/Users/mohsaffari/IdeaProjects/MiniProject/src/info.txt"));
        String line = reader.readLine();
        int result = 0;
        while (line != null) {
            String[] elements = line.split(" : ");
            if (elements[0].equals(userID)) {
                result = 1;
                if (elements[1].equals(password)) {
                    result = 2;
                    reader.close();
                    return result; // 2 ->  userID and password are correct
                }
                reader.close();
                return result; // 1 -> userID is correct but password is incorrect
            }
            line = reader.readLine();
        }
        reader.close();
        return result; // 0 -> userID is incorrect
    }

    static public String userinfo(String userID) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("/Users/mohsaffari/IdeaProjects/MiniProject/src/info.txt"));
        System.out.println("userInfo Database founded!");
        String line = reader.readLine();
        StringBuilder responseOfRequest = new StringBuilder();
        while (line != null) {
            String[] elements = line.split(" : ");
            if (elements[0].equals(userID)) {
                for (int i = 0; i < elements.length; i++) {
                    responseOfRequest.append(elements[i]).append(" : ");
                }
                reader.close();
                return responseOfRequest.toString();
            }
            line = reader.readLine();
        }
        reader.close();
        return "Information of this user is not found!  {userID: " + userID + "}";
    }
}