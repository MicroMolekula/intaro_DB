select M.mv_title, R.rv_mark
from movie M, review R
where M.mv_id = R.mv_id;