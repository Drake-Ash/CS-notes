-- Last updated: 29/04/2026, 23:04:53
with recursive A as (
    select task_id, 1 as subtask_id from tasks
    union
    select t.task_id, A.subtask_id + 1
    from A join tasks t
    on t.task_id = A.task_id and A.subtask_id < t.subtasks_count
)

select
t.task_id,
t.subtask_id
from
A t
left join
executed e
on t.task_id = e.task_id
and t.subtask_id = e.subtask_id
where e.subtask_id is null