public class Game
{
  private Grid grid;
  private int userRow;
  private int msElapsed;
  private int timesGet;
  private int timesAvoid;
  
  public Game()
  {
    grid = new Grid(15,20);
    userRow = 0;
    msElapsed = 0;
    timesGet = 0;
    timesAvoid = 0;
    updateTitle();
    grid.setImage(new Location(userRow, 0), "Nobita.jpeg");
  }
  
  public void play()
  {
    while (!isGameOver())
    {
      grid.pause(100);
      handleKeyPress();
      if (msElapsed % 300 == 0)
      {
        scrollLeft();
        populateRightEdge();
      }
      updateTitle();
      msElapsed += 100;
    }
  }
  // HandleKeyPress method is used to place Nobita which is user 
  public void handleKeyPress()
  {
      int key=grid.checkLastKeyPressed();
      handleCollision(new Location(userRow,0));
      // when key 38 is pressed then current position is assigned null and new location is assigned one row above that.
      if(key==38 && userRow>0)
      {
          grid.setImage(new Location(userRow,0),null);
          userRow--;
          grid.setImage(new Location(userRow,0),"Nobita.jpeg");
      }
      // when key 40 is pressed then current location becomes null and new location is assigned one row down
      if(key==40 && userRow<grid.getNumRows())
      {        
         grid.setImage(new Location(userRow,0),null);
         userRow++;
         grid.setImage(new Location(userRow,0),"Nobita.jpeg"); 
      }
  }
  // random location is generated for avoid and get items(Doremon is to get and gian is to avoid)
  public void populateRightEdge()
  {
      grid.setImage(new Location((int)(Math.random()*grid.getNumRows()),19),"Doremon.png"); // Math.random is used to generate random positions
      grid.setImage(new Location((int)(Math.random()*grid.getNumRows()),19),"Gian.jpeg");
      
  }
  
  public void scrollLeft()
  {
      // use for loop for locating doremon and gian throughout the screen
        for (int i = 0; i < grid.getNumRows(); i++) {
            for (int j = 0; j <grid.getNumCols(); j++){
                // when column(j) is less than 0th column then position is set to null for gian and doremon
                 if(!(new Location(i,j)).equals(new Location(userRow,0)))
                 {
                     int cartoonNewP=j-1;
                     if(cartoonNewP<0)
                     {
                         grid.setImage(new Location(i,j),null);
                     }else if(!(new Location(i,j)).equals(new Location(userRow,1))) // if object location is not equal to user than place doremon 
                     // and gian on screen
                     {
                         grid.setImage(new Location(i,cartoonNewP),grid.getImage(new Location(i,j)));
                     }
                     if(j==grid.getNumCols()-1) // set the last row to null
                     {
                         grid.setImage(new Location(i,j),null);
                     }
                 }
                 //  handle collision for doremon and gian by calling handleCollision method 
                    if(new Location(i,j).equals(new Location(userRow,1)))
                    {
                        handleCollision(new Location(i,j));
                    }
                                     
            }
        }
        
  }
  
  public void handleCollision(Location loc)
  {
      if(grid.getImage(loc)==null)
      {
          
      }else if(grid.getImage(loc)=="Doremon.png") // if nobita collides doremon than increase the value of timesGet and get that position to null
      {
          timesGet++;
          grid.setImage(loc,null);
      }else if(grid.getImage(loc)=="Gian.jpeg") // if nobita collides gian than timesAvoid increases and get position where it collides to null
      {
          timesAvoid++;
          grid.setImage(loc,null);
      }
  }
  
  public int getScore() // returns the score 
  {
     return (timesGet*4  - (timesAvoid * 3)) * (msElapsed / 300); // calculate the score by (multiplying getScore by 4 then subtracting timesAvoid multiply by 3)
     // later multiply result by msElapsed/300
  }
  
  public void updateTitle()
  {
      // update the score board which is displayed on title 
    if(getScore()>1000){
    grid.setTitle("Game:  " + getScore()+ " you rock the game!");
    } else
     {
      grid.setTitle("Game score is: "+ getScore());
    }
  }
  
  public boolean isGameOver()
  {
    if(timesAvoid==5) // when timesAvoid gets equals to 5 then game gets overs
    {
        return true;
    }else
    {
        return false;
    }
  }
  
  public static void test()
  {
    Game game = new Game();
    game.play();
  }
  
  public static void main(String[] args)
  {
    test();
  }
}