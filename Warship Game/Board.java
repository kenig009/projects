import java.util.Random;

public class Board{

Cells[][] board;
Boat[] boats;
int turns = 0;
int power;
char type;
int num_board;
char [][] p_b;
int [] len;
int right;

public int get_power(){
  return power;
}


public void beginner(){ //this is where I would populize boat with char B
  board = new Cells[3][3];
  power = 1;
  type = 'b';
  num_board = 2;
  for (int i = 0; i < 3; i ++){
    for (int o = 0; o < 3; o ++){
      Cells thing = new Cells(i,o,'-');
      board[i][o] = thing;
    }
}
}

public Cells[][] get_board(){
  return board;
}

public void Intermediate(){
  power = 3;
  board = new Cells[6][6];
  type = 'i';
  num_board = 9;
  for (int i = 0; i < 6; i ++){
    for (int o = 0; o < 6; o ++){
      Cells thing = new Cells(i,o,'-');
      board[i][o] = thing;
    }
}

}

public void Expert(){
  power = 5;
  board = new Cells[9][9];
  type = 'e';
  num_board = 17;
  for (int i = 0; i < 9; i ++){
    for (int o = 0; o < 9; o ++){
      Cells thing = new Cells(i,o,'-');
      board[i][o] = thing;
    }
}

}

public void fire(int x, int y){
  if(x<0 || x>board[0].length-1 || y<0 || y>board[0].length-1){
    System.out.println("Out of Borders");
  }
  else if (board[x][y].get_status() == 'B'){
    System.out.println("That's a hit at " + x + ", " + y);
    board[x][y].set_status('H');
    p_b[x][y] = 'H';
    num_board -= 1;
    turns +=1;
  }
  else if (board[x][y].get_status() == '-'){
    System.out.println("You missed!");
    board[x][y].set_status('M');
    p_b[x][y] = 'M';
    turns +=1;
  }
  else if (board[x][y].get_status() == 'H'){
    System.out.println("You alredy hit that dummy!");
    turns +=1;
  }
  else if (board[x][y].get_status() == 'M'){
    System.out.println("Damn, missed twice at the same spot. Tough!");
    turns +=1;
  }
}

public void missile(int x, int y){
  int stop = 0;
  if (power == 0){
    System.out.println("Out of power:/");
  }else{
  if(x<0 || x>board[0].length-1 || y<0 || y>board[0].length-1){
    System.out.println("Out of Borders");
    stop = 1;
  }else{
  power-=1;
  fire(x,y);
}
  if(x+1<0 || x+1>board[0].length-1 || y<0 || y>board[0].length-1 || stop == 1){

  }else{
  fire(x+1,y);
  turns -=1;
}
  if(x-1<0 || x-1>board[0].length-1 || y<0 || y>board[0].length-1 || stop == 1){

  }else{
  fire(x-1,y);
  turns -=1;
}
if(x<0 || x>board[0].length-1 || y+1<0 || y+1>board[0].length-1 || stop == 1){

}else{
  fire(x,y+1);
  turns -=1;
}
if(x<0 || x>board[0].length-1 || y-1<0 || y-1>board[0].length-1 || stop == 1){

}else{
  fire(x,y-1);
  turns -=1;
}
if(x-1<0 || x-1>board[0].length-1 || y-1<0 || y-1>board[0].length-1 || stop == 1){

}else{
  fire(x-1,y-1);
  turns -=1;
}
if(x+1<0 || x+1>board[0].length-1 || y+1<0 || y+1>board[0].length-1 || stop == 1){

}else{
  fire(x+1,y+1);
  turns -=1;
}
if(x+1<0 || x+1>board[0].length-1 || y-1<0 || y-1>board[0].length-1 || stop == 1){

}else{
  fire(x+1,y-1);
  turns -=1;
}
if(x-1<0 || x-1>board[0].length-1 || y+1<0 || y+1>board[0].length-1 || stop == 1){

}else{
  fire(x-1,y+1);
  turns -=1;
}
}
}

public void drone(){
  if (power == 0){
    System.out.println("Out of power:/");
  }else{
  int choice;
  int num;
  int num_b = 0;
  Random rad = new Random();
  choice = rad.nextInt(2);
  num = rad.nextInt(board[0].length);
if(choice == 0){
  for (int i = 0; i<board[0].length; i++){
    if (board[num][i].get_status() == 'B'){
      num_b +=1;
    }
    }
    System.out.println("There are " + num_b + " boats in the row " + num);
    power-=1;
    turns +=1;
  }

  if(choice == 1){
    for (int i = 0; i<board[0].length; i++){
    if (board[i][num].get_status() == 'B'){
      num_b +=1;
    }
    }
    System.out.println("There are " + num_b + " boats in the colum " + num);
    power-=1;
    turns +=1;
  }
}
}
public void sub(int x, int y){
  if (power == 0){
    System.out.println("Out of power:/");
  }else{
  if(x<0 || x>board[0].length-1 || y<0 || y>board[0].length-1){
    System.out.println("Out of Borders");
  } else{
    if(board[x][y].get_status() == 'B'){
      for (int i = 0; i < boats.length; i++){
          boolean g = boats[i].get_direction();
          if(g == true){
            for(int o = 0; o < boats[i].get_length(); o++){
              if((boats[i].get_start_x()+o == x && boats[i].get_start_y() == y)){
                for(int t = 0; t < boats[i].get_length(); t++){
                board[boats[i].get_start_x()+t][boats[i].get_start_y()].set_status('H');
                num_board-=boats[i].get_length();
                right = i;
              }
              System.out.println("Nice hit! That boat is sunk.");
              turns +=1;
              power-=1;
              num_board-=boats[right].get_length();
              }
            }
          }
          if(g == false){
            for(int o = 0; o < boats[i].get_length(); o++){
              if((boats[i].get_start_y()+o == y && boats[i].get_start_x() == x)){
                for(int t = 0; t < boats[i].get_length(); t++){
                board[boats[i].get_start_x()][boats[i].get_start_y()+t].set_status('H');
                right = i;
              }
              System.out.println("Nice hit! That boat is sunk.");
              turns +=1;
              power-=1;
              num_board-=boats[right].get_length();
              }
            }
          }
      }

    }
    else if(board[x][y].get_status() == 'H'){
      System.out.println("Already tried it");
    }
    else{
      System.out.println("Ya missed. That's an L");
    }
  }
}
}

public void display_all(){
  if(type == 'b'){
  char [][] temp = new char [3][3];
  for (int i = 0; i < 3; i ++){
    for (int o = 0; o < 3; o ++){
      temp[i][o] = board[i][o].get_status();
  }
  }
  for (int i = 0; i < 3; i ++){
    System.out.println(temp[i]);
  }
}
if(type == 'i'){
  char [][] temp = new char [6][6];
  for (int i = 0; i < 6; i ++){
    for (int o = 0; o < 6; o ++){
      temp[i][o] = board[i][o].get_status();
  }
  }
  for (int i = 0; i < 6; i ++){
    System.out.println(temp[i]);
  }
}
if(type == 'e'){
  char [][] temp = new char [9][9];
  for (int i = 0; i < 9; i ++){
    for (int o = 0; o < 9; o ++){
      temp[i][o] = board[i][o].get_status();
  }
  }
  for (int i = 0; i < 9; i ++){
    System.out.println(temp[i]);
  }
}
}


public void player_board(){
  if(type == 'b'){
  p_b = new char [3][3];
  for (int i = 0; i < 3; i ++){
    for (int o = 0; o < 3; o ++){
      p_b[i][o] = '-';
  }
  }
}
if(type == 'i'){
  p_b = new char [6][6];
  for (int i = 0; i < 6; i ++){
    for (int o = 0; o < 6; o ++){
      p_b[i][o] = '-';
  }
  }

}
if(type == 'e'){
  p_b = new char [9][9];
  for (int i = 0; i < 9; i ++){
    for (int o = 0; o < 9; o ++){
      p_b[i][o] = '-';
  }
  }
}
}

public void display(){
  if(type == 'b'){
  for (int i = 0; i < 3; i ++){
      System.out.println(p_b[i]);
  }
}
if(type == 'i'){
  for (int i = 0; i < 6; i ++){
      System.out.println(p_b[i]);
  }

}
if(type == 'e'){
  for (int i = 0; i < 9; i ++){
    System.out.println(p_b[i]);
  }
}
}

public int get_num_board(){
  return num_board;
}


public int get_turns(){
  return turns;
}

public void place_boats_b(){
      len = new int[1];
    len[0] = 2;
    boats = new Boat[1];
for(int i = 0; i<len.length; i ++){
  int stopper=0;
  while(stopper!=1){
    Random rad = new Random();
    int rand_row = rad.nextInt(3);
    int rand_col = rad.nextInt(3);
    int rand_dir = rad.nextInt(2);
    boolean a;
    if (rand_dir == 0){
      a = true;
    }else{
      a = false;
    }
    Boat g = new Boat(2,rand_row,rand_col,a);
    if (a==true && rand_row<2){
      boats[i] = g;
      board[rand_row][rand_col].set_status('B');
      board[rand_row+1][rand_col].set_status('B');
      stopper+=1;
    }
    if (a==false && rand_col<2){
      boats[i] = g;
      board[rand_row][rand_col].set_status('B');
      board[rand_row][rand_col+1].set_status('B');
      stopper+=1;
    }
    }
  }

}


public void place_boats_i(){
      len = new int[3];
    len[0] = 2;
    len[1] = 3;
    len[2] = 4;
    boats = new Boat[3];
    for(int i = 0; i<3; i++){
      int stopper=0;
      while(stopper!=1){
        Random rad = new Random();
        int rand_row = rad.nextInt(6);
        int rand_col = rad.nextInt(6);
        int rand_dir = rad.nextInt(2);
        boolean a;
        if (rand_dir == 0){
          a = true;
        }else{
          a = false;
        }
        Boat g = new Boat(len[i],rand_row,rand_col,a);
        if (g.get_length() == 2){
          if (a==true && rand_row<5){
              if (board[rand_row][rand_col].get_status() != 'B'
              && board[rand_row+1][rand_col].get_status() != 'B'){
                boats[i] = g;
                board[rand_row][rand_col].set_status('B');
                board[rand_row+1][rand_col].set_status('B');
                stopper+=1;
              }
          }
          if (a==false && rand_col<5){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row][rand_col+1].get_status() != 'B'){
            boats[i] = g;
            board[rand_row][rand_col].set_status('B');
            board[rand_row][rand_col+1].set_status('B');
            stopper+=1;
          }
          }
        }
        if (g.get_length() == 3){
          if (a==true && rand_row<4){
              if (board[rand_row][rand_col].get_status() != 'B'
              && board[rand_row+1][rand_col].get_status() != 'B'
              && board[rand_row+2][rand_col].get_status() != 'B'){
                boats[i] = g;
                board[rand_row][rand_col].set_status('B');
                board[rand_row+1][rand_col].set_status('B');
                board[rand_row+2][rand_col].set_status('B');
                stopper+=1;
              }
          }
          if (a==false && rand_col<4){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row][rand_col+1].get_status() != 'B'
            && board[rand_row][rand_col+2].get_status() != 'B'){
            boats[i] = g;
            board[rand_row][rand_col].set_status('B');
            board[rand_row][rand_col+1].set_status('B');
            board[rand_row][rand_col+2].set_status('B');
            stopper+=1;
          }
          }
        }
        if (g.get_length() == 4){
          if (a==true && rand_row<3){
              if (board[rand_row][rand_col].get_status() != 'B'
              && board[rand_row+1][rand_col].get_status() != 'B'
              && board[rand_row+2][rand_col].get_status() != 'B'
              && board[rand_row+3][rand_col].get_status() != 'B'){
                boats[i] = g;
                board[rand_row][rand_col].set_status('B');
                board[rand_row+1][rand_col].set_status('B');
                board[rand_row+2][rand_col].set_status('B');
                board[rand_row+3][rand_col].set_status('B');
                stopper+=1;
              }
          }
          if (a==false && rand_col<3){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row][rand_col+1].get_status() != 'B'
            && board[rand_row][rand_col+2].get_status() != 'B'
            && board[rand_row][rand_col+3].get_status() != 'B'){
            boats[i] = g;
            board[rand_row][rand_col].set_status('B');
            board[rand_row][rand_col+1].set_status('B');
            board[rand_row][rand_col+2].set_status('B');
            board[rand_row][rand_col+3].set_status('B');
            stopper+=1;
          }
          }
        }

      }

}
}
public void place_boats_e(){
  len = new int[5];
  len[0] = 2;
  len[1] = 3;
  len[2] = 4;
  len[3] = 5;
  len[4] = 3;
  boats = new Boat[5];
  for(int i = 0; i<5; i++){
    int stopper=0;
    while(stopper!=1){
      Random rad = new Random();
      int rand_row = rad.nextInt(9);
      int rand_col = rad.nextInt(9);
      int rand_dir = rad.nextInt(2);
      boolean a;
      if (rand_dir == 0){
        a = true;
      }else{
        a = false;
      }
      Boat g = new Boat(len[i],rand_row,rand_col,a);
      if (g.get_length() == 2){
        if (a==true && rand_row<8){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row+1][rand_col].get_status() != 'B'){
              boats[i] = g;
              board[rand_row][rand_col].set_status('B');
              board[rand_row+1][rand_col].set_status('B');
              stopper+=1;
            }
        }
        if (a==false && rand_col<8){
          if (board[rand_row][rand_col].get_status() != 'B'
          && board[rand_row][rand_col+1].get_status() != 'B'){
          boats[i] = g;
          board[rand_row][rand_col].set_status('B');
          board[rand_row][rand_col+1].set_status('B');
          stopper+=1;
        }
        }
      }
      if (g.get_length() == 3){
        if (a==true && rand_row<7){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row+1][rand_col].get_status() != 'B'
            && board[rand_row+2][rand_col].get_status() != 'B'){
              boats[i] = g;
              board[rand_row][rand_col].set_status('B');
              board[rand_row+1][rand_col].set_status('B');
              board[rand_row+2][rand_col].set_status('B');
              stopper+=1;
            }
        }
        if (a==false && rand_col<7){
          if (board[rand_row][rand_col].get_status() != 'B'
          && board[rand_row][rand_col+1].get_status() != 'B'
          && board[rand_row][rand_col+2].get_status() != 'B'){
          boats[i] = g;
          board[rand_row][rand_col].set_status('B');
          board[rand_row][rand_col+1].set_status('B');
          board[rand_row][rand_col+2].set_status('B');
          stopper+=1;
        }
        }
      }
      if (g.get_length() == 4){
        if (a==true && rand_row<6){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row+1][rand_col].get_status() != 'B'
            && board[rand_row+2][rand_col].get_status() != 'B'
            && board[rand_row+3][rand_col].get_status() != 'B'){
              boats[i] = g;
              board[rand_row][rand_col].set_status('B');
              board[rand_row+1][rand_col].set_status('B');
              board[rand_row+2][rand_col].set_status('B');
              board[rand_row+3][rand_col].set_status('B');
              stopper+=1;
            }
        }
        if (a==false && rand_col<6){
          if (board[rand_row][rand_col].get_status() != 'B'
          && board[rand_row][rand_col+1].get_status() != 'B'
          && board[rand_row][rand_col+2].get_status() != 'B'
          && board[rand_row][rand_col+3].get_status() != 'B'){
          boats[i] = g;
          board[rand_row][rand_col].set_status('B');
          board[rand_row][rand_col+1].set_status('B');
          board[rand_row][rand_col+2].set_status('B');
          board[rand_row][rand_col+3].set_status('B');
          stopper+=1;
        }
        }
      }
      if (g.get_length() == 5){
        if (a==true && rand_row<5){
            if (board[rand_row][rand_col].get_status() != 'B'
            && board[rand_row+1][rand_col].get_status() != 'B'
            && board[rand_row+2][rand_col].get_status() != 'B'
            && board[rand_row+3][rand_col].get_status() != 'B'
            && board[rand_row+4][rand_col].get_status() != 'B'){
              boats[i] = g;
              board[rand_row][rand_col].set_status('B');
              board[rand_row+1][rand_col].set_status('B');
              board[rand_row+2][rand_col].set_status('B');
              board[rand_row+3][rand_col].set_status('B');
              board[rand_row+4][rand_col].set_status('B');
              stopper+=1;
            }
        }
        if (a==false && rand_col<5){
          if (board[rand_row][rand_col].get_status() != 'B'
          && board[rand_row][rand_col+1].get_status() != 'B'
          && board[rand_row][rand_col+2].get_status() != 'B'
          && board[rand_row][rand_col+3].get_status() != 'B'
          && board[rand_row][rand_col+4].get_status() != 'B'){
          boats[i] = g;
          board[rand_row][rand_col].set_status('B');
          board[rand_row][rand_col+1].set_status('B');
          board[rand_row][rand_col+2].set_status('B');
          board[rand_row][rand_col+3].set_status('B');
          board[rand_row][rand_col+4].set_status('B');
          stopper+=1;
    }

}
}
}
}
}
}
