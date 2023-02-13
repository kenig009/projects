public class Boat{

int length;
int start_x;
int start_y;
boolean direction;

public Boat(int length, int start_x, int start_y, boolean direction){
this.length = length;
this.start_x = start_x;
this.start_y = start_y;
this.direction = direction;

}

public void set_start_x(int c){
  start_x = c;
}

public void set_start_y(int c){
  start_y = c;
}

public void set_direction(boolean c){
  direction = c;
}

public int get_start_x(){
  return start_x;
}

public int get_start_y(){
  return start_y;
}

public boolean get_direction(){
  return direction;
}

public int get_length(){
  return length;
}

}
