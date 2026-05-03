function kappel_ellipse_right ( xc , yc , a , b , color )
  x = 0; y = b ; a2 = a * a ; b2 = b * b ;
  d1 = b2 - a2 * b + 0.25 * a2 ;

  dx = 2 * b2 * x ; dy = 2 * a2 * y ;

  while dx < dy
    draw_right_points ( xc , yc , x , y , color ) ;
    if d1 < 0
      x = x + 1; dx = dx + 2 * b2 ; d1 = d1 + dx + b2 ;
    else
      x = x + 1; y = y - 1;
      dx = dx + 2 * b2 ; dy = dy - 2 * a2 ;
      d1 = d1 + dx - dy + b2 ;
    end
  end

d2 = b2 * ( x + 0.5) ^2 + a2 * ( y - 1) ^2 - a2 * b2 ;
while y >= 0
  draw_right_points ( xc , yc , x , y , color ) ;
  if d2 > 0
    y = y - 1; dy = dy - 2 * a2 ; d2 = d2 - dy + a2 ;
  else
    y = y - 1; x = x + 1;
    dx = dx + 2 * b2 ; dy = dy - 2 * a2 ;
    d2 = d2 + dx - dy + a2 ;
   end
  end
end

function draw_right_points ( xc , yc , x , y , color )
  draw_pixel ( xc + x , yc + y , color ) ;
  draw_pixel ( xc + x , yc - y , color ) ;
end
