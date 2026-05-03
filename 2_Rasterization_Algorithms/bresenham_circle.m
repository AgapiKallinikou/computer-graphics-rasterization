function bresenham_circle ( xc , yc , r , color )
  x = 0; y = r ; d = 3 - 2 * r ;
  draw_circle_points ( xc , yc , x , y , color ) ;
  while y >= x
    x = x + 1;
    if d > 0
      y = y - 1;
      d = d + 4 * ( x - y ) + 10;
    else
      d = d + 4 * x + 6;
    end
    draw_circle_points ( xc , yc , x , y , color ) ;
  end
end

function draw_circle_points ( xc , yc , x , y , color )
  draw_pixel ( xc + x , yc + y , color ) ; draw_pixel ( xc - x , yc + y ,
color ) ;
  draw_pixel ( xc + x , yc - y , color ) ; draw_pixel ( xc - x , yc - y ,
color ) ;
  draw_pixel ( xc + y , yc + x , color ) ; draw_pixel ( xc - y , yc + x ,
color ) ;
  draw_pixel ( xc + y , yc - x , color ) ; draw_pixel ( xc - y , yc - x ,
color ) ;
end
