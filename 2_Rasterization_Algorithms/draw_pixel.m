function draw_pixel (x , y , color )
  x_vertices = [x -0.5 , x +0.5 , x +0.5 , x -0.5];
  y_vertices = [y -0.5 , y -0.5 , y +0.5 , y +0.5];
  fill ( x_vertices , y_vertices , color , ’ EdgeColor ’ , ’ none ’) ;
end
