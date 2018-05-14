/*
  Description: Represents a player's data, updates them and then renders this player
*/

public class Player
{
  public int health;
  public PVector position;
  public PVector velocity;
  public PShape playerShape;
  public float maxSpeed;
   
  //setup player here
  public Player(PVector pos)
  {
    health = 10;
    position = pos;
    playerShape = new PShape();
    velocity = new PVector();
    maxSpeed = 5;
  }
  
  //Update player position
  public void Update(float deltaTime)
  {
    //limit player velocity
    if (velocity.magSq() >= maxSpeed) 
    {
      velocity.normalize();
      velocity.x *= maxSpeed;
      velocity.y *= maxSpeed; 
    }
    
    //Update player position
    position.x += velocity.x * deltaTime;
    position.y += velocity.y * deltaTime; 
    
    //reset velocity
    velocity.x = 0;
    velocity.y = 0;
  }
  
  //draw the player
  public void Render()
  {
    //draw the UI player shape taking the position into consideration
    rect(position.x , position.y , 20 , 20);
  }
}
