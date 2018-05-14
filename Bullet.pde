/*
  Description: 
*/

public class Bullet
{
  public float speed;
  public PVector position;
  public int bulletWidth;
  public int bulletHeight;
  public PVector forwardDir;
  public int timer;
  public PVector center;
  
  //constructor
  public Bullet(PVector pos, int w, int h , PVector forward)
  {
    position = pos;
    bulletWidth = w;
    bulletHeight = h;
    speed = 4;
    forwardDir = forward;
    timer = 400;
    center = new PVector();
  }
  
  //update bullets 
  public void Update(float deltaTime)
  {
    timer--;
    
    //deltatime check is not done yet
    position.x += forwardDir.x * speed;
    position.y += forwardDir.y * speed;
    
    //recalculate center
    center.x = position.x + bulletWidth/2;
    center.y = position.y + bulletHeight/2;
  }
  
  //render bullets
  public void Render(PVector shapeColor)
  {
    //draw the bullet here
    fill(shapeColor.x, shapeColor.y, shapeColor.z); 
    ellipse(position.x , position.y , bulletWidth, bulletHeight); 
  }
}
