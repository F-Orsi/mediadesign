class Zombie extends Sprite
{
  boolean isJump = false;
  int nJump = 0;
  boolean isDead = false;
  PImage skull;
  
  Zombie()
  {
    super();
    skull = loadImage("x.png");
    this.location.y=height/2-400;
  }
  
  void jump()
  {
    if(this.nJump < 3)
    {
      this.velocity.y=-8;
      this.acceleration.y = 0.2;
      this.isJump=true;
      this.nJump = this.nJump + 1;
    }  
  }
  
  void check()
  {
    //float actualY = screenY(this.location.x,this.location.y);
    if(location.y > (height/2)-400) 
    {
      this.acceleration.y = 0;
      this.velocity.y=0;
      this.location.y=height/2-400;
      this.isJump=false;
      this.nJump = 0;
    }
    if(!this.isDead)
    {
      if(this.isJump)
      {
        if(this.velocity.y < 0)
        {
          this.currentAni = 2;  //up
        }
        else
        {
          this.currentAni = 3;  //down
        }
      }
      else
      {
        this.currentAni = 0;  //grounded
      }
    }
    else
    {
      this.currentAni = 4;  //dead
    }
  }
  
  void display()
  {
    if(!this.isDead)
    {
      float shadow = map(this.location.y,-height/2.0,height/2.0,0,1.0);
      fill(color(0,0,0,shadow*100));
      shadow = (1.0-shadow)*400.0;
      ellipse(this.location.x,(height/2)-220,shadow,shadow/5.0);
      int ns = 2-this.nJump;
      if(ns > -1) image(this.skull,this.location.x-100, this.location.y-280);
      if(ns > 0) image(this.skull,this.location.x-50,    this.location.y-280);
      if(ns > 1) image(this.skull,this.location.x, this.location.y-280);
    }  
    
    
    super.display();  
  }
  
}
