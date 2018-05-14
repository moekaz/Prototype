/*
  Description: This is the enemy unit generally
*/

public class Unit
{
  public Player enemy;
  public Player playerUnit;
  
  //constructor
  public Unit(PVector pos , Player opponent)
  {
    enemy = new Player(pos , 30);
    playerUnit = opponent;
  }
 
  //update
  public void Update(float deltaTime)
  {
    //do some ai stuff here
    
    //testing some velocity 
    enemy.velocity.x =  0.1;
    
    //update units' velocity
    enemy.Update(deltaTime);
  }
  
  //render
  public void Render(PVector shapeColor , PVector bulletColor)
  {
    //render enemy unit and its bullets
    enemy.Render(shapeColor , bulletColor);
  }   
}
