/*
  Author: Mohamed Kazma
  Description: Prototype TUNNEL, MY ENEMY ?!??!?!?!??!?!? (Bullet Tunnel)
  
*/

//setup variables
public Player player;      //player unit
public Unit enemy;         //enemy unit
public float deltaTime;
public float elapsedTime;
public ArrayList<Tunnel> tunnels;

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
  
  tunnels.add(new Tunnel(new PVector (300, 300, 0)));
}

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



//Update units and game world
void Update(float deltaTime)
{
  //Collision Detection Should occur here
  CollisionDetection();
  
  //Update here 
  player.Update(deltaTime);
  enemy.Update(deltaTime);
 
}

//Render units and game world
void Render()
{
  //reset background first
  background(0,0,0);
  
  //draw stuff here
  player.Render(new PVector (0, 255, 0) , new PVector(0, 0, 255));
  enemy.Render(new PVector (255, 0 , 0) , new PVector(255, 255, 0));
  
  //draw tunnels
  for (int i = 0; i < tunnels.size(); i++)
  {
    tunnels.get(i).Render(new PVector(139, 69, 19));
  }
}

//check for collisions
void CollisionDetection()
{
  //enemy bullet collision
  
  //player bullet collision
  
  //enemy bullet collision
  
  //
}

boolean RectCircleCollision(Player player, Bullet bullet)
{
  return false;
}

boolean RectRectCollision(Player player1, Player player2)
{
  return false;
}
