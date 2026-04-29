-- Last updated: 29/04/2026, 23:11:42
delete p1 
from person p1,person p2 
where p1.email=p2.email and p1.id>p2.id;