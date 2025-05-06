-- create database and admin user for local database
CREATE USER 'asm2_admin'@'localhost' IDENTIFIED BY 'Asm2_pwd';

CREATE DATABASE IF NOT EXISTS dep304x_asm2;
GRANT ALL ON dep304x_asm2.* TO 'asm2_admin'@'localhost';

-- 1st request: Viết truy vấn để tính tổng các trường "Sentiment_Subjectivity" và "Sentiment_Polarity" theo từng loại danh mục của ứng dụng. Kết quả sẽ có dạng như sau:
SELECT a.Category,
       SUM(r.Sentiment_Subjectivity) SUM_Sentiment_Subjectivity,
       SUM(r.Sentiment_Polarity) SUM_Sentiment_Polarity
FROM app a
JOIN review r ON r.App = a.App
GROUP BY a.Category;
-- cloud 33 rows retrieved starting from 1 in 1 s 55 ms (execution: 1 s 13 ms, fetching: 42 ms)
-- onpremises: 33 rows retrieved starting from 1 in 973 ms (execution: 915 ms, fetching: 58 ms)

-- 2nd request: VIết truy vấn để đếm số lượng ứng dụng theo từng loại đánh giá "Negative", "Positive", "Neutral"  theo từng loại danh mục của ứng dung. Kết quả sẽ có dạng như sau:
SELECT a.Category,
       SUM(IF(r.Sentiment='Negative', 1, 0)) Count_Negative,
       SUM(IF(r.Sentiment='Positive', 1, 0)) Count_Positive,
       SUM(IF(r.Sentiment='Neutral', 1, 0)) Count_Neutral
FROM app a
JOIN review r ON r.App = a.App
GROUP BY a.Category;
-- cloud 33 rows retrieved starting from 1 in 1 s 297 ms (execution: 1 s 199 ms, fetching: 98 ms)
-- onpremises 33 rows retrieved starting from 1 in 1 s 264 ms (execution: 1 s 195 ms, fetching: 69 ms)

-- 3rd request: Một danh mục được gọi là nổi bật, nếu như tổng số từ của của các review những ứng dụng trong danh mục đó nhiều nhất. Bạn hãy viết truy vấn để tìm danh mục nổi bật đó, đồng thời tính được giá trung bình của mỗi ứng dụng thuộc danh mục đó.
SELECT a.Category,
       SUM(IF(r.Translated_Review='None', 0, LENGTH(r.Translated_Review) - LENGTH(REPLACE(r.Translated_Review, ' ', '')) + 1)) AS Word_Count,
       ROUND(AVG(CAST(REGEXP_SUBSTR(a.Price, '[0-9]+(.[0-9]+)?') AS FLOAT)), 2) AVG_Price
FROM app a
JOIN review r ON r.App = a.App
GROUP BY a.Category
ORDER BY Word_Count DESC
LIMIT 1;

-- cloud 1 row retrieved starting from 1 in 1 s 600 ms (execution: 1 s 558 ms, fetching: 42 ms)
-- onpremises  1 row retrieved starting from 1 in 1 s 538 ms (execution: 1 s 492 ms, fetching: 46 ms)