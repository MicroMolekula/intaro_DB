select DM.drt_name, GM.gr_title
from
(
    select D.drt_name, DM.mv_id
    from director D inner join director_movie DM on D.drt_id = DM.drt_id
 ) DM
full join
(
    select G.gr_title, M.mv_id
    from movie M full join
        (
            genre G full join genre_movie GM on G.gr_title = GM.gr_title
        ) on M.mv_id = GM.mv_id
) GM
on DM.mv_id = GM.mv_id