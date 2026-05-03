function bresenham_line ( x1 , y1 , x2 , y2 , color )
  x = x1 ; y = y1 ;
  dx = abs ( x2 - x1 ) ; dy = abs ( y2 - y1 ) ;
  if x1 < x2 , sx = 1; else , sx = -1; end
  if y1 < y2 , sy = 1; else , sy = -1; end
  err = dx - dy ;

  while true
    draw_pixel (x , y , color ) ;
    if x == x2 && y == y2 , break ; end
    e2 = 2 * err ;
    if e2 > - dy
    err = err - dy ;
    x = x + sx ;
    end
    if e2 < dx
        err = err + dx ;
        y = y + sy ;
    end
  end
end
