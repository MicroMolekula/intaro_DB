select M.mv_title, AA.act_name
from (
    select AM.mv_id, A.act_name
    from actor_movie AM inner join actor A on AM.act_id = A.act_id
    where A.cnt_title = 'США'
) AA right join  movie M on AA.mv_id = M.mv_id