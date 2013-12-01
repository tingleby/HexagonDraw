import 'dart:html';
import 'dart:math';

CanvasElement canvas;
List<Hexagon> hexs = new List(101);

void main() {
  canvas = querySelector("#area");
  num dist = 60;
  var index = 0;
  
  for(var r =1; r< 10 ; r++) {
    for(var i =1; i< 10 ; i++) {
      Point pin = new Point(i*(dist*2),(r*(dist*2)));
      hexs[(index++)] = new Hexagon( canvas,pin, dist);
    }
    
    
  }
  //GameDraw gd = new GameDraw();
}
void drawAll(){
  for (Hexagon h in hexs) {
    h.draw();
  }
}

class GameDraw {
  
  
  //GameDraw(this.canvas);
  
  
  
  
}

class Hexagon {
  CanvasRenderingContext2D ctx;
  
  List<Point> points = new List(6);
  num side_length;
  
 
  Hexagon(CanvasElement canvas,Point top,this.side_length) {
    ctx = canvas.getContext('2d');
    calc_points(top,side_length);
    this.draw();
  }
  
  void calc_points(Point top,length) {
    points[0] = top;
    points[1] = new Point((points[0].x + length), points[0].y);
    points[2] = new Point((points[1].x + (length/2)),(points[1].y - length));
    points[3] = new Point(points[1].x,(points[2].y - length));
    points[4] = new Point(points[0].x, points[3].y);
    points[5] = new Point((points[0].x - (length/2)),points[2].y);
  }
  
  move(top) {
    calc_points(top,side_length);
  }
  move_reszie(top, new_length) {
    calc_points(top,new_length);
    side_length = new_length;
  }
  resize(new_length){
    calc_points(points[0], new_length);
    side_length = new_length;    
  }
  
  draw() {
    ctx
      ..beginPath()
      ..moveTo(points[0].x, points[0].y);
    for (Point p in points) {
      ctx.lineTo(p.x, p.y);
    }
    ctx
      ..closePath()
      ..setStrokeColorRgb(255,0,0,1.0)
      ..stroke()
      ..fill();
      
    
  }
}