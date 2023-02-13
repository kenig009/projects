import java.util.Scanner;
import java.io.*;

public class HashTable<T>{
 String type = "";
 NGen<T> [] table;
public HashTable(int size, String type){
  table = new NGen [size];
  this.type = type;
}
public void readText(String filename){
  Scanner readFile = null;
  String s;
  int count = 0;

  try {
      readFile = new Scanner(new File(filename));
  }
  catch (FileNotFoundException e) {
      System.out.println("File: " + filename + " not found");
      System.exit(1);
  }

  while (readFile.hasNext()) {
      s = readFile.next();
      add((T)s);
      count++;
  }

}


public void add(T item){
  int place = 0;
  boolean chc = false;
  NGen<T> ptr;
if(type.equals("general")){
  place = hash2(item);
  if(table[place] == null){
    table[place] = new NGen<T>(item,null);
  }else{
    if(table[place].getNext() == null){
        if (!item.equals(table[place].getData())){
        table[place].setNext(new NGen<T>(item,null));
        }
      }else{
        ptr = table[place];
        while(ptr.getNext() != null){
          if(item.equals(ptr.getData())){
            chc = true;
          }
          ptr = ptr.getNext();
        }
        if (chc == false){
          ptr.setNext(new NGen<T>(item,null));
        }
      }

  }
}else{
  place = hash2(item);
  if(table[place] == null){
    table[place] = new NGen<T>(item,null);
  }else{
    if(table[place].getNext() == null){
        if (!item.equals(table[place].getData())){
        table[place].setNext(new NGen<T>(item,null));
        }
      }else{
        ptr = table[place];
        while(ptr.getNext() != null){
          if(item.equals(ptr.getData())){
            chc = true;
          }
          ptr = ptr.getNext();
        }
        if (chc == false){
          ptr.setNext(new NGen<T>(item,null));
        }
      }
  }
}
}


private int hash1(T key){ //average collusion was 3 longest chain was 19
  if (key.toString().length() == 1){
    return key.toString().charAt(0) % table.length;
  }else{
    return ((10*key.toString().charAt(0)) + key.toString().charAt(1)) % table.length;
  }

}

private int hash2(T key){ //average collusion was 2, longest chain was 8. This one seems to be the best.
  if (key.toString().length() == 1){
    return key.toString().charAt(0) % table.length;
  } else{
    return ((10*key.toString().charAt(0)) + key.toString().substring(key.toString().length() - 1).charAt(0)) % table.length;
  }

}

private int hash3(T key){ // average collusion was 2, longest chain was 9
  if (key.toString().length() == 1){
    return key.toString().charAt(0) % table.length;
  } else{
    return ((10*key.toString().charAt(0)) + key.toString().substring(key.toString().length()/2).charAt(0)) % table.length;
  }
}

public void display(){
  int longest = 0;
  int non_empty = 0;
  int unique = 0;
  int tem = 0;
  int avg = 0;
  int empty = 0;
  NGen<T> ptr;
  for (int i = 0; i < table.length; i++){
    if(table[i] == null){
      empty +=1;
      System.out.println(i + ": 0");
    } else if (table[i].getNext() != null){
      non_empty +=1;
      unique += 1;
      tem = 1;
      ptr = table[i];
      while(ptr.getNext() != null){
        tem +=1;
        unique += 1;
        ptr = ptr.getNext();
      }
      System.out.println(i + ": " + tem);
      if(tem>longest){
        longest = tem;
      }
    } else {
      unique +=1;
      non_empty +=1;
      System.out.println(i + ": 1");
    }
  }
  avg = unique/non_empty;
 System.out.println("average collision length: " + avg);
 System.out.println("longest chain: " + longest);
 System.out.println("unique tokens: " + unique);
 System.out.println("empty indices: " + empty);
 System.out.println("non-empty indices: " + non_empty);
}

public static void main(String args[]){
  Scanner r = new Scanner(System.in);
  System.out.println("What type of file is it? general or specific");
  String choice = r.nextLine();
  HashTable<String> bro;
  if(choice.equals("specific")){
    bro = new HashTable(500, choice);
    bro.readText("keywords.txt");
    bro.display();
  }else{
  bro = new HashTable(100, choice);
  bro.readText("gettysburg.txt");
  bro.display();
}
}
}
