SELECT ROUND(COALESCE((uni_acc / request), 0), 2) accept_rate
FROM (SELECT COUNT(*) uni_acc FROM 
      (SELECT DISTINCT requester_id, accepter_id FROM RequestAccepted) temp1) r, 
     (SELECT COUNT(*) request FROM 
      (SELECT DISTINCT sender_id, send_to_id FROM FriendRequest) temp2) f;