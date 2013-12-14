import "dart:html";
import "dart:math";

class util
{
  static num degToRad(num deg) => deg * (PI / 180.0);
  static num radToDeg(num rad) => rad * (180.0 / PI);
}

class turtle
{
  CanvasRenderingContext2D Ctx;
  
  int PenX = 0;
  int PenY = 0;
  int Rotation = 0;
  int PenUp = 0;
  
  turtle(this.Ctx, this.PenX, this.PenY){
    Rotation = 0;
  }
  
  void Rotate(int degrees){
    Rotation += degrees;
    Rotation = Rotation % 360;
  }
  
  void Left(int degrees){Rotate(degrees);}
  void Right(int degrees){Rotate(-degrees);}
  
  void Forward(int distance){
    
    double r = util.degToRad(Rotation);
    int dx = (distance * sin(r)).toInt();
    int dy = (distance * cos(r)).toInt();
    
    colorVal--;
    if (colorVal<0) colorVal=255;
    int green = 255-colorVal;
    int blue = (128-colorVal) % 255;
    Ctx
      ..strokeStyle = "rgb($colorVal,$green,$blue)"
      ..beginPath()
      ..moveTo( PenX, PenY )
      ..lineTo( PenX + dx, PenY + dy )
      ..closePath()
      ..stroke();
    PenX += dx;
    PenY += dy; 
    
  }
  
  void Reverse(int distance)
  {
    Rotation += 180;
    Forward(distance);
    Rotation -= 180;
  }
  
  void demo1(){
    Peano(7, 6, 1);
  }
  
  int colorVal = 255;
  
  void Peano(size, level, parity){
    
    if (level == 0) return;

    Left(parity * 90);
    Peano(size, level - 1, -parity);
    
    Forward(size);
    Right(parity * 90);
    Peano(size, level - 1, parity);
   
    Forward(size);
    Peano(size, level - 1, parity);
    
    Right(parity * 90);
    Forward(size);
    Peano(size, level - 1, -parity);
    Left(parity * 90);
  }
  
}