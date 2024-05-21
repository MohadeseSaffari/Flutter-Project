import java.io.*;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.regex.Pattern;

public class Login {
    private static final File file = new File("/Users/mohsaffari/Desktop/info.txt");
    public static void main(String[] args){
        Scanner scanner = new Scanner(System.in);
        boolean isAdmin = false;
        while (!isAdmin){
            System.out.println("1. Teacher");
            System.out.println("2. Student");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":

            }

        }

        boolean exist = false;
        while (!exist){
            System.out.println("chose an option:");
            System.out.println("1. sign up");
            System.out.println("2. login");
            String choice = scanner.nextLine();
            switch (choice){
                case "1":
                SignUp();
                break;
                case "2":
                    LogIn();
                    break;
                default:
                    System.out.println("Invalid choice, Please try again");
            }
        }
        scanner.close();
    }
    private static void SignUp(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter a username");
        String username = scanner.nextLine();
        while (!username.matches("^\\d+$")){
            System.out.println("username should only contains numbers");
            username = scanner.nextLine();
        }
        System.out.println("Enter a password");
        String password = scanner.nextLine();
        while (!password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?!.*" + Pattern.quote(username) + ").{8,}$")){
            System.out.println("Password has at least has 8 characters and contains numbers and both capital and small letters also it shouldn't exactly contains your username");
            password = scanner.nextLine();
        }
        try(BufferedWriter writer = new BufferedWriter(new FileWriter(file,true))) {
            writer.write(username + " : " + password + '\n');
            System.out.println("Sign up successful");
        }catch (IOException e){
            System.out.println("An error occurred while signing up. Please try again");
        }
    }
    private static void LogIn(){
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter your username:");
        String username = scanner.nextLine();
        System.out.println("Enter your password");
        String password = scanner.nextLine();
        try(BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            boolean found = false;
            while ((line = reader.readLine()) != null){
                String[] parts = line.split(":");
                if (username.equals(parts[0]) && password.equals(parts[1])){
                    found = true;
                    System.out.println("Successfully login");
                    break;
                }
            }
            if (!found)
                System.out.println("Incorrect username or password");
        }catch (IOException e){
            System.out.println("An error occurred while logging in. Please try again");
        }
    }
}
