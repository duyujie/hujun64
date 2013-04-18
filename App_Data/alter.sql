select * from article_picture
select * from main_class
select * from site_class

insert main_class(id,[class_parent],[enabled],[class_name])
values ('80','',1,'±¨¿¯×¨À¸');

insert site_class([site_id],class_id,category,sort_seq,template_url,img_url)
values ('1','80',null,1,'listitem.aspx?module_id=80',null);