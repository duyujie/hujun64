select a.id 
from [yujiedu.comu.cn].lawyer.dbo.article a
where not exists (select 1 from [yujiedu.136.china123.net].a1019215504.dbo.article b
					where a.id=b.id)
					

delete from site_guestbook where guestbook_id in (select id from guestbook where enabled=0)