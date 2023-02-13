import java.util.Scanner;
public class Game{
  String dif;
  String selection;

public static void main(String[] args){
Game here_we_go = new Game();
Scanner myScanner1 = new Scanner(System.in);
System.out.println("What mode do you want to play? Debug or Normal?");
String ch = myScanner1.nextLine();
if (ch.equals("Normal")){
here_we_go.normal();
}
if (ch.equals("Debug")){
  here_we_go.debug();
}
}

public void normal(){
  Board player = new Board();
  Scanner myScanner = new Scanner(System.in);
  System.out.println("What difficulty are we playing? Beginner, Intermediate, or Expert?");
  String dif = myScanner.nextLine();
if (dif.equals("Beginner")){
  player.beginner();
  player.place_boats_b();
  player.player_board();
}
if (dif.equals("Intermediate")){
  player.Intermediate();
  player.place_boats_i();
  player.player_board();
}
if (dif.equals("Expert")){
  player.Expert();
  player.place_boats_e();
  player.player_board();
}
while(player.get_num_board()>0){
player.display();
System.out.println("Do you want to do a noraml attack or use a missile or use a drone or use a submarine?");
 selection = myScanner.nextLine();
if(selection.equals("attack")){
  System.out.println("What row do you want to attack?");
  int r = myScanner.nextInt();
  System.out.println("What column do you want to attack?");
  int c = myScanner.nextInt();
  player.fire(r,c);
}
if(selection.equals("missile")){
  System.out.println("Where are we firing a missile captain? What is the row? ");
  int r = myScanner.nextInt();
  System.out.println("What is the column?");
  int c = myScanner.nextInt();
  player.missile(r,c);
}
if(selection.equals("drone")){
  System.out.println("Drone is scanning... \n Here are the results:");
  player.drone();
}
if(selection.equals("submarine")){
  System.out.println("Where are we directing this submarine? What row?");
  int r = myScanner.nextInt();
  System.out.println("What is the column?");
  int c = myScanner.nextInt();
  player.sub(r,c);
}
selection = "";
}
System.out.println("Game is over camptain. You were able to beat the game in: " + player.get_turns());
player.display_all();


}

public void debug(){
  Board player = new Board();
  Scanner myScanner = new Scanner(System.in);
  System.out.println("What difficulty are we playing? Beginner, Intermediate, or Expert?");
  String dif = myScanner.nextLine();
if (dif.equals("Beginner")){
  player.beginner();
  player.place_boats_b();
  player.player_board();
}
if (dif.equals("Intermediate")){
  player.Intermediate();
  player.place_boats_i();
  player.player_board();
}
if (dif.equals("Expert")){
  player.Expert();
  player.place_boats_e();
  player.player_board();
}
while(player.get_num_board()>0){
player.display_all();
System.out.println("Do you want to do a noraml attack or use a missile or use a drone or use a submarine?");
selection = myScanner.nextLine();
if(selection.equals("attack")){
  System.out.println("What row do you want to attack?");
  int r = myScanner.nextInt();
  System.out.println("What column do you want to attack?");
  int c = myScanner.nextInt();
  player.fire(r,c);
}
if(selection.equals("missile")){
  System.out.println("Where are we firing a missile captain? What is the row? ");
  int r = myScanner.nextInt();
  System.out.println("What is the column?");
  int c = myScanner.nextInt();
  player.missile(r,c);
}
if(selection.equals("drone")){
  System.out.println("Drone is scanning... \n Here are the results:");
  player.drone();
}
if(selection.equals("submarine")){
  System.out.println("Where are we directing this submarine? What row?");
  int r = myScanner.nextInt();
  System.out.println("What is the column?");
  int c = myScanner.nextInt();
  player.sub(r,c);
}
selection = "";
}
System.out.println("Game is over camptain. You were able to beat the game in: " + player.get_turns());
player.display_all();
}

}
