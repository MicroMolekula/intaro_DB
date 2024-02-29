select RM.mv_title, C.cmt_text
from commentary C inner join (
    select R.rv_id, M.mv_title
    from movie M inner join review R on R.mv_id = M.mv_id
) RM on C.rv_id = RM.rv_id