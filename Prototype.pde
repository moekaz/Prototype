/*
  Author: Mohamed Kazma
  Description: Prototype TUNNEL, MY ENEMY ?!??!?!?!??!?!?
  
*/

//setup variables
public Player player;
public float deltaTime;
public float elapsedTime;

//setup the environment for starting the game
void setup()
{
  //setup the window
  frameRate(60);
  size(800 , 600);
  background(0,0,0);
  
  //setup variables
  elapsedTime = 0;
  deltaTime = 1;
  
  //setup units
  player = new Player(new PVector(0, 0, 0));
}

//checks for key inputs
void keyPressed()
{
  //check for player movement
  if (key == 'w') { player.velocity.y -= 2; }
  else if (key == 'a') { player.velocity.x -= 2; }
  else if (key == 's') { player.velocity.y += 2; }
  else if (key == 'd') { player.velocity.x += 2; }
}

//draw all drawable things here
void draw()
{  
  //Update all updateables
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
  //Update here 
  player.Update(deltaTime);
}

//Render units and game world
void Render()
{
  //reset background first
  background(0,0,0);
  
  //draw stuff here
  player.Render();
}
