select G.gr_title, M.mv_title
from genre G left join (
    genre_movie GM inner join movie M on GM.mv_id = M.mv_id
) on G.gr_title = GM.gr_title