/*
  Author: Mohamed Kazma
  Description: Prototype TUNNEL, MY ENEMY ?!??!?!?!??!?!? (Bullet Tunnels)
  
*/

//TODOSSSSS:
//collision detection                       DONNNEEEE
//ai for enemies(very basic)                DONNNEEEE (kinda)
//health bars                               DONNNEEEE
//background creation and world creation    DONNNEEEE

//setup variables
public Player player;                //player unit
public Unit enemy;                   //enemy unit
public float deltaTime;              //for calculation of delta time
public float elapsedTime;            //for calculation of delta time
public ArrayList<Tunnel> tunnels;    //for storing tunnels

/* Setup game world */

//setup the environment for starting the game
void setup()
{
  //setup the window
  frameRate(60);
  size(800 , 600);
  background(0, 0, 0);
  
  //setup variables
  elapsedTime = 0;
  deltaTime = 1;
  
  //setup units
  player = new Player(new PVector(0, 0, 0) , 10);
  enemy = new Unit (new PVector (400 , 400 , 0) , player);
  tunnels = new ArrayList<Tunnel>();
  
  //Add more tunnels
  tunnels.add(new Tunnel(new PVector (300, 300, 0)));
  tunnels.add(new Tunnel(new PVector (400, 100, 0)));
  tunnels.add(new Tunnel(new PVector (400, 500, 0)));
  tunnels.add(new Tunnel(new PVector (500, 200, 0)));
  tunnels.add(new Tunnel(new PVector (600, 350, 0)));
  tunnels.add(new Tunnel(new PVector (200, 400, 0)));
  tunnels.add(new Tunnel(new PVector (700, 450, 0)));
  tunnels.add(new Tunnel(new PVector (750, 50, 0)));

  
}

/* Key pressed callback probably */

//checks for key inputs
void keyPressed()
{
  //check for player movement
  if (key == 'w') { player.velocity.y -= player.speed; }
  if (key == 'a') { player.velocity.x -= player.speed; }
  if (key == 's') { player.velocity.y += player.speed; }
  if (key == 'd') { player.velocity.x += player.speed; }
  
  //add a bullet to the player
  if (keyCode == ' ') { player.AddBullet(new PVector(1, 0, 0)); }
}

/* While true loop */

//draw all drawable things here
void draw()
{  
  //Update all updateables (deltaTime is not being used atm)
  Update(deltaTime);
  
  //render all renderables
  Render();
   
  //calculate deltaTime
  //deltaTime = millis() - elapsedTime;  
  //elapsedTime += millis();
}


/* Update */

//Update units and game world
void Update(float deltaTime)
{
  //Collision Detection Should occur here
  CollisionDetection();
  
  //Update here win or lose conditions here
  if (player.health > 0 && enemy.enemy.health > 0)
  {
    player.Update(deltaTime);
    enemy.Update(deltaTime);
  }
}

/* Render */

//Render units and game world
void Render()
{
  //reset background first
  background(0,0,0);
  
  //draw player and enemy here
  player.Render(new PVector (0, 255, 0) , new PVector(0, 0, 255));
  enemy.Render(new PVector (255, 0 , 0) , new PVector(255, 255, 0));
  
  //draw tunnels
  for (int i = 0; i < tunnels.size(); i++)
  {
    tunnels.get(i).Render(new PVector(139, 69, 19));
  }
}

/* Collision Detection Check */

//check for collisions
void CollisionDetection()
{
  //enemy bullet collision
  for (int i = 0; i < player.bullets.size(); i++)
  {
    if (RectCircleCollision(enemy.enemy , player.bullets.get(i))) 
    {
      player.bullets.remove(i);
      enemy.enemy.health -= 5;
    }
  }
  
  //player bullet collision
  for (int i = 0; i < enemy.enemy.bullets.size(); i++)
  {
    if (RectCircleCollision(player , enemy.enemy.bullets.get(i))) 
    {
      enemy.enemy.bullets.remove(i);
      player.health -= 4;
    }
  }
   
   //player and player player bullets collision
  for (int i = 0; i < player.bullets.size(); i++)
  {
    if (RectCircleCollision(player , player.bullets.get(i))) 
    {
      player.bullets.remove(i);
      player.health -= 4;
    }
  }
  
  //enemy and enemy bullets collision detection
  for (int i = 0; i < enemy.enemy.bullets.size(); i++)
  {
    if (RectCircleCollision(enemy.enemy , enemy.enemy.bullets.get(i))) 
    {
      enemy.enemy.bullets.remove(i);
      enemy.enemy.health -= 5;
    }
  } //<>//
   
  //bullet and tunnel collision
  for (int j = 0; j < tunnels.size(); j++)
  {
    //player and tunnels
    for (int i = 0; i < player.bullets.size(); i++)
    {
      if (CircleTriangleCollision(player.bullets.get(i) , tunnels.get(j)))
      {
        tunnels.get(j).RedirectBullet(player.bullets.get(i));
      }
    }
    
    //enemy and tunnels
    for(int w = 0; w < enemy.enemy.bullets.size(); w++)
    {
      if (CircleTriangleCollision(enemy.enemy.bullets.get(w) , tunnels.get(j)))
      {
        tunnels.get(j).RedirectBullet(enemy.enemy.bullets.get(w));
      }
    }  
  }
  
  
  //player enemy collision detection

}


/* Collision detection Functions */

//rectangle circle collision detection
boolean RectCircleCollision(Player player1, Bullet bullet)
{
    return !(player1.position.x + player1.rectLength < bullet.position.x || 
           player1.position.x > bullet.position.x + bullet.bulletWidth ||
           player1.position.y + player1.rectWidth < bullet.position.y  ||
           player1.position.y > bullet.position.y + bullet.bulletHeight);
}

//rectangle rectangle collision detection
boolean RectRectCollision(Player player1, Player player2)
{
  return !(player1.position.x + player1.rectLength < player2.position.x || 
         player1.position.x > player2.position.x + player2.rectLength ||
         player1.position.y + player1.rectWidth < player2.position.y  ||
         player1.position.y > player2.position.y + player2.rectWidth);
}

//circle triangle collison detection
boolean CircleTriangleCollision(Bullet b , Tunnel t)
{
    return !(b.position.x + b.bulletWidth < t.position.x || 
           b.position.x > t.position.x + t.tunnelWidth ||
           b.position.y + b.bulletHeight < t.position.y  ||
           b.position.y > t.position.y + t.tunnelHeight);
}
