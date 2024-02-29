select D.drt_name, M.mv_title
from director_movie DM, director D, movie M
where DM.drt_id = D.drt_id and DM.mv_id = M.mv_id
order by M.mv_title desc;