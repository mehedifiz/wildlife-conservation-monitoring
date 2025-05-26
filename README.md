# postgreSQL-A2

## What is postgreSQL
 PostgreSQL হলো একটি অবজেক্ট-রিলেশনাল ডেটাবেস ম্যানেজমেন্ট সিস্টেম। যা আমাদের ধরনের ফিচার এবং ফ্লেক্সিবিলিটি অফার করে।

## What is the purpose of a database schema in PostgreSQL?

PostgreSQL এ ডাটাবেজ স্কিমার  উদ্দেশ্য হলো ডাটাবেজে কি কি ডাটা থাকবে তার একটি নির্দিষ্ট মডেল তৈরি করা। এতে আগে থেকে ডাটা এবং ডাটার ধরন নির্দিষ্ট করা থাকে।

```sql
CREATE TABLE rangers (
  ranger_id SERIAL PRIMARY KEY,
  name VARCHAR(25) NOT NULL,
  region VARCHAR(50) NOT NULL
);
```

## Explain the Primary Key and Foreign Key concepts in PostgreSQL 

 Primary Key হলো এমন একটি কী যা প্রতিটি সারিকে আলাদা করে চিনতে সাহায্য করে। প্রতিটি সারিতে অবশ্যই একটি Primary Key থাকতে হবে।

Foreign Key হলো অন্য একটি টেবিলের Primary Key। এটি দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।


## What is the difference between the VARCHAR and CHAR data types?

VARCHAR এবং CHAR দুটোই টেক্সট এর জন্য ব্যবহৃত হয়, তবে তাদের মধ্যে ছোট্ট পার্থক্য আছে।

CHAR হলো ফিক্সড লেখা , এতে একটি নির্দিষ্ট সংখ্যার কম ক্যারেক্টারস হলে বাকি ক্যারেক্টারস  জায়গায় স্পেস দিয়ে পূর্ণ করে দেয়।  

অন্যদিকে, VARCHAR এ  সর্বোচ্চ নির্দিষ্ট অক্ষর পর্যন্ত লেখা যাবে, কিন্তু কম অক্ষর দিলে কোনো সমস্যা হয় না বা স্পেস হয় না।

## Explain the purpose of the WHERE clause in a SELECT statement.

SELECT কমান্ড ডেটাবেস থেকে ডেটা গেট জন্য ব্যবহৃত হয়।

```sql
SELECT * from species;
```
এখানে species টেবিলের সব ডেটা পাওয়া যাবে। 

WHERE key দিয়ে আমরা নির্দিষ্ট শর্তে ডেটা খুঁজে পাই।

```sql
 select * from sightings 
  where location like '%pass%' ;
  ```


















