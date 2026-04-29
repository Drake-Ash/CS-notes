-- Last updated: 29/04/2026, 23:09:44
select round (
    ifnull (
        (select count(*) from (select distinct requester_id, accepter_id from RequestAccepted) as A)
        /
        (select count(*) from (select distinct sender_id, send_to_id from FriendRequest) as B)
    , 0)
, 2) as accept_rate;