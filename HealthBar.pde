/*
*/

public class HealthBar
{
  public Player myPlayer;
  public float rectLength;
  public float rectWidth;
  
  //constructor
  public HealthBar(Player player)
  {
    myPlayer = player;
    rectLength = 30;
    rectWidth = 5;
  }
  
  //render health bar
  public void Render()
  {
    fill(0, 0, 255);    
    rect(myPlayer.position.x - 6, myPlayer.position.y - 10, (myPlayer.health/myPlayer.maxHealth) * rectLength, rectWidth);
  }
}
