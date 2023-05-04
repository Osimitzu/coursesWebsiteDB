CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "name" varchar(35) NOT NULL,
  "age" smallint NOT NULL,
  "email" varchar(35) UNIQUE NOT NULL,
  "password" varchar(30) NOT NULL,
  "role_id" int NOT NULL
);

CREATE TABLE "roles" (
  "id" serial PRIMARY KEY,
  "role_name" varchar(30) NOT NULL
);

CREATE TABLE "courses" (
  "id" serial PRIMARY KEY,
  "title" varchar(35) NOT NULL,
  "description" text NOT NULL,
  "teacher" varchar(35) NOT NULL,
  "category_id" int NOT NULL,
  "level_id" int NOT NULL,
  "url_id" int NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" serial PRIMARY KEY,
  "url" varchar NOT NULL
);

CREATE TABLE "levels" (
  "id" serial PRIMARY KEY,
  "level_name" varchar(30) NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY,
  "category_name" varchar(30) NOT NULL
);

CREATE TABLE "users_courses" (
  "id" serial PRIMARY KEY,
  "users_id" int NOT NULL,
  "courses_id" int NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("role_id") REFERENCES "roles" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "courses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("id") REFERENCES "courses" ("url_id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("users_id") REFERENCES "users" ("id");

ALTER TABLE "users_courses" ADD FOREIGN KEY ("courses_id") REFERENCES "courses" ("id");

INSERT INTO roles (role_name) VALUES ('student'), ('teacher'), ('admin');

INSERT INTO levels (level_name) VALUES ('beginner'), ('medium'), ('advanced');

INSERT INTO users (name, age, email, password, role_id) VALUES ('Osiris', 25, 'osiris@academlo.com','academlo123', 1), ('Carlos', 27, 'carlos@academlo.com', 'academlo123', 1), ('Georg', 30, 'georg@academlo.com', 'academlo321', 3), ('Pedro', 28, 'pedro@academlo.com', 'academlo987', 2), ('Ian', 29, 'ian@academlo.com', 'academlo456', 2);

INSERT INTO categories (category_name) VALUES ('Web_Development'), ('Art'), ('3D_Animation'), ('photography'), ('Marketing');

INSERT INTO courses_videos (url) VALUES ('https://youtu.be/0fYi8SGA20k'), ('https://youtu.be/XxXyfkrP298'), ('https://youtu.be/I1cpb0tYV74'), ('https://youtu.be/FHTbsZEJspU'), ('https://youtu.be/CcBHZ0t2Qwc');

INSERT INTO courses (title, description, teacher, category_id, level_id, url_id) VALUES ('ReactJS', 'Curso completo de React :D', 'Pedro', 1, 3, 1), ('NodeJS', 'Curso completo de NodeJS :D', 'Ian', 1, 3, 2), ('Introducción a la Fotografia', 'Curso para empezar a aprender fotografia :D', 'Pedro', 4, 1, 3);

INSERT INTO users_courses (users_id, courses_id) VALUES (1, 1), (1, 2), (2, 1), (2, 3);

SELECT users.id, users.name, users.email, roles.role_name, courses.title, courses.description, courses.url_id FROM users JOIN roles ON users.role_id=roles.id JOIN courses ON users.id=courses.id JOIN courses_videos ON courses.url_id=courses_videos.id;