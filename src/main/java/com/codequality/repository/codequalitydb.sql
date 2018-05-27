CREATE DATABASE CodeQualityDB;

DROP TABLE IF EXISTS public.user;

CREATE TABLE public.user (
  id SERIAL PRIMARY KEY,
  username VARCHAR(20) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  bio TEXT
);

DROP TABLE IF EXISTS public.review_request;

CREATE TABLE public.review_request (
  id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  repository_link TEXT NOT NULL,
  open BOOLEAN NOT NULL,
  is_broken BOOLEAN NOT NULL,
  reviewer_feedback TEXT,
  FOREIGN KEY (user_id) REFERENCES public.user (id)
);

DROP TABLE IF EXISTS public.role;

CREATE TABLE public.role (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
 
DROP TABLE IF EXISTS public.user_role;
 
CREATE TABLE public.user_role (
  user_id INT NOT NULL,
  role_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES public.user (id),
  FOREIGN KEY (role_id) REFERENCES public.role (id)
);
 

INSERT INTO public.user (username, email, password_hash, first_name, last_name) VALUES 
('matthew45', 'matthew.adam@gmail.com', '$2a$10$OnETI3r6KpP/z1/Evg90pOLyhxmAMaLpNIkNTbz/UBTAOubmPxIT2', 'Matthew', 'Adam');
INSERT INTO public.user (username, email, password_hash, bio) VALUES 
('catalin67', 'catalin67@gmail.com', '$2a$10$lFxa5ydM3TiBlw6UYalC5etvTP5baMrPEPtZpLCxK2gm0UwCkyUUG', 'Beginner Java Programmer.');
INSERT INTO public.user (username, email, password_hash, first_name, last_name) VALUES 
('andrewbrown', 'andrew.brown@gmail.com', '$2a$10$nz5NwMjAMTiDJT4Ei5Uz/.V0KtEcBV62.t7vHy78rB69jbbW4ujM2', 'Andrew', 'Brown');
INSERT INTO public.user (username, email, password_hash) VALUES 
('lindamoore', 'linda.moore@gmail.com', '$2a$10$Onfpz3yedt4GK91WukZHVeys2dScdW53.SQ.g/HWyXXyYtH/SSQZ.');


INSERT INTO public.review_request (title, description, open, is_broken, user_id, repository_link) VALUES 
('Topological Sorting in Graphs', 'This algorithm performs the topological Sort on a given graph by the DFS method.The topological sort is performed on a directed acyclic graph.', 
TRUE, FALSE, 1, 'https://github.com/user/repositoryname');
INSERT INTO public.review_request (title, description, open, is_broken, reviewer_feedback, user_id, repository_link) VALUES 
('Check Whether Topological Sorting can be Performed in a Graph', 'This is a java program to check if topological sorting can be performed on graph or not. 
Topological sort exists only if there is not cycle in directed graph. In short this problem can be reduced to check if the given graph is Directed Acyclic Graph. 
If it is topological sort can be performed, not otherwise.', 
FALSE, FALSE, 'Nice job! I don''t have anything to add. Keep up the good work!', 1, 'https://github.com/user/repositoryname');
INSERT INTO public.review_request (title, description, open, is_broken, user_id, repository_link) VALUES 
('Create a Random Linear Extension for a DAG', 'This is a java program to create a random linear extension of DAG. Linear extension of DAG is nothing but topological sorting in simple terms.', 
TRUE, FALSE, 1, 'https://github.com/user/repositoryname');
INSERT INTO public.review_request (title, description, open, is_broken, user_id, repository_link) VALUES 
('Java Program to Find the Shortest Path Between Two Vertices Using Dijkstra''s Algorithm', 
'This is a Java Program to perform Dijkstra''s Shortest path algorithm. For a given source vertex (node) in the graph,
 the algorithm finds the path with lowest cost (i.e. the shortest path) between that vertex and every other vertex. 
It can also be used for finding costs of shortest paths from a single vertex to a single destination vertex by stopping 
the algorithm once the shortest path to the destination vertex has been determined. 
For example, if the vertices of the graph represent cities and edge path costs represent driving distances between pairs of cities
 connected by a direct road, Dijkstra''s algorithm can be used to find the shortest route between one city and all other cities.', 
TRUE, FALSE, 2, 'https://github.com/user/repositoryname');
INSERT INTO public.review_request (title, description, open, is_broken, user_id, repository_link) VALUES 
('Java Program to Perform Insertion in a BST', 
'This is a Java Program to perform insertion in the binary search tree.', 
TRUE, FALSE, 2, 'https://github.com/user/repositoryname');
INSERT INTO public.review_request (title, description, open, is_broken, reviewer_feedback, user_id, repository_link) VALUES 
('Java Program to Implement Binary Search Tree', 
'This is a Java Program to implement Binary Search Tree. A binary search tree (BST), sometimes also called an ordered or sorted binary tree, 
is a node-based binary tree data structure which has the following properties:
i) The left subtree of a node contains only nodes with keys less than the node’s key.
ii) The right subtree of a node contains only nodes with keys greater than the node’s key.
iii) The left and right subtree must each also be a binary search tree.
iv) There must be no duplicate nodes.
Generally, the information represented by each node is a record rather than a single data element. However, for sequencing purposes, 
nodes are compared according to their keys rather than any part of their associated records. 
The major advantage of binary search trees over other data structures is that the related sorting algorithms and search algorithms 
such as in-order traversal can be very efficient. Binary search trees are a fundamental data structure used to construct more abstract
data structures such as sets, multisets, and associative arrays.', 
FALSE, TRUE, 'Wrong repository link!', 2, 'https://github.com');


INSERT INTO public.role (name) VALUES ('USER');
INSERT INTO public.role (name) VALUES ('REVIEWER');


INSERT INTO public.user_role VALUES (1, 1);
INSERT INTO public.user_role VALUES (2, 1);
INSERT INTO public.user_role VALUES (3, 2);
INSERT INTO public.user_role VALUES (4, 2);
