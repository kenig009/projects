public class Cells{

private int row = 0;
private int col = 0;
private char status = '-';


public Cells(int row, int col, char status){
  this.row = row;
  this.col = col;
  this.status = status;
}


public char get_status(){
  return status;
}

public void set_status(char c){
  status = c;
}

public int get_row(){
  return row;
}

public int get_col(){
  return col;
}

public void set_row(int c){
  row = c;
}

public void set_col(int c){
  col = c;
}

}
