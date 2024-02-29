select M.mv_title
from country C, movie M, country_movie CM
where C.cnt_title = CM.cnt_title and M.mv_id = CM.mv_id
and C.cnt_title = 'США';