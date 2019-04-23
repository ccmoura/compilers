package stack.machine;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Scanner;

public class StackMachine {

    public static void main(String[] args) {
        StringQueue queue = new StringQueue();
        
        try (BufferedReader br = new BufferedReader(new FileReader(args[0]))) {
            String[] vSplit = new String[2];
            String line = br.readLine();
            while (line != null) {
                try {
                    vSplit = line.split(" ");
                    queue.enqueue(vSplit[0] + "," + vSplit[1]);
                } catch (Exception e) {
                    String split = line;
                    queue.enqueue(split);
                }
                line = br.readLine();
            }
        } catch (IOException e) {
            System.out.println("Error: " + e.getMessage());
        }
        queue.processStack();
    }

}
