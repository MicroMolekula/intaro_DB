select task_2.tsk_date, task_2.tsk_array, task_2.tsk_json, task_2.tsk_profile, task_2.tsk_money
from task_2
where task_2.tsk_int <= 52 AND task_2.tsk_int >= 10;