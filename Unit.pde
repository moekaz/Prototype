/*
  Description: This is the enemy unit generally
*/

public class Unit
{
  public Player enemy;
  public Player playerUnit;
  public int timer;
  
  //constructor
  public Unit(PVector pos , Player opponent)
  {
    enemy = new Player(pos , 30);
    playerUnit = opponent;
    timer = 30;
  }
 
  //update
  public void Update(float deltaTime)
  {
    timer--;
    
    if (timer <= 0)
    {
      //do some ai stuff here
      int r = (int)random(0 , 10);
      
      if (r == 0) MoveLeft();
      else if (r == 1) MoveRight();
      else if (r == 2) MoveUp();
      else if (r == 3) MoveDown();
      else if (r >= 4) ShootBullet();
      
      timer = 10;
    }
    
    //update units' velocity
    enemy.Update(deltaTime);
  }
  
  //render
  public void Render(PVector shapeColor , PVector bulletColor)
  {
    //render enemy unit and its bullets
    enemy.Render(shapeColor , bulletColor);
  }   
  
  
  //enenmy movements
  public void MoveLeft() { enemy.velocity.x = enemy.speed; }
  public void MoveRight() { enemy.velocity.x = -enemy.speed; }
  public void MoveUp() { enemy.velocity.y = -enemy.speed; }
  public void MoveDown() { enemy.velocity.y = enemy.speed; }
  
  //shoot a bullet
  public void ShootBullet() { enemy.AddBullet(new PVector(-1, 0)); }
}
