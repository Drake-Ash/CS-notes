-- Last updated: 29/04/2026, 23:02:16
select case when A = B and B=C and A = C then 'Equilateral' 
            when (A=B and A+B>C) or (B=C and B+C>A) or (A=C and A+C>B) then 'Isosceles' 
            when A + B > C and B + C > A and A + C > B then 'Scalene' 
            else 'Not A Triangle' end 
            as "triangle_type" 
from Triangles 
