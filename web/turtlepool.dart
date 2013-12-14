import 'dart:html';
import 'turtle.dart';

void main() {

  CanvasElement ce = querySelector('#surface');
  CanvasRenderingContext2D c2d = ce.getContext("2d");
  turtle Shelly = new turtle(c2d,50,50);

  Shelly.demo1();   
    
}