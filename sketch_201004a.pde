float theta = 0,little=0,times=2;
float earthw=10,moonw=6,sunw=30,mercuryw=7,venusw=10,marsw=13,jupiterw=30,saturnw=24;
float moonr=20,sunr=100,mercuryr=39,venusr=70,marsr=152,jupiterr=220,saturnr=270;
boolean heli=true,up=false;
void setup() {
  size(1200, 900);
}
void draw() {
  //background coloring
  background(0);
  if(times<=32)
  {
    fill(255,100,100);
    noStroke();
    rect(450,50,100,60,15);
    fill(0,0,0);
    textSize(20);
    text("X 2",485,88);
  }
  if(times>=0.1)
  {
    fill(100,100,255);
    noStroke();
    rect(600,50,100,60,15);
    fill(0,0,0);
    textSize(20);
    text("X 0.5",628,88);
  }
  fill(255,255,9);
  noStroke();
  rect(50,50,350,60,15);
  fill(0,0,0);
  textSize(20);
  if(heli==true)//Tychonic system
  {
    text("Change to Heliocentric theory",80,88);
    translate((width/2)-(sunr*little*cos(-theta)),(height/2)-(sunr*little*sin(-theta))+50);
    if(up)
    {
      little-=0.01;
      if(little<=0)
      {
       up=false;
       little=0;
      }
    }
  }
  else //Heliocentric theory
  {
    text("Change to Tychonic system",88,88);
    translate((width/2)-(sunr*little)*cos(-theta),(height/2)-(sunr*little)*sin(-theta)+50);
    if(up)
    {
      little+=0.01;
    if(little>=1)
      up=false;
    }
  }
  //Earth
  fill(12,132,252);
  noStroke();
  ellipse(0, 0, earthw, earthw);
  //Sun track
  noFill();
  stroke(255);
  ellipse(0,0,sunr*2,sunr*2);
  //Moon track
  noFill();
  stroke(255);
  ellipse(0,0,moonr*2,moonr*2);
   //Moon
  pushMatrix();
  rotate(-theta*365.25/27);
  translate(moonr,0);
  fill(200,200,200);
  noStroke();
  ellipse(0,0,moonw,moonw);
  popMatrix();
  //traslate to Sun
  pushMatrix();
  //Sun
  rotate(-theta);
  translate(sunr, 0);
  fill(255, 173, 9);
  noStroke();
  ellipse(0, 0, sunw, sunw);
  //Mercury track
  noFill();
  stroke(255);
  ellipse(0,0,mercuryr*2,mercuryr*2);
  //Venus track
  noFill();
  stroke(255);
  ellipse(0,0,venusr*2,venusr*2);
  //Earth track
  noFill();
  stroke(255);
  ellipse(0,0,sunr*2,sunr*2);
  //Mars track
  noFill();
  stroke(255);
  ellipse(0,0,marsr*2,marsr*2);
  //Jupiter track
  noFill();
  stroke(255);
  ellipse(0,0,jupiterr*2,jupiterr*2);
  //Saturn track
  noFill();
  stroke(255);
  ellipse(0,0,saturnr*2,saturnr*2);
  //Mercury
  pushMatrix();
  rotate(-theta*365.25/87.97);
  translate(mercuryr, 0);
  fill(134, 134, 134);
  noStroke();
  ellipse(0, 0, mercuryw, mercuryw);
  popMatrix();
  //Venus
  pushMatrix();
  rotate(-theta*365.25/224);
  translate(venusr,0);
  fill(240,193,136);
  noStroke();
  ellipse(0,0,venusw,venusw);
  popMatrix();
  //Mars
  pushMatrix();
  rotate(theta*365.25/686.96);
  translate(marsr,0);
  fill(202,85,62);
  noStroke();
  ellipse(0,0,marsw,marsw);
  popMatrix();
  //Jupiter
  pushMatrix();
  rotate(theta*365.25/4333.3);
  translate(jupiterr,0);
  fill(196,153,68);
  noStroke();
  ellipse(0,0,jupiterw,jupiterw);
  popMatrix();
  //Saturn
  pushMatrix();
  rotate(theta*365.25/10756.2);
  translate(saturnr,0);
  fill(217,172,47);
  noStroke();
  ellipse(0,0,saturnw,saturnw);
  popMatrix();
  popMatrix();
  theta += (1/365.25*times);
}
void mouseReleased()
{
  if(mouseX>450&&mouseX<550&&mouseY>50&&mouseY<110&&times<=32)
    times=times*2;
  if(mouseX>600&&mouseX<700&&mouseY>50&&mouseY<110&&times>=0.1)
    times=times/2.0;
  if(mouseX>50&&mouseX<400&&mouseY>50&&mouseY<110)
  {
    heli=!heli;
    up=true;
  }
}
