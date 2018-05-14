/*
  Description: 
*/


public class Tunnel
{
  public PVector newDirection;
  public PVector position;
  public PVector center;
  public int tunnelWidth;
  public int tunnelHeight;
   
  //constructor
  public Tunnel (PVector pos)
  { 
    position = pos;
    tunnelWidth = 20;
    tunnelHeight = 20;
    
    center.x = position.x + tunnelWidth/2;
    center.y = position.y + tunnelHeight/2;
    
    //randomize the new direction
    int r = (int)random(0 , 4);
    
    //randomize the direction that the tunnel redirects the bullets to
    if(r == 0) { newDirection = new PVector(1, 0); }
    else if (r == 1) { newDirection = new PVector(0, 1); }
    else if (r == 2) { newDirection = new PVector(-1, 0); }
    else { newDirection = new PVector(0, -1); }
  }
  
  //redirect a bullet when it hits the tunnel
  public void RedirectBullet(Bullet bullet)
  {
    
  }
  
  //render tunnel
  public void Render(PVector shapeColor)
  {
    //draw the tunnel
    fill(shapeColor.x, shapeColor.y, shapeColor.z);
    //triangle();
  }
}
