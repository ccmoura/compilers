package stack.machine;

import java.util.ArrayList;
import java.util.List;

public class StringQueue {

    private List<String> queue = new ArrayList<String>();

    public List<String> getQueue() {
        return queue;
    }

    public void enqueue(String element) {
        queue.add(element);
    }
    
    public String dequeue(){
        if(!queue.isEmpty()){
            return queue.remove(0);
        }
        return null;
    }
    
    public void printStack() {
        for (String element : queue) {
            System.out.println(element);
        }
    }
    
    public Integer sub(List<Integer> vector){
        return vector.remove(vector.size()-2) - vector.remove(vector.size()-1);
    }
    
    public Integer div(List<Integer> vector){
        return vector.remove(vector.size()-2) / vector.remove(vector.size()-1);
    }
    
    public Integer mult(List<Integer> vector){
        return vector.remove(vector.size()-2) * vector.remove(vector.size()-1);
    }
    
    public Integer sum(List<Integer> vector){
        return vector.remove(vector.size()-2) + vector.remove(vector.size()-1);
    }
    
    public List<Integer> processStack() {
        String[] vSplit = new String[2];
        String split;
        List<Integer> vector = new ArrayList<Integer>();
        String element;
        while (!queue.isEmpty()) {
            vSplit[0] = "";
            vSplit[1] = "";
            split = "";
            element = this.dequeue();
            if(element.contains(",")){
                vSplit = element.split(",");
            } else{
                split = element;
            }
            if(!split.equals("")){  // split
                if(split.equals("SUM")){
                    vector.add(sum(vector));
                } else if(split.equals("DIV")){
                    vector.add(div(vector));
                } else if(split.equals("SUB")){
                    vector.add(sub(vector));
                } else if(split.equals("MULT")){
                    vector.add(mult(vector));
                } else if(split.equals("PRINT")){
                    System.out.println(vector.get(vector.size()-1));
                }
            } else{                 // vSplit
                vector.add(Integer.parseInt(vSplit[1]));
            }
        }

        return vector;
    }
}
