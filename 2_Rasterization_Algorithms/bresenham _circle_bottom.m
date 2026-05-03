function bresenham_circle_bottom ( xc , yc , r , color )
  x = 0; y = r ; d = 3 - 2 * r ;

  draw_bottom_points ( xc , yc , x , y , color ) ;

  while y >= x
    x = x + 1;
    if d > 0
      y = y - 1;
      d = d + 4 * ( x - y ) + 10;
    else
      d = d + 4 * x + 6;
    end
    draw_bottom_points ( xc , yc , x , y , color ) ;
  end
end

function draw_bottom_points ( xc , yc , x , y , color )
  % Ε κ τ υ π ω ν ω υ μ ε μ ω ν ω τ α σ η μ ε ι α π ω υ β ρ ι σ κ ω ν τ α ι κ α τ ω α π ω τ ω yc
  draw_pixel ( xc + x , yc - y , color ) ;
  draw_pixel ( xc - x , yc - y , color ) ;
  draw_pixel ( xc + y , yc - x , color ) ;
  draw_pixel ( xc - y , yc - x , color ) ;
end
