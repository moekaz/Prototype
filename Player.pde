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
  public int rectLength;
  public int rectWidth;
  public int speed;
  public ArrayList<Bullet> bullets;
  public PVector center;   
  public int maxFireRate;
  public int fireTimer;
   
  //setup player here
  public Player(PVector pos , int health)
  {
    this.health = health;
    position = pos;
    playerShape = new PShape();
    velocity = new PVector();
    maxSpeed = 10;
    rectLength = 20;
    rectWidth = 20;
    speed = 5;
    bullets = new ArrayList<Bullet>();
    center = new PVector();
    fireTimer = 0;
    maxFireRate = 30;
  }
  
  //Add bullets
  public void AddBullet(PVector forwardDirection)
  {
    if (fireTimer <= 0)
    {
      int bulletWidth = 8;
      int bulletHeight = 8;
      PVector bulletPosition = new PVector(center.x , center.y);
      bulletPosition.x += (rectLength/2 + bulletWidth + 1) * forwardDirection.x;
      bulletPosition.y += (rectWidth/2 + bulletHeight + 1) * forwardDirection.y;
      
      Bullet b = new Bullet(bulletPosition, bulletWidth, bulletHeight, forwardDirection);
      bullets.add(b);
      
      fireTimer = maxFireRate;
    }
  }
  
  //Update player position
  public void Update(float deltaTime)
  {
    //fireTimer change
    fireTimer--;
    
    //limit player velocity
    if (velocity.magSq() >= maxSpeed) 
    {
      velocity.normalize();
      velocity.x *= maxSpeed;
      velocity.y *= maxSpeed; 
    }
    
    //Update player position according to velocity
    position.x += velocity.x * deltaTime;
    position.y += velocity.y * deltaTime; 
    
    //recalculate center
    center.x = position.x + rectLength/2;
    center.y = position.y + rectWidth/2;
    
    //reset velocity
    velocity.x = 0;
    velocity.y = 0;
    
    //check the player's bullets here
    for(int i = 0; i < bullets.size(); i++)
    {
      if (bullets.get(i).timer <= 0)
      {
        bullets.remove(i);
        i--;
      }
      else { bullets.get(i).Update(deltaTime); }
    }
  }
  
  //draw the player
  public void Render(PVector shapeColor , PVector bulletColor)
  {
    //draw the UI player shape taking the position into consideration
    fill(shapeColor.x, shapeColor.y, shapeColor.z);
    rect(position.x , position.y , rectLength , rectWidth);
    
    //render player's bullets
    for(int i = 0; i < bullets.size(); i++)
    {
      bullets.get(i).Render(bulletColor);
    }
  }
}
