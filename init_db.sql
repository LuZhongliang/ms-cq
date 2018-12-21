CREATE database db_example;
CREATE USER 'springuser'@'%' IDENTIFIED BY 'ThePassword';
GRANT ALL ON db_example.* TO 'springuser'@'%';
GRANT USAGE ON db_example.* TO 'springuser'@'%';
FLUSH PRIVILEGES;