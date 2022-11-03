SELECT question_id survey_log
FROM (
    SELECT question_id, COUNT(answer_id) / (COUNT(*)/2) r
    FROM SurveyLog GROUP BY question_id 
    ORDER BY r DESC, question_id) t
LIMIT 1;

SELECT question_id survey_log
FROM SurveyLog GROUP BY question_id
ORDER BY SUM(IF(action = 'answer', 1, 0)) / SUM(IF(action = 'show', 1, 0)) DESC, question_id
LIMIT 1;