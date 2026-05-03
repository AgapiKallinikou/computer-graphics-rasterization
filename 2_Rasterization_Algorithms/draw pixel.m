function draw_pixel (x , y , color )
2 x_vertices = [x -0.5 , x +0.5 , x +0.5 , x -0.5];
3 y_vertices = [y -0.5 , y -0.5 , y +0.5 , y +0.5];
4 fill ( x_vertices , y_vertices , color , ’ EdgeColor ’ , ’ none ’) ;
5 end
