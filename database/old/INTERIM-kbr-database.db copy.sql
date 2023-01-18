BEGIN TRANSACTION;
DROP TABLE IF EXISTS "courses";
CREATE TABLE IF NOT EXISTS "courses" (
	"course_id"	INTEGER NOT NULL,
	"course_name"	VARCHAR(64) DEFAULT 'Define course name' UNIQUE,
	"course_description"	VARCHAR(128),
	PRIMARY KEY("course_id")
);
DROP TABLE IF EXISTS "modules";
CREATE TABLE IF NOT EXISTS "modules" (
	"module_id"	INTEGER NOT NULL,
	"module_name"	VARCHAR(64) DEFAULT 'Define module name',
	"module_description"	VARCHAR(128),
	"partof_course_name"	VARCHAR(64),
	FOREIGN KEY("partof_course_name") REFERENCES "courses"("course_name"),
	PRIMARY KEY("module_id")
);
DROP TABLE IF EXISTS "tags";
CREATE TABLE IF NOT EXISTS "tags" (
	"tag_id"	INTEGER NOT NULL,
	"tag_name"	varchar(64),
	"tag_description"	varchar(128),
	"tag_createdby_username"	varchar(64),
	FOREIGN KEY("tag_createdby_username") REFERENCES "users"("username"),
	PRIMARY KEY("tag_id")
);
DROP TABLE IF EXISTS "course_details";
CREATE TABLE IF NOT EXISTS "course_details" (
	"id"	integer NOT NULL,
	"provider"	VARCHAR(255),
	"course"	VARCHAR(255),
	"module_nbr"	INT,
	"course_component"	VARCHAR(255),
	"component_type"	VARCHAR(255),
	"langauge"	VARCHAR(255),
	PRIMARY KEY("id")
);
INSERT INTO "courses" ("course_id","course_name","course_description") VALUES (1,'Programming with Web Technologies','This course provides a practical exploration of tools and techniques used to create modern, responsive websites and web apps. In this course, we will learn how technologies such as HTML5, CSS, JavaScript, Node JS, and SQL fit together to create the websites you see and use every day. The following video from Professor Gill Dobbie, Director of the Auckland ICT Graduate School, will provide you with an overview of the Postgraduate Certificate in Information Technology programme.'),
 (2,'Programming for Industry','This intensive hands-on course introduces object-oriented software development, which is the dominant paradigm for developing software in the IT industry. Using the Java programming language, Programming for Industry covers the key principles of object-oriented programming, encapsulation, inheritance, polymorphism and composition, in addition to fundamental modelling and design techniques. Students will develop application software of moderate complexity that draws on object-oriented language features, frameworks and tools. This course prepares students with foundational skills for a career in IT.'),
 (3,'Cloud Infrastructure Fundamentals with AWS','You''re going to find cloud services being used at nearly any enterprise you work for. So it''s important for us developers to at least have a high-level understanding of this infrastructure.

And since AWS has the dominant share of the cloud market, being familiar with it is incredibly valuable and opens a lot of doors.

But gaining that familiarity isn''t easy. Just browsing through the list of 200+ services is overwhelming.

Getting started with learning AWS usually involves having a dozen or more open tabs and the feeling that you''re going down a rabbit hole that never ends.

This course is an alternative to that stress. It has been structured like a boat tour on a river of knowledge, linearly guiding you through the core of AWS Cloud.

By the end of this course, you will be confidently spinning up servers, creating relational databases, storing static assets, and writing serverless functions with confidence.

So, whether you need to learn AWS for your current job or are looking to earn your cloud practitioner certification, start watching this course and gain the skills you need today.'),
 (4,'AWS Certified Cloud Practitioner','udemy - AWS Essentials CLF-C01');
INSERT INTO "modules" ("module_id","module_name","module_description","partof_course_name") VALUES (1,'Intro to HTML','In this first module, you''ll be introduced to one of the most fundamental building blocks of modern websites: HTML. We''ll begin with a brief discussion activity, in which you will introduce yourself to the rest of the class, and meet your fellow students. We then start to learn about some of the tools that you''ll be using in your sites, as you progress through the course.

This module''s objectives
By the end of this module, you should be able to:

distinguish between block and inline HTML elements
create basic tables 
embed anchors, images and other multimedia into a web page.	','Programming with Web Technologies'),
 (2,'Intro to CSS','In the first module, you learnt about some of the fundamental building blocks of a webpage using HTML. Now, it is time to move onto ways to style your pages. You will do this using CSS. 

This module''s objectives
By the end of this module, you should be able to:

differentiate between in line, internal, and external CSS
define colours, borders and fonts using CSS
apply the Document Object Model to CSS selectors
position elements on the page using CSS.','Programming with Web Technologies'),
 (3,'Advanced CSS','In this module, we will continue our exploration of all things CSS. Specifically, we will be looking at how to use filters, transforms, transitions and animations. All of these are ways to manipulate elements on the page. 

We will then be covering modern CSS layout techniques, including Flexbox and Grid, before we examine responsive design—the practice of building webpages that are responsive to changes in browser characteristics, like changing screen sizes and differences between mobile and desktop browsers. 

This module''s objectives
By the end of this module, you should be able to:

apply CSS transitions and animations to animate page elements
use CSS Grid and Flexbox to create modern page layouts
use CSS media queries to adapt your page layout based on browser characteristics such as screen size and orientation.','Programming with Web Technologies'),
 (4,'Intro to JavaScript','Now, we''re really into the swing of things and starting to get a feel for creating responsive and dynamic web pages. For the next couple of modules, we''ll be focusing on client-side JavaScript (JS).

It''s worth noting up front that these modules may be easier for those students who have already completed COMPSCI 718 Programming for Industry, but if you haven''t yet done so, don''t worry. You''re going to be just fine, too. 

In this series, we’ll talk about why we would want JS in our webpages, and how to include it. We’ll then go over basic concepts—variables, strings, and console debugging. Finally, we’ll jump right into how we can actually interact with our HTML from JavaScript, to bend the page to our will.

This module''s objectives
By the end of this module, you should be able to:

add <script> tags to your HTML which point to JavaScript code to run
declare and modify variables in JavaScript, including numbers and strings
query and modify webpage contents using JavaScript
understand Boolean (true/false) logic and operators, and use them to conditionally execute code
loop through arrays of content in JavaScript, to modify many page elements at once.','Programming with Web Technologies'),
 (5,'JavaScript 2','As we continue with our focus on JavaScript, you will now be introduced to functions. You will also spend some more time on event handling, as well as discovering how to use JS packages, in particular, JSON.

This module''s objectives
By the end of this module, you should be able to:

understand and write your own JavaScript functions
handle more events, such as button clicks, text input, and timer events
read and write data formatted as JSON/JS objects.','Programming with Web Technologies'),
 (6,'JS 3 - fetch() and async programming','This module represents the last of the client-side JavaScript-focused topics. In particular, we will be looking at one of the most useful functions in JavaScript—fetch(). We''ll also be discussing asynchronous programming, as fetch() is an asynchronous function. The module will introduce what this means, and why it''s necessary, and focus on the easiest way to use asynchronous functions in your code. 

This module''s objectives
By the end of this module, you should be able to:

identify what AJAX is, and where it fits with fetch()
define both synchronous and asynchronous code
use async and await in your code
discuss alternatives that you might encounter when searching for fetch() examples.','Programming with Web Technologies'),
 (7,'Node.js and Express','In the first half of the course, we’ve looked entirely at client-side code—that is, the HTML, CSS and JavaScript which runs within your web browser to create the frontends that users see and use.

For the remainder of the course, we’re going to be looking at the backend infrastructure of a web app. Often, servers will need to contain some logic and data storage, beyond simply serving up HTML, CSS, JS files, images, etc. There are many ways in which we can write this logic and provide data storage.

In this course, we’ll be looking at Node.js, coupled with several convenient libraries and frameworks such as Express, to provide this logic. Later on we’ll also be looking at SQLite databases to provide the data storage for us.

This module''s objectives
By the end of this module, you should be able to:

create a “Hello world” server using Node.js and Express which serves basic text content to a client (web browser)
serve JSON data to a client
serve different content depending on the URL (or route) navigated by the client, using different route handlers
handle user input such as form submission from your node.js / Express code.','Programming with Web Technologies'),
 (8,'Handlebars and file uploading/processing','In this module we’re going to be looking at how we can output HTML from our node.js backend code. Please note that we don’t mean serving static HTML files—we looked at that in the previous module. Instead, we are interested in programmatically generating HTML within our JavaScript—a bit like how we can modify HTML from within our client-side JS code (but this time the modification happens on the server before the HTML ever reaches the client).

We’ll first look at how this can be done manually. Then, we’ll look at how to do it properly, using a view engine—specifically, Handlebars.

This module''s objectives
By the end of this module, you should be able to:

understand the file and directory structure required by Handlebars
understand the difference between a view and a layout
pass data to your Handlebars files using res.locals
improve the functionality of your Handlebars files using helpers such as #if and #each.','Programming with Web Technologies'),
 (9,'Cookies, Modules and Routers','In this module, we look at several, additional useful concepts related to node.js and Express. These include handling file uploads using the Multer package, storing data in the browser using cookies, and better code organisation using node.js modules and Express routers.

This module''s objectives
By the end of this module, you should be able to:

handle file uploads using the Multer package, both separately and in conjunction with other data submitted via HTML forms
create and manipulate HTTP Cookies to store small amounts of data within the browser
organise your server-side code into separate files using node.js modules
separate your Express route handlers into different files using Express routers.','Programming with Web Technologies'),
 (10,'Databases','Databases are an important and ubiquitous part of modern software development. They allow users to store and query vast amounts of data very efficiently. Relational, SQL-based databases are the most commonly used databases to date, and modern database management systems leverage decades of research & development experience to deliver their functionality.

In this module, you’ll learn about SQL and how to create and query SQLite databases. The knowledge you gain here is directly transferrable to any other SQL-based database, such as MySQL, OracleDB, or Microsoft’s SQL Server.

In addition, you’ll learn about how to design databases, from real-world descriptions given by clients. In doing so, you’ll gain experience with the Entity-Relational (ER) model and will learn how to draw ER diagrams to visualise database structure.

This module''s objectives
By the end of this module, you should be able to:

create SQLite databases and database tables
relate multiple tables together using foreign keys
add and remove data to/from database tables
query data in databases, originating from a single, or multiple, tables
draw Entity-Relationship (ER) diagrams from textual descriptions given by clients
create databases based on these ER diagrams','Programming with Web Technologies'),
 (11,'Full Stack','In the previous module, we learned about SQLite databases, and saw what a valuable tool they are for storing, manipulating, and querying data. In this module, we’ll tie this into our node.js backends in order to create truly full-stack web applications.

This module''s objectives
By the end of this module, you should be able to:

execute SQL statements from within your node.js backend code
use SQL template strings to ease the process of dynamically generating SQL queries
understand the Data Access Object (DAO) pattern, and how organising our database access code in this manner leads to superior code readability and maintainability
add a new full-stack feature to a webapp—that is, a feature that requires all three of i) database, ii) backend, and iii) frontend code.','Programming with Web Technologies'),
 (12,'Introduction to Programming (M-1)','n this module, you will learn the key concepts of object-oriented programming, including classes and objects. You will learn to define different methods such as methods with parameters and methods with return values. You will also see more use of static and instance methods from common predefined Java classes. You will learn to create local variables and understand their scope.

This module''s objectives
By the end of this module, you should be able to:

explain the key concepts of object-oriented programming, and construct variables and methods in classes
differentiate between static and instance methods in a Java program, and use these methods from common predefined Java classes such as String
explain what local variables are and their scope
explain how information is shared between objects and/or between methods within the same object.','Programming for Industry'),
 (13,'Introduction to object-oriented programming (OOP) (M-2)','In this module, you will learn the key concepts of object-oriented programming, including classes and objects. You will learn to define different methods such as methods with parameters and methods with return values. You will also see more use of static and instance methods from common predefined Java classes. You will learn to create local variables and understand their scope.

This module''s objectives
By the end of this module, you should be able to:

explain the key concepts of object-oriented programming, and construct variables and methods in classes
differentiate between static and instance methods in a Java program, and use these methods from common predefined Java classes such as String
explain what local variables are and their scope
explain how information is shared between objects and/or between methods within the same object.','Programming for Industry'),
 (14,'Control Flow (M-3)','In this module, you will learn to define different Boolean expressions and use them to implement control structures in Java. You will also learn to implement repetition using while and for loops. Moreover, you will learn how to control the flow of a program using statements such as break and continue.

This module''s objectives
By the end of this module, you should be able to:

evaluate different Boolean expressions, including recognising logical and relational operators, and their order of precedence
differentiate between reference equality and value equality
implement different control structures in a program using if, if-else and switch statements
implement repetition using while and for loops in a program
explain the differences between break, continue and return statements.','Programming for Industry'),
 (15,'Arrays and Classes (M-4)','In this module, you will learn how to use arrays to store different types of data. You will also construct new classes and create various objects. By the end of this module, you will be able to identify different types of visibility modifiers used in a Java program. You will also be able to explain important object-oriented programming concepts such as abstraction and information hiding.

This module''s objectives
By the end of this module, you should be able to:

construct arrays of primitive types and object types
use loops to process elements in an array
construct classes, objects and understand the differences between them
describe different types of visibility modifiers used for classes, methods, and variables, and their scope
explain the concepts of abstraction, encapsulation and information hiding
explain how to use the “this” keyword.','Programming for Industry'),
 (16,'Introduction to Cloud Infrastructure Fundamentals with AWS','Introduction to Cloud Infrastructure Fundamentals with AWS','Cloud Infrastructure Fundamentals with AWS'),
 (17,'Understand the Advantages of AWS and Cloud Services','Understand the Advantages of AWS and Cloud Services','Cloud Infrastructure Fundamentals with AWS'),
 (18,'Overview of AWS Elastic Compute Cloud (EC2) Purpose and Pricing','Overview of AWS Elastic Compute Cloud (EC2) Purpose and Pricing','Cloud Infrastructure Fundamentals with AWS'),
 (19,'Create and Configure an AWS EC2 Instance','Create and Configure an AWS EC2 Instance','Cloud Infrastructure Fundamentals with AWS'),
 (20,'Connect to an AWS EC2 Instance via SSH','Connect to an AWS EC2 Instance via SSH','Cloud Infrastructure Fundamentals with AWS'),
 (21,'Compare AWS, DocumentDB DynamoDB and RDS','Compare AWS, DocumentDB DynamoDB and RDS','Cloud Infrastructure Fundamentals with AWS'),
 (22,'Overview of AWS Relational Database Service (RDS) Features and Pricing','Overview of AWS Relational Database Service (RDS) Features and Pricing','Cloud Infrastructure Fundamentals with AWS'),
 (23,'Create a New AWS RDS Instance','Create a New AWS RDS Instance','Cloud Infrastructure Fundamentals with AWS'),
 (24,'Delete an AWS RDS Instance','Delete an AWS RDS Instance','Cloud Infrastructure Fundamentals with AWS'),
 (25,'Overview of S3 (Simple Storage Service)','Overview of S3 (Simple Storage Service)','Cloud Infrastructure Fundamentals with AWS'),
 (26,'Create an AWS S3 Bucket for Hosting a Static React App','Create an AWS S3 Bucket for Hosting a Static React App','Cloud Infrastructure Fundamentals with AWS'),
 (27,'Create a User with Programmatic S3 Access with AWS IAM','Create a User with Programmatic S3 Access with AWS IAM','Cloud Infrastructure Fundamentals with AWS'),
 (28,'Configure an AWS S3 User in the AWS CLI','Configure an AWS S3 User in the AWS CLI','Cloud Infrastructure Fundamentals with AWS'),
 (29,'Streamline Deployments to AWS S3 with a Deploy Script in package.json','Streamline Deployments to AWS S3 with a Deploy Script in package.json','Cloud Infrastructure Fundamentals with AWS'),
 (30,'Overview of AWS Lambda and API Gateway','Overview of AWS Lambda and API Gateway','Cloud Infrastructure Fundamentals with AWS'),
 (31,'Write and Test Your First AWS Lambda Function','Write and Test Your First AWS Lambda Function','Cloud Infrastructure Fundamentals with AWS'),
 (32,'Add an API Gateway HTTP Endpoint Trigger to a Lambda Function in AWS','Add an API Gateway HTTP Endpoint Trigger to a Lambda Function in AWS','Cloud Infrastructure Fundamentals with AWS'),
 (33,'Where to Go After Learning the Cloud Infrastructure Fundamentals','Where to Go After Learning the Cloud Infrastructure Fundamentals','Cloud Infrastructure Fundamentals with AWS'),
 (34,'Section 2: Accessing & Using AWS','Section 2: Accessing & Using AWS','AWS Certified Cloud Practitioner'),
 (35,'Section 3: Account Security, Permissions','Section 3: Account Security, Permissions','AWS Certified Cloud Practitioner'),
 (36,'Section 4: Getting Started with Compute Services & EC2
','Section 4: Getting Started with Compute Services & EC2','AWS Certified Cloud Practitioner'),
 (37,'Section 5: Managing Cloud Networks via VPCs (Virtual Private Cloud)','Section 5: Managing Cloud Networks via VPCs (Virtual Private Cloud)','AWS Certified Cloud Practitioner'),
 (38,'Section 6: Scaling & Load Balancing -From Small To Big (And Back)','Section 6: Scaling & Load Balancing -From Small To Big (And Back)','AWS Certified Cloud Practitioner'),
 (39,'Section 7: Storing Files with EBS & EFS (Elastic Block Store & Elastic File System)','Section 7: Storing Files with EBS & EFS (Elastic Block Store & Elastic File System)','AWS Certified Cloud Practitioner'),
 (40,'Section 8: S3 (Simple Storage Service) - Storing Any Objects From Anywhere','Section 8: S3 (Simple Storage Service) - Storing Any Objects From Anywhere','AWS Certified Cloud Practitioner'),
 (41,'Section 9: Databases in the Cloud: RDS, Aurora, ElastiCache & DynamoDB','Section 9: Databases in the Cloud: RDS, Aurora, ElastiCache & DynamoDB','AWS Certified Cloud Practitioner'),
 (42,'Section 10: Global Networking & Content Delivery with Route53, CloudFront & More','Section 10: Global Networking & Content Delivery with Route53, CloudFront & More','AWS Certified Cloud Practitioner'),
 (43,'Section 11: More Compute: Serverless Container Services (Lambda, ECS, EKS, ECR)','Section 11: More Compute: Serverless Container Services (Lambda, ECS, EKS, ECR)','AWS Certified Cloud Practitioner'),
 (44,'Section 12: Building Serverless REST GraphQL APIs via API Gateway & AppSync','Section 12: Building Serverless REST GraphQL APIs via API Gateway & AppSync','AWS Certified Cloud Practitioner'),
 (45,'Section 13: Simplifying Application Deployment via Elastic Beanstalk, Lightsail AppRunner ','Section 13: Simplifying Application Deployment via Elastic Beanstalk, Lightsail AppRunner ','AWS Certified Cloud Practitioner'),
 (46,'Section 14: App Integration with SQS, SNS & EventBridge','Section 14: App Integration with SQS, SNS & EventBridge','AWS Certified Cloud Practitioner'),
 (47,'Section 15: Monitoring Workloads','Section 15: Monitoring Workloads','AWS Certified Cloud Practitioner'),
 (48,'Section 16: Managing Compute Resources At Scale','Section 16: Managing Compute Resources At Scale','AWS Certified Cloud Practitioner'),
 (49,'Section 17: Cloud Migration & Hybrid Cloud Solutions','Section 17: Cloud Migration & Hybrid Cloud Solutions','AWS Certified Cloud Practitioner'),
 (50,'Section 18: Data Analytics & Data Science','Section 18: Data Analytics & Data Science','AWS Certified Cloud Practitioner'),
 (51,'Section 19: Cloud Management','Section 19: Cloud Management','AWS Certified Cloud Practitioner'),
 (52,'Section 20: Security - A Closer Look','Section 20: Security - A Closer Look','AWS Certified Cloud Practitioner'),
 (53,'Section 21: Developing For, With & In The Cloud','Section 21: Developing For, With & In The Cloud','AWS Certified Cloud Practitioner'),
 (54,'Section 22: Other Services','Section 22: Other Services','AWS Certified Cloud Practitioner'),
 (55,'Section 23: Cloud Best Practices','Section 23: Cloud Best Practices','AWS Certified Cloud Practitioner'),
 (56,'Section 24: Beyond AWS Services - Additional Offerings','Section 24: Beyond AWS Services - Additional Offerings','AWS Certified Cloud Practitioner'),
 (57,'Section 25: Preparing For The Exam','Section 25: Preparing For The Exam','AWS Certified Cloud Practitioner'),
 (58,'Section 1: Getting Started','Section 1: Getting Started','AWS Certified Cloud Practitioner');
INSERT INTO "tags" ("tag_id","tag_name","tag_description","tag_createdby_username") VALUES (1,'How','Describes how to do something','drcuoa'),
 (2,'Why','Describes why we would do something or why is it important to know something','drcuoa'),
 (3,'What','Describes something important in details, like an explanation of a concept',NULL);
INSERT INTO "cards" ("card_id","name","description","tag_id","course_name","module_id","createdby_username","createdby_id","status","link_name","full_URL") VALUES (1,'Basic structure of a Java program','<p><strong>CLASS -&nbsp;</strong>cookie cutter, a class is a collection of methods that form a blueprint for making objects.&nbsp; In Java, the class is either public or static, and the naming of class and the .java file must match (Java is also strictly case sensitive)&nbsp;</p>
<p><strong>METHOD </strong>-&nbsp; contains a sequence of statements that together perform a <strong>Task</strong></p>
<pre><code>public void start() {
    System.out.println("Hello World");
}</code></pre>
<p><strong>STATEMENT </strong>- a single instruction, all statements end with a semi-colon ; .</p>
<p><code>System.out.println("Hello World"); </code></p>
<p><strong>VARIABLE</strong> -&nbsp; a place in memory of the computer where a&nbsp;<strong>single&nbsp;</strong>piece of information can be stored.&nbsp; In our example we have created one variable called p:</p>
<p><code>MyFirstProgram p = new MyFirstProgram();</code></p>
<p><strong>IDENTIFIER -&nbsp;</strong>is the name given to classes, methods and variables in our program.&nbsp; In our example we have the following identifiers:</p>
<ul>
<li>MyFirstProgram</li>
<li>start</li>
<li>main</li>
<li>p</li>
</ul>
<p><span style="font-size: 8pt;">IMPORTANT<strong>:&nbsp;</strong>Be careful of the code conventions when creating identifiers. All class identifiers (class names) must start with an upper case letter. All method identifiers (method names) start with a lower case letter. By default, variable identifiers (variable names) start with a lower case letter. Every subsequent word that makes up any identifier should start with an upper case letter. All other letters should be lower case. This is known as&nbsp;<a href="https://en.wikipedia.org/wiki/Camel_case" target="_blank" rel="noreferrer noopener">camelCase&nbsp;(Links to an external site.)</a>&nbsp;(Wikipedia, 2020). </span></p>
<p><strong>PACKAGE&nbsp;</strong>-&nbsp; A package helps us to organize a set of related classes together.&nbsp; A package name is a dot-separated list of identifiers.&nbsp; Packages are organized in hierarchical structures, much like ordinary directories.&nbsp; They are either built-in or user-defined.&nbsp; Package statements should be the first line in the class&nbsp;&nbsp;</p>
<p><span style="font-size: 8pt;">Whenever you want to use a class from any package, you can use the fully qualified name. However, you will find sometimes that the fully qualified name is long and difficult to read. We can use the keyword&nbsp;<samp>import</samp>&nbsp;to tell the Java compiler that we are going to be using a particular class from a particular package. We will talk more about&nbsp;<samp>import</samp>&nbsp;later in the module. </span></p>
<p><strong>COMMENT - </strong></p>
<p>single line</p>
<p><code>// this is a comment</code></p>
<p>or multi</p>
<p><code>/* this&nbsp;</code></p>
<p><code>* is also a comment.</code></p>
<p><code></code><code>*/</code></p>
<p><strong>JAVADOC COMMENT - &nbsp;</strong>This will not be examined in the course, but it''s useful to know.</p>
<p><span style="font-size: 8pt;">There is another type of comment called Javadoc comments. You can generate Java code documentation from the source code by using Javadoc. A Javadoc comment starts with&nbsp;<strong>/**</strong>&nbsp;and ends with&nbsp;<strong>*/</strong>. A Javadoc comment also contains descriptive tags such as&nbsp;<samp>@author</samp>&nbsp;(author of the code),&nbsp;<samp>@param</samp>&nbsp;(parameters of the method), and&nbsp;<samp>@return</samp>&nbsp;(what the method returns).</span></p>',3,'',12,'drcuoa',2,'2','1.4 Basic Structure of a Java Program','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-4-basic-structure-of-a-java-program?module_item_id=1406300'),
 (2,'Java Style and Code Conventions','<p><span style="font-size: 10pt;">For more on Java style guidelines, see the&nbsp;<a href="https://google.github.io/styleguide/javaguide.html" target="_blank" rel="noreferrer noopener">Google Java Style Guide&nbsp;(Links to an external site.)</a>&nbsp;(Google, n.d.)</span></p>
<p>When writing code, the computer must understand what we write. That is, we need to ensure that the syntax is correct, and the program produces the results that we want. In addition, we should always follow the rules of good programming style and code conventions to ensure other people can read and understand what we write. Writing with good code style is important as it enables us to understand and maintain code easily. Good code also helps us to identify problems or bugs in a more effective and efficient manner.</p>
<p>Let''s have another look at&nbsp;<samp>MyFirstProgram</samp>&nbsp;class.</p>
<p>The Java compiler ignores any white space (spaces, tabs, blank lines) between different parts of the program. However, when we write programs, we want to lay out our source code so it is easy for us to read, as illustrated in the example. We use indentation to make sure our code is easy to read. We indent all statements appearing between a pair of braces,&nbsp;<strong>{}</strong>, according to the following rules:</p>
<ul>
<li>Opening braces, {, are always at the ends of lines.</li>
<li>Closing braces, }, appear on lines by themselves and line up with the first character on the line with the corresponding opening brace.</li>
<li>All lines between the opening and closing brace are indented from the position of the first character on the line with the opening brace.</li>
<li>The indentation can be done using tabs rather than spaces.</li>
</ul>
<p>In the example, we also name our identifiers according to the following rules:</p>
<ul>
<li>Class names should be nouns, and in camel case, with the first letter capitalised, e.g.&nbsp;<samp>MyFirstProgram</samp></li>
<li>Method names should be verbs, and in camel case, with a lowercase first letter, e.g.&nbsp;<samp>start</samp></li>
<li>Variable names should indicate the intent of its use. The names are in camel case, with a lowercase first letter, e.g.&nbsp;<samp>p</samp></li>
<li>Package names should be all lowercase, e.g.&nbsp;<samp>industry.lab.introtojava.examples</samp></li>
</ul>
<p>&nbsp;</p>',3,'',12,'drcuoa',2,'1','UOA Canvas Link','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-4-basic-structure-of-a-java-program?module_item_id=1406300'),
 (3,'Java Reserved Words','<p>The reserved words in Java are the ones that have a special meaning in the language such as&nbsp;<samp>public</samp>&nbsp;and&nbsp;<samp>class</samp>. You may not use any of these words as identifiers, i.e. names of a variable, class or method. In the&nbsp;<samp>MyFirstProgram</samp>&nbsp;example, you have seen the following keywords:</p>
<p>class, new, package, public, static, void</p>
<p>We will explain the keywords used in the example later in this course. You will also see more keywords used later on. The complete list is:</p>
<table width="601">
<tbody>
<tr>
<td width="113">
<p>abstract</p>
</td>
<td width="132">
<p>continue</p>
</td>
<td width="123">
<p>for</p>
</td>
<td width="123">
<p>new</p>
</td>
<td width="110">
<p>switch</p>
</td>
</tr>
<tr>
<td width="113">
<p>assert</p>
</td>
<td width="132">
<p>default</p>
</td>
<td width="123">
<p>goto</p>
</td>
<td width="123">
<p>package</p>
</td>
<td width="110">
<p>synchronized</p>
</td>
</tr>
<tr>
<td width="113">
<p>boolean</p>
</td>
<td width="132">
<p>do</p>
</td>
<td width="123">
<p>if</p>
</td>
<td width="123">
<p>private</p>
</td>
<td width="110">
<p>this</p>
</td>
</tr>
<tr>
<td width="113">
<p>break</p>
</td>
<td width="132">
<p>double</p>
</td>
<td width="123">
<p>implements</p>
</td>
<td width="123">
<p>protected</p>
</td>
<td width="110">
<p>throw</p>
</td>
</tr>
<tr>
<td width="113">
<p>byte</p>
</td>
<td width="132">
<p>else</p>
</td>
<td width="123">
<p>import</p>
</td>
<td width="123">
<p>public</p>
</td>
<td width="110">
<p>throws</p>
</td>
</tr>
<tr>
<td width="113">
<p>case</p>
</td>
<td width="132">
<p>enum</p>
</td>
<td width="123">
<p>instanceof</p>
</td>
<td width="123">
<p>return</p>
</td>
<td width="110">
<p>transient</p>
</td>
</tr>
<tr>
<td width="113">
<p>catch</p>
</td>
<td width="132">
<p>extends</p>
</td>
<td width="123">
<p>int</p>
</td>
<td width="123">
<p>short</p>
</td>
<td width="110">
<p>try</p>
</td>
</tr>
<tr>
<td width="113">
<p>char</p>
</td>
<td width="132">
<p>final</p>
</td>
<td width="123">
<p>interface</p>
</td>
<td width="123">
<p>static</p>
</td>
<td width="110">
<p>void</p>
</td>
</tr>
<tr>
<td width="113">
<p>class</p>
</td>
<td width="132">
<p>finally</p>
</td>
<td width="123">
<p>long</p>
</td>
<td width="123">
<p>strictfp</p>
</td>
<td width="110">
<p>volatile</p>
</td>
</tr>
<tr>
<td width="113">
<p>const</p>
</td>
<td width="132">
<p>float</p>
</td>
<td width="123">
<p>native</p>
</td>
<td width="123">
<p>super</p>
</td>
<td width="110">
<p>while</p>
</td>
</tr>
</tbody>
</table>
<p>There are also three reserved words for literal values: true, false, null.</p>
<p>In addition, there are two special identifiers introduced in Java 9 and 10 respectively that cannot be used as identifiers: _ (underscore), var</p>',3,'',12,'drcuoa',2,'1','Canvas Link','Java Reserved Words'),
 (4,'Literals and escape sequences','<p>In Java, we have values that can be typed directly into the source code, these are called <strong>LITERALS.&nbsp;&nbsp;</strong>There are five different types of literals:</p>
<p>1. Integer literals: whole numbers, <code>399</code>, <code>23,</code> -<code>56</code></p>
<p>2. Floating-Point literals: <code>0.32352</code>, <code>-9.8</code></p>
<p>3. Boolean Literal - used for making logical decisions in our code, either <code><strong>true</strong></code> or <code><strong>false</strong></code></p>
<p>4. Character Literals,&nbsp; single-character symbols within <strong>single quote marks</strong> <code>''a''</code>&nbsp; &nbsp;<code>''A''</code></p>
<p>5. String Literals, sequences of characters surrounded by <strong>double quote marks&nbsp; <code>"hello peps"</code></strong></p>
<p>We can use&nbsp;<samp>System.out.println()</samp>&nbsp;to print any literal value to the screen. For example:&nbsp;</p>
<div>
<pre><code>System.out.println(-45);
System.out.println(0.034);
System.out.println(true);
System.out.println(''g'');
System.out.println("This is a String");</code></pre>
<div title="Edit &amp; Save To Grepper">Note that you can use <code><samp>System.out.print()</samp>&nbsp;</code>if you don&rsquo;t want to add a carriage return (newline) at the end of the text.</div>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<div title="Edit &amp; Save To Grepper">
<h2>Escape sequences</h2>
<p>In Java, not all characters inside a String can be displayed as it is. To display these special characters, we can put a backslash,&nbsp;<strong>\</strong>, before each character. For example, to display a String containing quotation marks to the screen, such as: Hello, "World"!</p>
<p>The following code will produce the desired output:</p>
<div>
<pre>System.out.println("Hello, \"World\"!");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>The backslash character is called the&nbsp;<strong>escape character</strong>, and the character sequence&nbsp;<strong>\"</strong>&nbsp;is called an&nbsp;<strong>escape sequence</strong>. Here are some useful escape sequences:</p>
<figure>
<table style="width: 982.07px; height: 200px;" width="100%" cellpadding="10"><caption>Escape sequences</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 10px; width: 435.918px;" scope="col"><strong>Escape sequence</strong></th>
<th style="height: 10px; width: 510.449px;" scope="col">Meaning</th>
</tr>
</thead>
<tbody>
<tr style="height: 53px;">
<td style="width: 435.918px; height: 53px;" width="301">
<p>\''</p>
</td>
<td style="width: 510.449px; height: 53px;" width="301">
<p>Single quote</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 435.918px; height: 53px;" width="301">
<p>\"</p>
</td>
<td style="width: 510.449px; height: 53px;" width="301">
<p>Double quote</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 435.918px; height: 53px;" width="301">
<p>\\</p>
</td>
<td style="width: 510.449px; height: 53px;" width="301">
<p>Backslash</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 435.918px; height: 53px;" width="301">
<p>\n</p>
</td>
<td style="width: 510.449px; height: 53px;" width="301">
<p>New line</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 435.918px; height: 53px;" width="301">
<p>\t</p>
</td>
<td style="width: 510.449px; height: 53px;" width="301">
<p>Tab</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Java escape sequences (2021) courtesy of University of Auckland</figcaption>
</figure>
</div>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>',3,'',12,'drcuoa',2,'1','1.5 Literals and escape sequences','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-5-literals-and-escape-sequences?module_item_id=1406301'),
 (5,'Variables','<p>Declaring the variable - give it a name that can be used to set aside a space [location] in memory and say what type of data it is.&nbsp; A variable can only stored one ''type'' of data and have one value at a time in the place in memory that the name declared refers to.</p>
<p>The general format is:</p>
<p>data-type variable-identifier;&nbsp;</p>
<p>eg.</p>
<pre><code>int x; double myNumber;</code></pre>
<p>If you are declaring multiple variables which all have the same type, then you are allowed to declare them all at once by specifying the type, then listing all the variable names separating each one with a comma. For example:</p>
<pre><code>int x1, x2, x3;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>Once you have declared a variable, you are not permitted to declare another variable with the same name within the same block of code. A block of code is a set of statements enclosed in curly braces {}. For example, if you tried to compile the following code, then the compiler would generate an error message telling you that the variable x has already been defined.</p>
<pre><code>int x; <br />double myNumber; <br />int x;</code></pre>
<p>After you have declared a variable, you can assign a value to that variable. The general format for an assignment statement is:</p>
<pre><code>variable_identifier = value;</code></pre>
<p>For example:</p>
<pre><code>int x; <br />x = 10;</code></pre>
<p>The first time we assign a value to a variable is known as initialising a variable. We can also assign a value to a variable when we declare the variable at the same time. The previous example is the same as the following statement:</p>
<pre><code>int x = 10;</code></pre>',3,'',12,'drcuoa',2,'1','Canvas Link ( 1.6 Variables, primitive data types, and symbolic constants)','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-6-variables-primitive-data-types-and-symbolic-constants?module_item_id=1406302'),
 (6,'Primitive Data Types','<p>Data type specifies the kind of information we are storing.</p>
<p>A data type specifies the kind of information we are storing. In Java, we can only store data of a particular type in a variable that is declared as being of that same type. For example, if the variable is declared as being an <samp>int</samp>&nbsp;(integer), then the value being stored must also be an&nbsp;<samp>int</samp>. The first statement in the following example will compile in Java as we assign an integer value to variable&nbsp;<samp>x</samp>. The second statement will not compile in Java as we try to assign a String value to variable&nbsp;<samp>y</samp>.</p>
<pre><code>int x = 3;<br />int y = "3";
</code></pre>
<p>In Java, we store information in either:</p>
<ul>
<li>a primitive data type variable such as&nbsp;<samp>int</samp>, or</li>
<li>an object type variable such as&nbsp;<samp>String.</samp></li>
</ul>
<p>We will talk more about object type later. Let&rsquo;s take a look at the primitive data types first. In Java, there are eight primitive data types.</p>
<ol>
<li><strong>Integers</strong>: are whole numbers. To fit in with the properties of the computer&rsquo;s memory, limits are set on the size of the integer numbers. In Java, there are four different integer types, each of which take up a different amount of memory (the larger the memory space, the bigger the number we are able to store). The following table summarises this information:<br />
<figure>
<table style="width: 924.57px; height: 182px;" width="100%" cellpadding="20"><caption>Types of integer</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 65px; width: 175.586px;" scope="col">Type</th>
<th style="height: 65px; width: 187.422px;" scope="col">Memory required</th>
<th style="width: 241.484px; height: 65px;">Smallest number</th>
<th style="height: 65px; width: 249.922px;" scope="col">Largest number</th>
</tr>
</thead>
<tbody>
<tr>
<td style="width: 175.586px;" width="150">
<p>byte</p>
</td>
<td style="width: 187.422px;" width="150">
<p>8 bits</p>
</td>
<td style="width: 241.484px;" width="150">
<p>-128</p>
</td>
<td style="width: 249.922px;" width="150">
<p>127</p>
</td>
</tr>
<tr>
<td style="width: 175.586px;" width="150">
<p>short</p>
</td>
<td style="width: 187.422px;" width="150">
<p>16 bits</p>
</td>
<td style="width: 241.484px;" width="150">
<p>-32,768</p>
</td>
<td style="width: 249.922px;" width="150">
<p>32,767</p>
</td>
</tr>
<tr>
<td style="width: 175.586px;" width="150">
<p>int</p>
</td>
<td style="width: 187.422px;" width="150">
<p>32 bits</p>
</td>
<td style="width: 241.484px;" width="150">
<p>-2<sup>31&nbsp;</sup>&nbsp;&nbsp;</p>
</td>
<td style="width: 249.922px;" width="150">
<p>2<sup>31&nbsp;</sup>- 1</p>
</td>
</tr>
<tr>
<td style="width: 175.586px;" width="150">
<p>long</p>
</td>
<td style="width: 187.422px;" width="150">
<p>64 bits</p>
</td>
<td style="width: 241.484px;" width="150">
<p>-2<sup>63</sup></p>
</td>
<td style="width: 249.922px;" width="150">
<p>2<sup>63&nbsp;</sup>- 1</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Types of integer (2020) courtesy of University of Auckland</figcaption>
</figure>
<p>In this course, we will normally use the&nbsp;<samp>int</samp>&nbsp;type. When working with very large numbers, we will use the&nbsp;<samp>long</samp>&nbsp;type.</p>
</li>
<li><strong>Floating-point numbers</strong>: are real numbers which have a decimal point. In Java, there are two types of floating-point numbers.<br />
<figure>
<table style="width: 924.57px; height: 135px;" width="100%" cellpadding="20"><caption>Floating point numbers</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 65px; width: 142.402px;" scope="col">Type</th>
<th style="height: 65px; width: 214.629px;" scope="col">Memory required</th>
<th style="width: 243.789px; height: 65px;">Smallest number</th>
<th style="height: 65px; width: 253.594px;" scope="col">Largest number</th>
</tr>
</thead>
<tbody>
<tr>
<td style="width: 142.402px;" width="138">
<p>float</p>
</td>
<td style="width: 214.629px;" width="138">
<p>32 bits</p>
</td>
<td style="width: 243.789px;" width="138">
<p>+/- 1.4 E-45</p>
</td>
<td style="width: 253.594px;" width="138">
<p>+/- 3.4 E+38</p>
</td>
</tr>
<tr>
<td style="width: 142.402px;" width="138">
<p>double</p>
</td>
<td style="width: 214.629px;" width="138">
<p>64 bits</p>
</td>
<td style="width: 243.789px;" width="138">
<p>+/- 4.9 E-324</p>
</td>
<td style="width: 253.594px;" width="138">
<p>+/-1.8 E+308</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Floating point number types (2020) courtesy of University of Auckland</figcaption>
</figure>
<p>In this course, we will normally use the&nbsp;<samp>double</samp>&nbsp;type.</p>
<p>Note that the value of floating-point numbers is often stored as an approximate value in memory due to the limited amount of space. For example, the number 1/3 cannot be represented exactly in decimal. In a computer, some calculations in decimal will cause a rounding error. You will have to be careful when you are working with floating-point numbers. To learn more about floating-point arithmetic, see&nbsp;<a href="https://floating-point-gui.de/" target="_blank" rel="noreferrer noopener">What Every Programmer Should Know About Floating-Point Arithmetic&nbsp;(Links to an external site.)</a>&nbsp;(Floating-point-gui.de, n.d.).</p>
</li>
<li><strong>Characters</strong>: are symbols such as digits, letters and punctuation. The Java primitive type to represent a character is&nbsp;<code>char</code>. For example, we can declare and initialise a variable to store a character ''e''.
<pre><code>char letter = ''e'';</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>The characters that you can use in Java are defined by the Unicode character set, which includes basically every character symbol from all major languages. The Unicode standard assigns a number to every character, and the special escape sequence (<samp>\u</samp>) allows us to access any character from the Unicode set based on its number. For example, \u0065 represents ''e''. You can change the previous example to the following:</p>
<pre><code>char letter = ''\u0065'';</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>Note that the first 128 characters in the Unicode character set have the same code as the ASCII character set. The uppercase character ''A'' is represented by the number 65 in decimal (41 in hexadecimal). This means that you can assign an integer value to a&nbsp;<samp>char</samp>&nbsp;variable. The integer value represents the corresponding ASCII value of a particular character. For example, 101 is the ASCII value for ''e''. You can change the previous example to the following:</p>
<pre><code>char letter = 101;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</li>
<li><strong>Boolean</strong>: is used to store true or false. The Java primitive type to represent a Boolean value is boolean. For example, we can declare and initialise a boolean variable as follows:<br />
<pre><code>boolean gameIsOver = false;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>IMPORTANT: Don&rsquo;t forget Java is case-sensitive.&nbsp;<samp>Boolean</samp>&nbsp;is an object type and&nbsp;<samp>boolean</samp>&nbsp;is a primitive data type in Java. We will talk about object types later in the course.</p>
</li>
</ol>',3,'',12,'drcuoa',2,'1','Canvas Link ( 1.6 Variables, primitive data types, and symbolic constants)','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-6-variables-primitive-data-types-and-symbolic-constants?module_item_id=1406302'),
 (7,'Symbolic Constants','<h4 id="ui-id-5" tabindex="0" role="tab" aria-expanded="true" aria-selected="true" aria-controls="ui-id-6">Symbolic Constants</h4>
<div id="ui-id-6" style="list-style-type: none;" role="tabpanel" aria-hidden="false" aria-labelledby="ui-id-5">
<p>When we are writing programs, we frequently need to use values that will remain fixed while our program is running. In Java, a value that remains fixed while the code is running is best represented as a symbolic constant. Any type which can be used for a variable may also be used for a symbolic constant. The format for declaring a symbolic constant is as follows:</p>
<pre>final data_type constant_identifier = value;</pre>
<p>Here are two examples of symbolic constants:</p>
<pre>final double PI = 3.14159;<br />final int DAYS_IN_YEAR = 365;</pre>
<p>The&nbsp;<samp>final</samp>&nbsp;keyword is used to tell the computer that the value stored in that variable is fixed. The value stored in the symbolic constant cannot change once it is initialised.</p>
<p>Note the style guidelines for constant identifiers:</p>
<ul>
<li>All constant identifiers should be in uppercase letters.</li>
<li>Constant identifiers which consist of more than one word should use an underscore character to separate each subsequent word.</li>
</ul>
</div>',3,'',12,'drcuoa',2,'1','Canvas Link ( 1.6 Variables, primitive data types, and symbolic constants)','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-6-variables-primitive-data-types-and-symbolic-constants?module_item_id=1406302'),
 (8,'Expressions','<p>An expression in Java&nbsp;instructs the computer to perform a calculation that creates a new variable.&nbsp;</p>
<pre><code>variable_identifier = expression;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>An expression can be a:</p>
<ul>
<li>Value e.g.&nbsp;<samp>int width = 3;</samp></li>
<li>Variable e.g.&nbsp;<samp>int size = width;</samp></li>
<li>Formulae e.g.&nbsp;<samp>double price = cost + cost * GST;</samp></li>
<li>Method e.g.&nbsp;<samp>double maximum = Math.<em>max(1.56, 2.3);</em></samp></li>
</ul>
<h2>Arithmetic operators</h2>
<p>We can perform arithmetic on numeric values (of integer and floating-point types). Here is a summary of the arithmetic operations that you will see in this course:</p>
<figure>
<table style="width: 982.07px; height: 294px;" width="100%" cellpadding="20"><caption>Arithmetic operators</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 65px; width: 179.98px;" scope="col">Name</th>
<th style="height: 65px; width: 108.555px;" scope="col">Operation</th>
<th style="height: 65px; width: 138.984px;" scope="col">Example</th>
<th style="width: 484.395px; height: 65px;">Explanation</th>
</tr>
</thead>
<tbody>
<tr style="height: 35px;">
<td style="width: 179.98px; height: 35px;" width="150">
<p>Addition</p>
</td>
<td style="width: 108.555px; height: 35px;" width="95">
<p>+</p>
</td>
<td style="width: 138.984px; height: 35px;" width="113">
<p>a + b</p>
</td>
<td style="width: 484.395px; height: 35px;" width="242">
<p>Adds a and b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 179.98px; height: 53px;" width="150">
<p>Subtraction</p>
</td>
<td style="width: 108.555px; height: 53px;" width="95">
<p>-</p>
</td>
<td style="width: 138.984px; height: 53px;" width="113">
<p>a &ndash; b</p>
</td>
<td style="width: 484.395px; height: 53px;" width="242">
<p>Subtracts b from a</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 179.98px; height: 53px;" width="150">
<p>Multiplication</p>
</td>
<td style="width: 108.555px; height: 53px;" width="95">
<p>*</p>
</td>
<td style="width: 138.984px; height: 53px;" width="113">
<p>a * b</p>
</td>
<td style="width: 484.395px; height: 53px;" width="242">
<p>Multiplies a and b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 179.98px; height: 53px;" width="150">
<p>Division</p>
</td>
<td style="width: 108.555px; height: 53px;" width="95">
<p>/</p>
</td>
<td style="width: 138.984px; height: 53px;" width="113">
<p>a / b</p>
</td>
<td style="width: 484.395px; height: 53px;" width="242">
<p>Divides a by b</p>
</td>
</tr>
<tr style="height: 77px;">
<td style="width: 179.98px; height: 35px;" width="150">
<p>Modulus</p>
</td>
<td style="width: 108.555px; height: 35px;" width="95">
<p>%</p>
</td>
<td style="width: 138.984px; height: 35px;" width="113">
<p>a % b</p>
</td>
<td style="width: 484.395px; height: 35px;" width="242">
<p>Remainder when a is divided by b</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Java arithmetic operators (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3>Increment and decrement, and arithmetic assignment</h3>
<p>The increment (++) and decrement (--) operators are used to add or subtract one from the contents of a variable. The arithmetic assignment operators (+=, -=, *=, /=) are used to modify the value stored in a variable.</p>
<p>Here is the summary of these operators:</p>
<figure>
<table style="width: 982.07px; height: 266px;" width="100%" cellpadding="20"><caption>Arithmetic operators</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 67px; width: 277.812px;" scope="col">Name</th>
<th style="height: 67px; width: 198.184px;" scope="col">Operation</th>
<th style="width: 139.551px; height: 67px;">Example</th>
<th style="height: 67px; width: 296.367px;" scope="col">Explanation</th>
</tr>
</thead>
<tbody>
<tr style="height: 12px;">
<td style="width: 277.812px; height: 12px;" width="150">
<p>Increment</p>
</td>
<td style="width: 198.184px; height: 12px;" width="95">
<p>++</p>
</td>
<td style="width: 139.551px; height: 12px;" width="113">
<p>a++</p>
</td>
<td style="width: 296.367px; height: 12px;" width="242">
<p>Increases the value of variable a by 1</p>
</td>
</tr>
<tr style="height: 15px;">
<td style="width: 277.812px; height: 15px;" width="150">
<p>Decrement</p>
</td>
<td style="width: 198.184px; height: 15px;" width="95">
<p>--</p>
</td>
<td style="width: 139.551px; height: 15px;" width="113">
<p>a&ndash;-</p>
</td>
<td style="width: 296.367px; height: 15px;" width="242">
<p>Decreases the value of variable a by 1</p>
</td>
</tr>
<tr style="height: 13px;">
<td style="width: 277.812px; height: 13px;" width="150">
<p>Arithmetic assignment for addition</p>
</td>
<td style="width: 198.184px; height: 13px;" width="95">
<p>+=</p>
</td>
<td style="width: 139.551px; height: 13px;" width="113">
<p>a += b</p>
</td>
<td style="width: 296.367px; height: 13px;" width="242">
<p>Is the same as a = a + b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 277.812px; height: 53px;" width="150">
<p>Arithmetic assignment for subtraction</p>
</td>
<td style="width: 198.184px; height: 53px;" width="95">
<p>-=</p>
</td>
<td style="width: 139.551px; height: 53px;" width="113">
<p>a -= b</p>
</td>
<td style="width: 296.367px; height: 53px;" width="242">
<p>Is the same as a = a - b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 277.812px; height: 53px;" width="150">
<p>Arithmetic assignment for multiplication</p>
</td>
<td style="width: 198.184px; height: 53px;" width="95">
<p>*=</p>
</td>
<td style="width: 139.551px; height: 53px;" width="113">
<p>a *= b</p>
</td>
<td style="width: 296.367px; height: 53px;" width="242">
<p>Is the same as a = a * b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="width: 277.812px; height: 53px;" width="150">
<p>Arithmetic assignment for division</p>
</td>
<td style="width: 198.184px; height: 53px;" width="95">
<p>/=</p>
</td>
<td style="width: 139.551px; height: 53px;" width="113">
<p>a /= b</p>
</td>
<td style="width: 296.367px; height: 53px;" width="242">
<p>Is the same as a = a / b</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Java arithmetic operators (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3>Order of precedence</h3>
<p>The precedence for the arithmetic operators is the same as in ordinary arithmetic. The order of evaluation can be changed by using parentheses&nbsp;<strong>()</strong>. If there are no parentheses and the operators are of equal precedence, then the evaluation is from left to right. The following shows the order of precedence for arithmetic operators:</p>
<figure>
<table style="width: 982.07px; height: 211px;" width="100%" cellpadding="20"><caption>Order of operations</caption>
<thead>
<tr style="height: 65px;">
<th style="height: 65px; width: 262.012px;" scope="col">Order</th>
<th style="height: 65px; width: 268.594px;" scope="col">Operator</th>
<th style="height: 65px; width: 398.535px;" scope="col">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="width: 262.012px;" width="94">
<p>High</p>
</td>
<td style="width: 268.594px;" width="170">
<p>( )</p>
</td>
<td style="width: 398.535px;" width="337">
<p>Grouping operator</p>
</td>
</tr>
<tr>
<td style="width: 262.012px;" width="94">
<p>&nbsp;</p>
</td>
<td style="width: 268.594px;" width="170">
<p>-- , ++</p>
</td>
<td style="width: 398.535px;" width="337">
<p>Increment and decrement</p>
</td>
</tr>
<tr>
<td style="width: 262.012px;" width="94">
<p>&nbsp;</p>
</td>
<td style="width: 268.594px;" width="170">
<p>*, /, %</p>
</td>
<td style="width: 398.535px;" width="337">
<p>Multiplicative operators</p>
</td>
</tr>
<tr>
<td style="width: 262.012px;" width="94">
<p>&nbsp;</p>
</td>
<td style="width: 268.594px;" width="170">
<p>+, -</p>
</td>
<td style="width: 398.535px;" width="337">
<p>Additive operators</p>
</td>
</tr>
<tr>
<td style="width: 262.012px;" width="94">
<p>Low</p>
</td>
<td style="width: 268.594px;" width="170">
<p>=, +=, -=, /=, *=</p>
</td>
<td style="width: 398.535px;" width="337">
<p>Assignment operators</p>
</td>
</tr>
</tbody>
</table>
<figcaption>Java order of operations (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3>Expressions with mixed types</h3>
<p>There is an important rule concerning the types of the operands when doing normal arithmetic such as a + b. If a and b are of the same type, then the result is the same type as the variables (operands). For example, if a and b are integers, then the result of any arithmetic is an integer. Let&rsquo;s take a look at the following example:</p>
<pre><code>int a = 10;
int b = 4;
int c = a / b;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>The variable c stores the value of 2 because the result of dividing two integers must also be an integer. The fractional part of the result is lost.</p>
<p>Similarly, if a and b are floating-point numbers, then the result of any arithmetic is a floating-point number. However, if either a or b is a floating-point number, the result of any arithmetic is a floating-point number. Let&rsquo;s take a look at the following example:</p>
<pre><code>int a = 3;
double b = 2.1;
double c = a + b;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>The variable c stores the value of 5.1 as a result of adding an integer and a double.</p>
<h3>Converting between types</h3>
<p>In Java, some values of a smaller numeric type can be implicitly converted to a larger type. For example, ints may be assigned to doubles as the following. The variable&nbsp;<samp>num2</samp>&nbsp;stores the value of 36.0 which implicitly converted from the value stored in&nbsp;<samp>num1</samp>.</p>
<pre><code>int num1 = 36;
double num2;
num2 = num1;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>However, a larger numeric type cannot be converted to a smaller type. For example, doubles cannot be assigned to bytes.</p>
<p>The order of the &ldquo;size&rdquo; of the numeric data type is as follows (from smallest to largest):</p>
<ul>
<li>byte</li>
<li>short</li>
<li>int</li>
<li>long</li>
<li>float</li>
<li>double.</li>
</ul>
<p>Remember that the values of a smaller numeric type can be safely assigned to variables of a larger type, but not vice-versa. This type of conversion is sometimes called widening conversion.</p>
<p>If we want to force a conversion from one type to another compatible type, we can do&nbsp;<strong>type casting</strong>. The general form of the type cast operation is:</p>
<pre><code>(data_type)expression</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>You type cast an expression by putting the type you want the value to be converted to in parentheses immediately before the expression that you want to convert. Let&rsquo;s consider the following example:</p>
<pre><code>double num1 = 1.25;
int num2 = (int)num1;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>When Java stores the value for&nbsp;<samp>num2</samp>, the type cast forces the numbers after the decimal place to be truncated (lost), keeping only the whole part of the value of&nbsp;<samp>num1</samp>. Therefore, the variable&nbsp;<samp>num2</samp>&nbsp;stores the integer value of 1.</p>
<div>
<p>What is the value of result?</p>
<pre><code>double result = (double)10/100;</code></pre>
</div>
<div tabindex="-1">the result has the value of 0.1 as with type casting (double)10 becomes 10.0 first. Then, we do 10.0 / 100. Don&rsquo;t forget the rule of types and operands. The result of double / integer would still be a double. Therefore, the result is 0.1.</div>
<div tabindex="-1">
<div>
<p>What is the value of result2?</p>
<pre><code>double result = (double)(10/100);</code></pre>
</div>
<div tabindex="-1">result2 has the value of 0.0. Don&rsquo;t forget the order of precedence. We need to do the calculation inside the brackets first, which is 10 / 100. Based on the rule of types and operands, the result of integer / integer would still be an integer. This means that 10 / 100 would give us 0. The fractional part is lost in this case. Then, we perform the remaining of the expression, (double)0, which converts 0 to 0.0 with the type cast. Therefore, the result is 0.0.</div>
</div>',3,'',12,'drcuoa',2,'1','Canvas Link : Expressions','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-7-expressions?module_item_id=1406303'),
 (9,'Fun Fact - is Math.PI a method call','<div>
<p style="text-align: center;"><span style="font-size: 14pt;">Is Math.PI a method call?</span></p>
</div>
<div style="text-align: center;" tabindex="-1">No. A method call ends with parentheses. This is a call to the constant value stored in the Math class. We know that Math.PI is a constant because of the naming conventions in Java for constants.&nbsp; Constant are are UPPERCASE or uppercase connected with underscores, e,g, UPPER_CASE</div>',2,'',12,'drcuoa',2,'2','None','NA'),
 (10,'Introduction to methods - STATIC TYPE','<p>A method is a self-contained section of code for accomplishing a task. We can think of a method as a mini-program. In Java, statements that end with parentheses, (), are&nbsp;<strong>method calls</strong>. Consider the following example:</p>
<div>
<pre>System.out.println("Hello");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>In the example,&nbsp;<samp>System</samp>&nbsp;is a predefined class that provides access to the system,&nbsp;<samp>out</samp>&nbsp;is the output stream connected to the console, and&nbsp;<samp>println()</samp>&nbsp;is the method that we are calling.</p>
<p>There are two types of methods in Java:</p>
<ul>
<li>Static methods</li>
<li>Instance methods.</li>
</ul>
<p>In this module, we present an overview of static and instance methods. You will learn about methods in detail in the next module.</p>
<h2>Static methods</h2>
<p>Static methods are methods that are called using the name of a class. The general form of calling a static method is as follows:</p>
<pre><code>class_identifier.method_identifier()</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>Or</p>
<pre><code>class_identifier.method_identifier(actual_parameter_list)</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>The Math class and the String class are two standard Java classes which define a number of static methods you can call. For example:</p>
<pre><code>Math.random();
String.valueOf(10000);</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>Note that the code conventions require us to use a capital letter when we name classes. Based on the code conventions, we know that each statement to the left of the dot is a class name. Therefore, both of the method calls shown in the example are static methods.</p>
<h2>The Math class</h2>
<p>The&nbsp;<strong>Math</strong>&nbsp;class contains a number of useful methods which deal with common mathematical functions. All of the methods in the&nbsp;<strong>Math</strong>&nbsp;class are static methods. Here are some of the useful methods from the&nbsp;<strong>Math</strong>&nbsp;class:</p>
<ul>
<li><samp>min(int, int)</samp>&nbsp;Returns the smaller of two int values.</li>
<li><samp>max(double, double)</samp>&nbsp;Returns the greater of two double values.</li>
<li><samp>random()</samp>&nbsp;Returns a random number in double between 0.0 and 1.0 (including 0.0, but excluding 1.0).</li>
<li><samp>sqrt(double)</samp>&nbsp;Returns the square root of a double value.</li>
<li><samp>pow(double, double)</samp>&nbsp;Returns the value of the first argument raised to the power of the second argument.</li>
</ul>
<p>Here are example Java statements using the&nbsp;<strong>Math</strong>&nbsp;class:</p>
<div>
<pre>int min = Math.min(10001, 100);
double random = Math.random();
System.out.println("The numerical value of pi is " + Math.PI);
System.out.println("The random number between 0 and 1 is " + random);
System.out.println(Math.sqrt(min) + " is the same as " + Math.sqrt(Math.pow(10, 2)));</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>Note that one of the statements contains&nbsp;<samp>Math.PI</samp>. This call will return the double value nearest the mathematical constant &pi;.</p>',3,'',12,'drcuoa',2,'1','Canvas Link: 1.8 Intro to Methods','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-8-introduction-to-methods?module_item_id=1406304'),
 (11,'MyFirst Java Program : Full Code','<pre><code>
/* This is my first Java Program
* on my windows machine
* I feel old
*/

public class MyFirstProgram {
    public void start() {
        System.out.println("Hi World, how''s it going with yous today?");
    }

    // all Java programs begin with the method main().
    public static void main(String[] args) {
        MyFirstProgram p = new MyFirstProgram();
        p.start();
    }
}
</code></pre>',3,'',12,'drcuoa',2,'1','',''),
 (12,'Introduction to methods - INSTANCE and Defining our Own Methods','<p>An instance method is one that belongs to the object to do things.&nbsp; For now, just remember:&nbsp; <strong>We need to construct an object before calling an instance method.</strong></p>
<pre><code>MyFirstProgram p = new MyFirstProgram();
p.start();</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>We construct a&nbsp;<samp>MyFirstProgram</samp>&nbsp;object and store the object in the variable&nbsp;p. We then call the&nbsp;<samp>start()</samp>&nbsp;method which belongs to the object stored in&nbsp;p.</p>
<p>The general form of calling an instance method is as follows:</p>
<pre><code>object_identifier.method_identifier()</code></pre>
<p>Or</p>
<pre><code>object_identifier.method_identifier(actual_parameter_list)</code></pre>
<h2>Defining your own methods</h2>
<p>In Java, we can use methods from the predefined classes. We can also define our own methods in the class we created. The act of defining what a method does is known as declaring a method. The formal structure of our methods is as follows:</p>
<pre><code>
visibility_modifier return_type method_identifier(formal_parameter_list) {
   statement_list
   return expression;
}</code></pre>
<pre><code>
public void sayHello() { 
    System.out.println("Hello, World!");
    return [would be here if our example method had one]
}</code></pre>
<p>When we declare a method, we begin with the visibility modifier. We will cover the details of a method in the later module. For now, you will notice the use of either the keyword&nbsp;<samp>private</samp>&nbsp;or&nbsp;<samp>public</samp>&nbsp;for the visibility modifier.</p>
<p>Next, we state the&nbsp;<strong>return type</strong>&nbsp;of our method. This allows our method to pass information back to the method call. A method can only return a single value. When a return statement is reached inside a method, the execution of the method stops immediately. The code execution returns to the point of the method call and the rest of the code inside the method is ignored.</p>
<p>If our method does not return anything, we will use the keyword&nbsp;<samp>void</samp>. The return statement inside our method can be omitted.</p>
<p>We then follow the naming conventions to name our method. That is, method names should be verbs, and in camel case, with a lowercase first letter.</p>
<p>If we need to provide information for our method to process, we can pass the information as a list of&nbsp;<strong>parameters</strong>. Sometimes parameters are also known as&nbsp;<strong>arguments</strong>.</p>
<p>Let&rsquo;s take a look at four example methods that we can declare:</p>
<ol>
<li>Method that has no parameters and returns nothing.<br />
<div>
<pre>public void sayHello() {
    System.out.println("Hello, World!");
}</pre>
</div>
<p>This method simply prints Hello, World! to the screen.</p>
</li>
<li>Method that has one or more parameters and returns nothing.<br />
<div>
<pre>public void sayHello(String name) {
    System.out.println("Hello, " + name + "!");
}</pre>
</div>
<p>This method takes one parameter called&nbsp;<strong>name,</strong>&nbsp;and the type of the parameter is String. If name stores the value "Andrew", then Hello, Andrew! will be printed on the screen.</p>
</li>
<li>Method that has no parameters and returns something.<br />
<div>
<pre>public String getHello() {
    return "Hello, World!";
}</pre>
</div>
<p>This method simply returns a String "Hello, World!" back to where the method has been called.</p>
</li>
<li>Method that has one or more parameters and returns something.<br />
<div>
<pre>public String getHello(String name) {
    return "Hello, " + name + "!";
}</pre>
</div>
<p>This method takes one parameter called name, and the type of the parameter is String. If name stores the value "Andrew", then the method returns a String "Hello, Andrew!" to where the method has been called.</p>
</li>
</ol>',3,'',12,'drcuoa',2,'1','Canvas Link: 1.8 Intro to Methods','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-8-introduction-to-methods?module_item_id=1406304'),
 (13,'Fun Fact - PUBCLIC STATIC VOID Explained','<p>It''s three completely different things:</p>
<p><code>public</code>&nbsp;means that the method is visible and can be called from other objects of other types. Other alternatives are&nbsp;<code>private</code>,&nbsp;<code>protected</code>,&nbsp;<code>package</code>&nbsp;and&nbsp;<code>package-private</code>. See&nbsp;<a href="http://java.sun.com/docs/books/tutorial/java/javaOO/accesscontrol.html" rel="noreferrer">here</a>&nbsp;for more details.</p>
<p><code>static</code>&nbsp;means that the method is associated with the class, not a specific instance (object) of that class. This means that you can call a static method without creating an object of the class.</p>
<p><code>void</code>&nbsp;means that the method has no return value. If the method returned an&nbsp;<code>int</code>&nbsp;you would write&nbsp;<code>int</code>&nbsp;instead of&nbsp;<code>void</code>.</p>
<p>The combination of all three of these is most commonly seen on the&nbsp;<code>main</code>&nbsp;method which most tutorials will include.</p>',3,'',12,'drcuoa',2,'1','stackoverflow article','https://stackoverflow.com/questions/2390063/what-does-public-static-void-mean-in-java'),
 (14,'A Simple Touchscreen Sketchpad using Javascript and HTML5','<p>This is an old link but looks like it''s a simple approach that might still be ok.&nbsp; Couldn''t find much on this topic doing a quick google.&nbsp; Need come back it&nbsp;</p>',1,'',5,'drcuoa',2,'1','Old','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-9-flow-of-a-simple-java-program?module_item_id=1406305'),
 (15,'The simple flow of a Jave Program','<p>Module 1 Video 2 Flow of MyFirstProgram (2021) courtesy of University of Auckland</p>
<p>the main method is called first and stuff returns to the place it was called from.&nbsp; { is the start of a block of code and } is its end.</p>',3,'',12,'drcuoa',2,'1','Canvas Link 1.9 Flow of a simple Java program','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-9-flow-of-a-simple-java-program?module_item_id=1406305'),
 (16,'Java API and import','<h1>1.10 Java API and import</h1>
<p>The Java API (Application Programming Interface) contains documentation for all the predefined Java classes. The API explains what each class is used for, how it is used, how to create an instance of the class, and the methods available for each class. You can find the Java 11 API at&nbsp;<a href="https://docs.oracle.com/en/java/javase/11/docs/api/index.html" target="_blank" rel="noreferrer noopener">Java Platform, Standard Edition &amp; Java Development Kit&nbsp;(Links to an external site.)</a>&nbsp;(Oracle, 2020).&nbsp;</p>
<p>You will see that classes in the Java API are organised in packages. Here are some of the example packages you will see throughout this course:</p>
<ul>
<li><samp>java.awt</samp>&nbsp;The Abstract Window Toolkit (AWT) package holds the classes used to create windows and draw graphics.</li>
<li><samp>javax.swing</samp>&nbsp;The Swing package is used primarily to create user interfaces.</li>
<li><samp>java.util</samp>&nbsp;The Utility package contains classes which are useful for general programming.</li>
<li><samp>java.io</samp>&nbsp;The Input/Output package contains the classes used to read input and write output.</li>
</ul>
<p>The fully qualified name of a Java class includes the package in which the class is located. For example, the fully qualified class name of Math is&nbsp;<samp>java.lang.Math</samp>. We can use the short name for Math because classes in the&nbsp;<samp>java.lang</samp>&nbsp;package are available automatically. For other classes, full names must be used.</p>
<p>Instead of using the fully qualified class name, we can use the keyword&nbsp;<strong>import</strong>&nbsp;as follows:</p>
<pre><code>import fully_qualified_class_name;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>The keyword import lets the compiler know what class and package we are going to use. Once we have imported the class, we are allowed to use the simple class name without having to specify it fully.</p>
<p>If we want to use different classes from the same package, we can import all classes from the package. The formal syntax for this is as follows:</p>
<pre><code>import package_name.*;</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>You will see more on the use of&nbsp;<strong>import</strong>&nbsp;later in this course.</p>',3,'',12,'drcuoa',2,'1','Canvas Link 1..10 Java API and import','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-10-java-api-and-import?module_item_id=1406306'),
 (17,'Errors in Java','<h1>1.11 Errors in Java</h1>
<p>When you begin programming, you will certainly make mistakes. Don&rsquo;t worry about getting things right the first time. Correcting mistakes helps us learn any language. The important thing is to be able to identify the errors and fix the problem. There are two major categories of errors that could occur in your program. These are syntax errors and semantic errors.</p>
<h3>Syntax errors</h3>
<p>Syntax errors occur when you try to compile your program. They are mistakes in the spelling, grammar or punctuation of the source code.</p>
<p>If the program contains a syntax error, then the computer cannot compile your code. Sometimes, this means that it cannot understand anything else after that error in your program. You might see multiple error messages caused by a single mistake. You should always fix the syntax errors as soon as you see them.</p>
<h3>Semantic errors</h3>
<p>Semantic errors are ones in which the syntax is correct, but the program is not doing what you want it to do. That is, the meaning of the program is wrong. There are two types of semantic errors: runtime errors and logic errors.</p>
<p>Runtime errors are problems that arise while the program is running. These errors are recognised by the computer and often cause your program to stop. A runtime error is always an indication that your program has problems and should never be ignored.</p>
<p>Logic errors arise when the program is not doing what we want it to do. The program will compile correctly and will run without causing any errors. However, the program will not actually do what you want it to. These errors are not easy to track down as the computer does not know that any problem has occurred and it cannot give you any help to fix the problem.</p>
<p>To find mistakes or bugs in our code, we often go through a debugging process. In this course, we will not discuss debugging in detail. However, once you are familiar with the Java syntax and the use of an Integrated Development Environment (IDE), have a look at how to debug your code using an IDE such as IntelliJ. For more information, see&nbsp;<a href="https://www.jetbrains.com/help/idea/debugging-code.html#general-procedure" target="_blank" rel="noreferrer noopener">Debug code&nbsp;(Links to an external site.)</a>&nbsp;(JetBrains s.r.o., 2020).</p>',3,'',12,'drcuoa',2,'1','Canvas Link: 1.11 Errors in Java','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-11-errors-in-java?module_item_id=1406307'),
 (18,'COMPSCI 718 Basic IntelliJ Demo','<p>COMPSCI 718 Basic IntelliJ Demo for Lab Exercise in Module 1</p>
<p>My Notes:&nbsp; Andrew - legend</p>
<p>create a new project - dialog box - options on left might be different</p>
<p>top one java select</p>
<p>project SDK is the version of java (use 11)</p>
<p>click next - don''t use a template just click next&nbsp;</p>
<p>choose name and location to save your new project, click the ellipsis to browse for the location.&nbsp; idea directory-based format should be used at the bottom.</p>
<p>click ok to create dir if required.</p>
<p>should now see similar to VSCode open folder view</p>
<p>.idea is a bunch of config options (similar to node modules)</p>
<p>src is the root of your code</p>
<p>best practice is always create a package</p>
<p>right-click created a package to add a new class (start with uppercase and then camelToe</p>
<p>IntelliJ has<code> psvm </code>for short-cut for PUBLIC STATIC VOID MAIN&nbsp;</p>
<p><code>sout </code>is the shortcut for <code>System.out.println()</code></p>
<p>Green small ARROW is run&nbsp;</p>
<p>view the output of the build and run command in the console</p>
<p>ctl-save all to exit</p>
<p>when opening the folder with the little black box to open the full java project saved in IntelliJ&nbsp;</p>',3,'',12,'drcuoa',2,'1','','https://vimeo.com/499068488/6f4c1cf6d2'),
 (19,'Activity: Lab 1 – Introduction to programming','<h2>Task</h2>
<p><strong>Step 1: Download&nbsp;</strong>the source code and find more information for this lab in the following questions and source code files:</p>
<a href="file:///C:/Users/OEM/Downloads/industry_lab_01-1.pdf">Local copy</a>
<p><a title="industry_lab_01-1.pdf" href="https://canvas.auckland.ac.nz/courses/72041/files/8173872?wrap=1" target="_blank" rel="noopener" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8173872" data-canvas-previewable="false">Lab 1 Questions (PDF 139 KB)</a><a role="button" href="https://canvas.auckland.ac.nz/courses/72041/files/8173872/download?download_frd=1" download="">&nbsp;<img style="height: 16px; width: 16px;" role="presentation" src="https://canvas.auckland.ac.nz/images/svg-icons/svg_icon_download.svg" alt="" />Download Lab 1 Questions (PDF 139 KB)</a></p>
<p><a title="industry_lab_01.zip" href="https://canvas.auckland.ac.nz/courses/72041/files/8161201/download?wrap=1" target="_blank" rel="noopener" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161201" data-canvas-previewable="false">Lab 1 Source Code (ZIP 944 KB)</a><a role="button" href="https://canvas.auckland.ac.nz/courses/72041/files/8161201/download?download_frd=1" download="">&nbsp;<img style="height: 16px; width: 16px;" role="presentation" src="https://canvas.auckland.ac.nz/images/svg-icons/svg_icon_download.svg" alt="" />Download Lab 1 Source Code (ZIP 944 KB)</a></p>
<p><strong>Step 2: Complete&nbsp;</strong>the following five exercises, as well as the optional exercises:</p>
<ul>
<li>Exercise one: Create my first Java program using IntelliJ</li>
<li>Exercise two: Add a new class to an existing project</li>
<li>Exercise three: Evaluation of expressions</li>
<li>Exercise four: Programming practice</li>
<li>Exercise five: Sorting numbers</li>
<li>Optional exercise six: Calculate elapsed time</li>
<li>Optional exercise: Compiling and running my first Java program.</li>
</ul>
<p>Please note:</p>
<ul>
<li>For exercise one and exercise two, you are required to create your own project.</li>
<li>There is no source code for exercise three.</li>
<li>You will find the code for the remaining exercises and the example code from the lecture under the following folder: industry_lab_01\industry-lab-01\</li>
</ul>
<p><strong>Step 3: Check&nbsp;</strong>your answers by downloading the solutions provided below.&nbsp;Ensure that you have attempted the lab questions before downloading and viewing the solutions. Hands on coding (and making mistakes) is an important part of the learning process for a programmer.&nbsp;</p>
<p><a title="industry_lab_01_ex01-03-answers.pdf" href="https://canvas.auckland.ac.nz/courses/72041/files/8173952?wrap=1" target="_blank" rel="noopener" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8173952" data-canvas-previewable="false">Lab 1 Model Answers for Exercise one to three (PDF 143KB)</a><a role="button" href="https://canvas.auckland.ac.nz/courses/72041/files/8173952/download?download_frd=1" download="">&nbsp;<img style="height: 16px; width: 16px;" role="presentation" src="https://canvas.auckland.ac.nz/images/svg-icons/svg_icon_download.svg" alt="" />Download Lab 1 Model Answers for Exercise one to three (PDF 143KB)</a></p>
<p><a title="industry-lab-01-answers.zip" href="https://canvas.auckland.ac.nz/courses/72041/files/8160727/download?wrap=1" target="_blank" rel="noopener" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8160727" data-canvas-previewable="false">Lab 1 Source Code Solutions (ZIP 941 KB)</a><a role="button" href="https://canvas.auckland.ac.nz/courses/72041/files/8160727/download?download_frd=1" download="">&nbsp;<img style="height: 16px; width: 16px;" role="presentation" src="https://canvas.auckland.ac.nz/images/svg-icons/svg_icon_download.svg" alt="" />Download Lab 1 Source Code Solutions (ZIP 941 KB)</a></p>
<p>Aim to complete this activity by the end of the week.</p>',3,'',12,'drcuoa',2,'1','Canvas Page 1..12 Lab Instructions','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-12-activity-lab-1-introduction-to-programming?module_item_id=1406308'),
 (20,'Lab 1 Exercise  1 Notes','<p><span dir="ltr" role="presentation">Exercise One: Create My First Java Program using </span><br role="presentation" /><span dir="ltr" role="presentation">IntelliJ </span><br role="presentation" /><span dir="ltr" role="presentation">You will be using IntelliJ IDEA throughout this course. Before practising on what you have </span><br role="presentation" /><span dir="ltr" role="presentation">learned, let&rsquo;s start by doing the following: </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Launch IntelliJ IDEA and create a new Java project. </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Select the appropriate JDK from the Project SDK list. </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Don&rsquo;t create a project from the template. </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Select the appropriate project location and name the project </span><span dir="ltr" role="presentation">lab01.</span> <br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Click Finish. </span><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">Once you have created the project, you can now create a new class. </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">In the </span><span dir="ltr" role="presentation">Project </span><span dir="ltr" role="presentation">tool window, right click on the </span><span dir="ltr" role="presentation">src </span><span dir="ltr" role="presentation">folder, select </span><span dir="ltr" role="presentation">New </span><span dir="ltr" role="presentation">and then select </span><br role="presentation" /><span dir="ltr" role="presentation">Java Class.</span> <br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Name the class </span><span dir="ltr" role="presentation">MyFirstProgram </span><span dir="ltr" role="presentation">and click </span><span dir="ltr" role="presentation">OK</span><span dir="ltr" role="presentation">. </span><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">You should now have the </span><span dir="ltr" role="presentation">MyFirstProgram</span><span dir="ltr" role="presentation"> class in the </span><span dir="ltr" role="presentation">Project</span><span dir="ltr" role="presentation"> tool window. Open </span><br role="presentation" /><span dir="ltr" role="presentation">the class and you should only have the following in the file: </span>&nbsp;</p>
<p><code><span dir="ltr" role="presentation">public class MyFirstProgram {</span> </code><br role="presentation" /><code><span dir="ltr" role="presentation">} </span></code><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">●</span> <span dir="ltr" role="presentation">Add the following code to the class: </span></p>
<p><code><span dir="ltr" role="presentation">public class MyFirstProgram {</span> </code><br role="presentation" /><code><span dir="ltr" role="presentation"> public void start() { </span></code><br role="presentation" /><code><span dir="ltr" role="presentation"> System.out.println("Hello World"); </span></code><br role="presentation" /><code><span dir="ltr" role="presentation"> } </span> </code></p>
<p><span dir="ltr" role="presentation">You can now compile and run the class by clicking on the green arrow icon next to the class </span><br role="presentation" /><span dir="ltr" role="presentation">name. </span><br role="presentation" /><span dir="ltr" role="presentation">Questions: </span><br role="presentation" /><span dir="ltr" role="presentation">1. </span><span dir="ltr" role="presentation">What does this class do?</span></p>
<p>creates the main method which in turn creates an instance of the object MyFirstProgram with the identifier p using the method start()</p>
<p><br role="presentation" /><span dir="ltr" role="presentation">2. </span><span dir="ltr" role="presentation">Where are the classes generated and stored by IntelliJ?</span></p>
<p>under src folder</p>
<p><br role="presentation" /><span dir="ltr" role="presentation">3. </span><span dir="ltr" role="presentation">Where do you see the messages after running the program in IntelliJ? </span></p>
<p><span dir="ltr" role="presentation">in the console and direct in the IDE pane as the code is typed out</span></p>
<p><span dir="ltr" role="presentation">4. </span><span dir="ltr" role="presentation">What are the different ways of running this class in IntelliJ?</span></p>
<p>green arrows or right clicks on the left nav bar</p>
<p><br role="presentation" /><span dir="ltr" role="presentation">5. </span><span dir="ltr" role="presentation">What are some of the useful shortcut keys you found in IntelliJ?</span></p>
<p><span dir="ltr" role="presentation">sout for&nbsp;</span></p>
<pre>System.out.println();<br /><br />psvm for</pre>
<pre><br />public static void main(String[] args) {<br />    <br />}</pre>',3,'',12,'drcuoa',2,'1','',''),
 (21,'Lab 1 Exercise 2 Notes','<div>
<div id="page-1" tabindex="-1">
<div>
<div>
<div><span dir="ltr" role="presentation">Exercise Two: Add a New Class to an existing </span><br role="presentation" /><span dir="ltr" role="presentation">project </span><br role="presentation" /><span dir="ltr" role="presentation">Using the </span><span dir="ltr" role="presentation">lab01</span><span dir="ltr" role="presentation"> project you just created, create a new class called </span><span dir="ltr" role="presentation">MySecondProgram</span><span dir="ltr" role="presentation"> in the </span><br role="presentation" /><span dir="ltr" role="presentation">same folder as </span><span dir="ltr" role="presentation">MyFirstProgram</span><span dir="ltr" role="presentation"> class. Copy the following code to </span><span dir="ltr" role="presentation">MySecondProgram</span><span dir="ltr" role="presentation"> class: </span><br role="presentation" /><span dir="ltr" role="presentation">package ictgradschool.industry.introtojava.mysecondprogram;</span> <br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">public class MySecondProgram { </span><br role="presentation" /><span dir="ltr" role="presentation"> public void start() { </span><br role="presentation" /><span dir="ltr" role="presentation"> System.out.println("Hello World"); </span><br role="presentation" /><span dir="ltr" role="presentation"> } </span><br role="presentation" /><span dir="ltr" role="presentation">}</span> <br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">Notice that you now have a compilation error associated with the package. Try to resolve the </span><br role="presentation" /><span dir="ltr" role="presentation">error by using IntelliJ. </span><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">Questions: </span><br role="presentation" /><span dir="ltr" role="presentation">1. </span><span dir="ltr" role="presentation">What happened to </span><span dir="ltr" role="presentation">MySecondProgram</span><span dir="ltr" role="presentation"> class after you have fixed the error? </span><br role="presentation" /><span dir="ltr" role="presentation">2. </span><span dir="ltr" role="presentation">What are packages used for? </span><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">Modify </span><span dir="ltr" role="presentation">MyFirstProgram</span><span dir="ltr" role="presentation"> class to the following: </span><br role="presentation" /><span dir="ltr" role="presentation">public class MyFirstProgram {</span> <br role="presentation" /><span dir="ltr" role="presentation"> public static void main(String[] args) { </span></div>
</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</div>
</div>
<div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>
<div>
<div>&nbsp;</div>
</div>
</div>
<div>&nbsp;</div>
</div>
</div>
<div>
<div id="page-2" tabindex="-1">
<div>&nbsp;</div>
<div>
<div>
<div><span dir="ltr" role="presentation">MySecondProgram p = new MySecondProgram();</span> <br role="presentation" /><span dir="ltr" role="presentation"> p.start(); </span><br role="presentation" /><span dir="ltr" role="presentation"> } </span><br role="presentation" /><span dir="ltr" role="presentation">}</span> <br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">You should have a compilation error associated with </span><span dir="ltr" role="presentation">MySecondProgram</span><span dir="ltr" role="presentation">. Try to resolve the </span><br role="presentation" /><span dir="ltr" role="presentation">error using IntelliJ. After you have fixed the error, you can run the program. </span><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">Questions: </span><br role="presentation" /><span dir="ltr" role="presentation">1. </span><span dir="ltr" role="presentation">What does the keyword </span><span dir="ltr" role="presentation">import</span> <span dir="ltr" role="presentation">do in Java? </span><br role="presentation" /><span dir="ltr" role="presentation">2. </span><span dir="ltr" role="presentation">How would you resolve the compilation error without using the import keyword? </span></div>
</div>
</div>
</div>
</div>
<p>&nbsp;</p>',3,'',12,'drcuoa',2,'1','',''),
 (23,'Fun Fact - Math Show the Remainder','<h4>TL;DR (Too Long; Didn''t Read)</h4>
<p>Work the division in your calculator as normal. Once you have the answer in decimal form, subtract the whole number, then multiply the decimal value that''s left by the divisor of your original problem. The result is your remainder.</p>
<p>For example, divide 346 by 7 to arrive at 49.428571. Round this to a whole number of 49. Multiply 49 by 7 to achieve 343 expressed as 49 &times; 7 = 343. Subtract this from the original number of 346 to arrive at a remainder of 3.</p>',1,'',12,'drcuoa',2,'1','How to Get a Remainder in Your Calculator','https://sciencing.com/remainder-calculator-8093469.html'),
 (24,'Lab 1 Exercise 3 Notes','<p><span dir="ltr" role="presentation">Exercise Three: Evaluation of Expressions </span><br role="presentation" /><span dir="ltr" role="presentation">What output do you think would be produced by each of the following code fragments? (You </span><br role="presentation" /><span dir="ltr" role="presentation">can work on this exercise on paper) </span><br role="presentation" /><br role="presentation" /><span dir="ltr" role="presentation">1. </span><span dir="ltr" role="presentation">System.out.println((int)2.9 * 4.5);</span></p>
<p>3 * 4.5 = 13.5<br role="presentation" /><span dir="ltr" role="presentation">2. </span><span dir="ltr" role="presentation">System.out.println(Math.max(5,60) % Math.min(12,7));</span></p>
<p>a % b = modules remainder when a is divided by b: see fun fact - math series episode 1 :-) answer should be 3 but:</p>
<p><strong><em>There is an important rule concerning the types of the operands when doing normal arithmetic such as a + b. If a and b are of the same type, then the result is the same type as the variables (operands).&nbsp;</em></strong></p>
<p><strong><em>So the first part of the operation to find the remainder would evaluate to zero as it must be an integer?!</em></strong></p>
<p><span dir="ltr" role="presentation">3. </span><span dir="ltr" role="presentation">System.out.println(0.2 * 3 / 2 + 3 / 2 * 3.2);&nbsp;</span></p>
<p><strong><span dir="ltr" role="presentation">0.01875</span></strong></p>',3,'',12,'drcuoa',2,'1','',''),
 (25,'Notes from Overview Zoom Session','<p>Tues And Thurs 6-8pm tutors available Mon and Wed 6-8?</p>
<p>Questions on course questions - use Pizaro is the place to ask course related questions</p>
<p>Dr Yu-Cheng Tu - Course Director</p>
<p>Jenny Wang / Nicholas Berg - Tutors</p>',3,'',1,'drcuoa',2,'1','',''),
 (26,'SQLIte3 Data Types','<h1 id="data-types">Data types</h1>
<div>
<ul dir="ltr" style="list-style-type: none;" data-bi-name="page info">
<li style="list-style-type: none;">Article</li>
<li style="list-style-type: none;"><time datetime="2021-10-27T13:21:00.000Z" data-article-date-source="git" aria-label="Article review date" data-article-date="">10/28/2021</time></li>
<li style="list-style-type: none;">2 minutes to read</li>
<li style="list-style-type: none;"><button title="View all contributors" data-bi-name="contributors" aria-label="View all contributors">2 contributors</button></li>
</ul>
<div data-hide-on-archived="">&nbsp;</div>
</div>
<p>SQLite only has four primitive data types: INTEGER, REAL, TEXT, and BLOB. APIs that return database values as an&nbsp;<code>object</code>&nbsp;will only ever return one of these four types. Additional .NET types are supported by Microsoft.Data.Sqlite, but values are ultimately coerced between these types and one of the four primitive types.</p>
<div>
<table style="width: 860px;"><caption>DATA TYPES</caption>
<thead>
<tr>
<th>.NET</th>
<th>SQLite</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr>
<td>Boolean</td>
<td>INTEGER</td>
<td><code>0</code>&nbsp;or&nbsp;<code>1</code></td>
</tr>
<tr>
<td>Byte</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Byte[]</td>
<td>BLOB</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Char</td>
<td>TEXT</td>
<td>UTF-8</td>
</tr>
<tr>
<td>DateOnly</td>
<td>TEXT</td>
<td>yyyy-MM-dd</td>
</tr>
<tr>
<td>DateTime</td>
<td>TEXT</td>
<td>yyyy-MM-dd HH:mm:ss.FFFFFFF</td>
</tr>
<tr>
<td>DateTimeOffset</td>
<td>TEXT</td>
<td>yyyy-MM-dd HH:mm:ss.FFFFFFFzzz</td>
</tr>
<tr>
<td>Decimal</td>
<td>TEXT</td>
<td><code>0.0###########################</code>&nbsp;format. REAL would be lossy.</td>
</tr>
<tr>
<td>Double</td>
<td>REAL</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Guid</td>
<td>TEXT</td>
<td>00000000-0000-0000-0000-000000000000</td>
</tr>
<tr>
<td>Int16</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Int32</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Int64</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>SByte</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>Single</td>
<td>REAL</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>String</td>
<td>TEXT</td>
<td>UTF-8</td>
</tr>
<tr>
<td>TimeOnly</td>
<td>TEXT</td>
<td>HH:mm:ss.fffffff</td>
</tr>
<tr>
<td>TimeSpan</td>
<td>TEXT</td>
<td>d.hh:mm:ss.fffffff</td>
</tr>
<tr>
<td>UInt16</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>UInt32</td>
<td>INTEGER</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>UInt64</td>
<td>INTEGER</td>
<td>Large values overflow</td>
</tr>
</tbody>
</table>
</div>
<h2 id="alternative-types">Alternative types</h2>
<p>Some .NET types can be read from alternative SQLite types. Parameters can also be configured to use these alternative types. For more information, see&nbsp;<a href="https://docs.microsoft.com/en-us/dotnet/standard/data/sqlite/parameters#alternative-types" data-linktype="relative-path">Parameters</a>.</p>
<div>
<table style="width: 860px;"><caption>ALTERNATIVE TYPES</caption>
<thead>
<tr>
<th>.NET</th>
<th>SQLite</th>
<th>Remarks</th>
</tr>
</thead>
<tbody>
<tr>
<td>Char</td>
<td>INTEGER</td>
<td>UTF-16</td>
</tr>
<tr>
<td>DateOnly</td>
<td>REAL</td>
<td>Julian day value</td>
</tr>
<tr>
<td>DateTime</td>
<td>REAL</td>
<td>Julian day value</td>
</tr>
<tr>
<td>DateTimeOffset</td>
<td>REAL</td>
<td>Julian day value</td>
</tr>
<tr>
<td>Guid</td>
<td>BLOB</td>
<td aria-label="No value">&nbsp;</td>
</tr>
<tr>
<td>TimeOnly</td>
<td>REAL</td>
<td>In days</td>
</tr>
<tr>
<td>TimeSpan</td>
<td>REAL</td>
<td>In days</td>
</tr>
</tbody>
</table>
</div>
<p>For example, the following query reads a TimeSpan value from a REAL column in the result set.</p>
<div id="code-try-0" data-bi-name="code-header">C#<button type="button" aria-label="Copy code" data-bi-name="copy"></button><button type="button" aria-label="Copy code" data-bi-name="copy">Copy</button>
<div aria-hidden="true">&nbsp;</div>
</div>
<pre tabindex="0"><code data-author-content="command.CommandText =@&quot;    SELECT name, julianday(finished) - julianday(started) AS length    FROM task    WHERE finished IS NOT NULL&quot;;using (var reader = command.ExecuteReader()){    while (reader.Read())    {        var name = reader.GetString(0);        var length = reader.GetTimeSpan(1);        Console.WriteLine($&quot;''{name}'' took {length}.&quot;);    }}">command.CommandText =
@"
    SELECT name, julianday(finished) - julianday(started) AS length
    FROM task
    WHERE finished IS NOT NULL
";
using (var reader = command.ExecuteReader())
{
    while (reader.Read())
    {
        var name = reader.GetString(0);
        var length = reader.GetTimeSpan(1);

        Console.WriteLine($"''{name}'' took {length}.");
    }
}
</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<h2 id="column-types">Column types</h2>
<p>SQLite uses a dynamic type system where the type of a value is associated with the value itself and not the column where it''s stored. You''re free to use whatever column type name you want. Microsoft.Data.Sqlite won''t apply any additional semantics to these names.</p>
<p>The column type name does have an impact on the&nbsp;<a href="https://www.sqlite.org/datatype3.html#type_affinity" data-linktype="external">type affinity</a>. One common gotcha is that using a column type of STRING will try to convert values to INTEGER or REAL, which can lead to unexpected results. We recommend only using the four primitive SQLite type names: INTEGER, REAL, TEXT, and BLOB.</p>
<p>SQLite allows you to specify type facets like length, precision, and scale, but they are not enforced by the database engine. Your app is responsible for enforcing these.</p>
<h2 id="see-also">See also</h2>
<ul style="list-style-type: none;">
<li style="list-style-type: disc;"><a href="https://www.sqlite.org/datatype3.html" data-linktype="external">Datatypes In SQLite</a></li>
</ul>',3,'',10,'drcuoa',2,'1','Microsoft Article','https://docs.microsoft.com/en-us/dotnet/standard/data/sqlite/types#:~:text=SQLite%20only%20has%20four%20primitive,types%20are%20supported%20by%20Microsoft.'),
 (27,'Lab 1 Exercise 3 - Order of Precedence Left to Right)','<p><code>public class MyThirdProgram {</code><br /><code>    public void calc() {</code><br /><code>        System.out.println(((0.2 * 3) / 2) + (3 / 2) * (3.2));</code><br /><code>    }</code><br /><br /><code>    public static void main(String[] args) {</code><br /><code>        MyThirdProgram c = new MyThirdProgram();</code><br /><code>        c.calc();</code><br /><code>    }</code><br /><code>}</code></p>',1,'',13,'drcuoa',2,'1','Model Solution','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-12-activity-lab-1-introduction-to-programming?module_item_id=1406308'),
 (28,'Module 1 Quiz Notes','<pre><code>int size = (int) 12;  </code><br /><br />// the integer size can store the integer 12 and the duplication with the cast doesn''t matter</pre>
<p><code>int size = (double) 12; </code></p>
<p>// incorrect as the cast to double happens and then code asks Java to store 12.0 as int when can''t</p>
<p><code>int size = 12.5;</code>&nbsp;</p>
<p>// incorrect as inconsistent data types</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p><img src="data:image/png;base64,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" /></p>
<p>&nbsp;</p>',2,'',12,'drcuoa',2,'1','canvas page','https://canvas.auckland.ac.nz/courses/72041/quizzes/89564'),
 (29,'Static methods vs Instance methods in Java','<p><strong>Instance Method</strong></p>
<p>Instance method are methods which require an object of its class to be created before it can be called. To invoke a instance method, we have to create an Object of the class in which the method is defined.&nbsp;</p>
<p><strong>Static Method</strong></p>
<p>Static methods are the methods in Java that can be called without creating an object of class. They are referenced by the&nbsp;<strong>class name itself</strong>&nbsp;or reference to the Object of that class.&nbsp;&nbsp;</p>
<p><img src="data:image/png;base64,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" /></p>',3,'',12,'drcuoa',2,'1','Geek4Geeks explainer','https://www.geeksforgeeks.org/static-methods-vs-instance-methods-java/'),
 (30,'Module 1 - Review Check','<h1>1.14 Module review</h1>
<p>In this module, you have learned to compile and run Java programs. You have understood the key steps in a programming process and the basic structure of a Java program. You have also used the basic Java components and methods from predefined Java classes to develop simple programs.</p>
<p>In the next module, you will explore the concept of object-oriented programming. You will also learn the control flow of a Java program.</p>',1,'',12,'drcuoa',2,'3','canvas page','https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-14-module-review?module_item_id=1406311'),
 (31,'Intro to Object Oriented Programming','<h1>2.1 This module&rsquo;s focus</h1>
<p>In this module, you will learn the key concepts of object-oriented programming, including classes and objects. You will learn to define different methods such as methods with parameters and methods with return values. You will also see more use of static and instance methods from common predefined Java classes. You will learn to create local variables and understand their scope.</p>
<h2>This module''s objectives</h2>
<p>By the end of this module, you should be able to:</p>
<ul>
<li>explain the key concepts of object-oriented programming, and construct variables and methods in classes</li>
<li>differentiate between static and instance methods in a Java program, and use these methods from common predefined Java classes such as String</li>
<li>explain what local variables are and their scope</li>
<li>explain how information is shared between objects and/or between methods within the same object.</li>
</ul>',3,'',13,'drcuoa',2,'1','Canva page','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-1-this-modules-focus?module_item_id=1406312'),
 (32,'Classes and objects','<h3><strong>My Notes</strong></h3>
<p><span style="color: #236fa1;"><strong>Objects:</strong></span></p>
<ul>
<li><span style="font-size: 10pt;">Programs can be thought of as a group of objects. Each object can have <strong>STATES</strong> (the things it has) and&nbsp;<strong>behaviors </strong>(things it is capable of doing)</span></li>
<li><span style="font-size: 10pt;">Lots of real-world things can be represented as objects.</span></li>
<li><span style="font-size: 10pt;">There are many objects that are the same kind and many kinds of different objects.</span>
<ul>
<li><span style="font-size: 10pt;">Telephone vs tree different kind of object</span></li>
<li><span style="font-size: 10pt;">Your mobile phone vs your friend''s mobile same kind of object</span></li>
</ul>
</li>
<li>In java,&nbsp; two objects of the same kind would have the same behavior but independent state information.</li>
<li>To specify the behavior and state information for an object - we use a class.</li>
</ul>
<p><span style="color: #2dc26b;"><strong>Classes:</strong></span></p>
<ul>
<li><span style="font-size: 10pt;">Are a structure used to define a category of objects, defining the state and behavior of an object.</span>
<ul>
<li><span style="font-size: 10pt;"><strong>STATE</strong> is stored in<span style="font-size: 12pt;"> <strong>variables</strong></span></span></li>
<li><span style="font-size: 10pt;"><strong>BEHAVIOR&nbsp;</strong>is defined in <span style="font-size: 12pt;"><strong>methods</strong></span></span></li>
</ul>
</li>
</ul>
<p>Think of classes as blueprints for a house, and objects as the actual house.</p>',3,'',13,'drcuoa',2,'1','canvas page','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-2-introduction-to-object-oriented-programming-classes-and-objects?module_item_id=1406313'),
 (33,'Duck Object Example','<p>So, how do we efficiently write all this in code? Here is a snippet of the Duck class:</p>
<div>
<pre>public class Duck {

    private int numFeet;
    private int numWings;

    // ... More state here...

    // Creates a duck with default values
    public Duck() {
        numFeet = 2;
        numWings = 2;
    }

    public void fly() {
        System.out.println("The duck flies using its " + numWings + " wings!");
    }

    public void walk() {
        System.out.println("The duck walks on its own " + numFeet + " feet!");
    }

    // ... More behavior here...
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>In this Duck class, we have instance variables that store a duck&rsquo;s state (what a duck has).</p>
<div>
<pre>private int numFeet;
private int numWings;</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have a constructor that allows us to create new duck objects.</p>
<div>
<pre>public Duck() {
    numFeet = 2;
    numWings = 2;
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have instance methods that define a duck&rsquo;s behaviour (what a duck does). Methods in a class can be defined in any order.</p>
<div>
<pre>public void fly() {
    System.out.println("The duck flies using its " + numWings + " wings!");
}

public void walk() {
    System.out.println("The duck walks on its own " + numFeet + " feet!");
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>Remember that Java is an object-oriented programming language. We use objects to pass messages to other objects. We also use objects to manipulate data. This Duck class is the blueprint for any duck objects that we might create later on.</p>
<h2>Objects</h2>
<p>In Java, all information is stored in either:</p>
<ul>
<li>a primitive data type variable, or</li>
<li>an object type variable.</li>
</ul>
<p>We have already seen primitive variables in the previous module. To declare an object type variable, we use the following syntax:</p>
<pre><code>class_identifier variable_identifier;</code></pre>
<p>For example, we can create a variable called duck that stores a Duck object:</p>
<pre><code>Duck duck;</code></pre>
<p>To create objects, we must use the keyword new. To initialise object variables, we use the following syntax:</p>
<pre><code>variable_identifier = new class_identifier (parameter_list);</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>For example, we can create a new Duck object and assign the object to the duck variable from the previous example.</p>
<div>
<pre>duck = new Duck();</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We sometimes have to pass information (parameters) about the new object in order to initialise it. For example, we can create a new String object with the value "Hello World" and assign the object to the s variable.</p>
<div>
<pre>String s = new String("Hello World");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>Note that a new object is only created when the keyword new is used.</p>
<h3>Object references</h3>
<p>When we declare an object variable, the variable stores a memory address. This means that when an object is constructed, the space for the object is allocated and the variable simply stores the location of the object (memory address of an object).</p>
<p>What happens when we assign a variable to another variable?</p>
<p>With primitive variables, the value or the content of the variable is copied directly to the new variable. Let&rsquo;s take a look at the following statements:</p>
<div>
<pre>int a = 10;
int b = a;</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have two variables, a and b. a has the value of 10, and a is also assigned to b. The content of a is copied into b. As a result, b has the value of 10. We can visualise the values stored in a and b as shown in the following figure. Note that a and b are two different variables located in different memory space of the computer.</p>
<figure><img style="height: auto;" src="https://canvas.auckland.ac.nz/courses/72041/files/8161210/preview" alt="Memory storing 10 in a and 10 in b" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161210" />
<figcaption>Memory blocks (2021) courtesy of University of Auckland</figcaption>
</figure>
<p>With object variables, if we assign one variable to another, the reference to the object is copied. This means that both variables end up referring to the same object. Let&rsquo;s take a look at the following statements:</p>
<div>
<pre>Duck d1 = new Duck();
Duck d2 = d1;</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have two variables, d1 and d2. The variable d1 contains the memory address (reference) of where the Duck object is actually stored. As d1 is assigned to d2, d2 will store the same memory address. Therefore, the two variables end up referring to the same object.</p>
<p>It is common to visualise the object variable as pointing to the actual object in memory. Taking the same example, you can see that both d1 and d2 are pointing to the same memory space that stores the Duck object in the following figure.</p>
<figure><img style="height: auto;" src="https://canvas.auckland.ac.nz/courses/72041/files/8160731/preview" alt="d1 and d2 are pointing to the same memory space that stores" data-api-returntype="File" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8160731" />&nbsp;
<figcaption>Memory spaces for duck object (2021) courtesy of University of Auckland<code></code></figcaption>
</figure>',1,'',12,'drcuoa',2,'1','canvas page 2.2','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-2-introduction-to-object-oriented-programming-classes-and-objects?module_item_id=1406313'),
 (34,'Object References','<h3>Object references</h3>
<p>When we declare an object variable, the variable stores a memory address. This means that when an object is constructed, the space for the object is allocated and the variable simply stores the location of the object (memory address of an object).</p>
<p>What happens when we assign a variable to another variable?</p>
<p>With primitive variables, the value or the content of the variable is copied directly to the new variable. Let&rsquo;s take a look at the following statements:</p>
<div>
<pre>int a = 10;
int b = a;</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have two variables, a and b. a has the value of 10, and a is also assigned to b. The content of a is copied into b. As a result, b has the value of 10. We can visualise the values stored in a and b as shown in the following figure. Note that a and b are two different variables located in different memory space of the computer.</p>
<p>With object variables, if we assign one variable to another, the reference to the object is copied. This means that both variables end up referring to the same object. Let&rsquo;s take a look at the following statements:</p>
<div>
<pre>Duck d1 = new Duck();
Duck d2 = d1;</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We have two variables, d1 and d2. The variable d1 contains the memory address (reference) of where the Duck object is actually stored. As d1 is assigned to d2, d2 will store the same memory address. Therefore, the two variables end up referring to the same object.</p>
<p>It is common to visualise the object variable as pointing to the actual object in memory. Taking the same example, you can see that both d1 and d2 are pointing to the same memory space that stores the Duck object in the following figure.</p>',1,'',13,'drcuoa',2,'1','Canvas 2.2 p2','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-2-introduction-to-object-oriented-programming-classes-and-objects?module_item_id=1406313'),
 (35,'More on methods','<p>We introduced methods in&nbsp;<a title="1.8 Introduction to methods" href="https://canvas.auckland.ac.nz/courses/72041/pages/1-dot-8-introduction-to-methods" data-api-returntype="Page" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/pages/1-dot-8-introduction-to-methods">Module 1</a>. A method is a self-contained section of code for accomplishing a task. Each method should perform just one task. The method signature is the name of the method and the types of all the parameters in the order they are declared. The method header is the first line of the method definition. A method can have:</p>
<ul>
<li>no parameters and return nothing</li>
<li>one or more parameters and return nothing</li>
<li>no parameters and return a value, or</li>
<li>one or more parameters and return a value.</li>
</ul>
<p>Parameters, or arguments, are used for passing information into a method. Each parameter must have the type defined in the method header. You can think of defining parameters in a method as the same as declaring variables.</p>
<h3>Methods with no parameters</h3>
<p>We can define methods that have no parameters when we do not need to pass any information to the methods.</p>
<p><strong>Q.</strong>&nbsp;What does the following method do?</p>
<div>
<pre>private char getRandomLetter() {
    String alpha = "abcdefghijklmnopqrstuvwxyz";
    int length = alpha.length();
    int charPos = (int) (Math.random() * length);
    return alpha.charAt(charPos);
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p><strong>A.&nbsp;</strong>This method randomly returns a character from the&nbsp;<samp>alpha</samp>&nbsp;string.</p>
<p>Somewhere in another method within the same class, we can call the&nbsp;<samp>getRandomLetter</samp>&nbsp;method as follows:</p>
<pre><code>char c1 = getRandomLetter();</code></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<h3>Methods with no return value</h3>
<p>We use the keyword&nbsp;<samp>void</samp>&nbsp;in the method header to indicate that the method does not return any value. When the method does not return anything, there is no need to use a&nbsp;<samp>return</samp>&nbsp;statement at the end of the method. The following method on the left with a&nbsp;<samp>return</samp>&nbsp;statement at the end does the same thing as the method on the right without a&nbsp;<samp>return</samp>&nbsp;statement.</p>
<table style="width: 1064.57px;">
<tbody>
<tr>
<td style="width: 528.301px;">
<div>
<pre>private void showMenu() {
    System.out.println("1. Reset game: ");
    System.out.println("2. Make a move: ");
    System.out.println("3. Quit: ");
    return;
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="width: 528.301px;">
<div>
<pre>private void showMenu() {
    System.out.println("1. Reset game: ");
    System.out.println("2. Make a move: ");
    System.out.println("3. Quit: ");
}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<h3>Return statement</h3>
<p>If there is a&nbsp;<samp>return</samp>&nbsp;type declared in the method, then you need to use the&nbsp;<samp>return</samp>&nbsp;statement to return the value within the body of the method. The&nbsp;<samp>return</samp>&nbsp;statement must always return the type specified in the method header. The&nbsp;<samp>return</samp>&nbsp;statement does not need to be at the end of the method. Sometimes we may want to stop the execution of the method before the last statement in the method is reached.</p>
<p>When a&nbsp;<samp>return</samp>&nbsp;statement is reached inside a method:</p>
<ul>
<li>the execution of the method stops immediately, and</li>
<li>the code execution returns to the point of the method call and the rest of the code inside the method is ignored.</li>
</ul>
<h3>Method execution</h3>
<p>When a method call is made, code execution jumps to the method. If the method returns a value, then when the method reaches a&nbsp;<samp>return</samp>&nbsp;statement, code execution returns to the point of call and the method call is replaced by the value returned.</p>',3,'',13,'drcuoa',2,'1','canvas 2.3','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-3-more-on-methods?module_item_id=1406314'),
 (36,'Why Use Methods','<p>By using methods, we can break our code up into different tasks. This makes our code:</p>
<ul>
<li>Easier to understand</li>
<li>Easier to debug</li>
<li>Easier to maintain.</li>
</ul>
<p>The use of methods also promotes the concept of code reuse. By reusing methods, we avoid duplication of code. Duplicate code can be hard to maintain. Changing duplicate code in a program can be time-consuming and error-prone.</p>
<p>Let&rsquo;s take a look at the following&nbsp;<samp>start</samp>&nbsp;method, where it:</p>
<ol>
<li>Displays a message on the console</li>
<li>Retrieves the user input from the keyboard</li>
<li>Converts the user input to an integer value</li>
<li>Repeats step 1&ndash;3 with a different display message on the console.</li>
</ol>
<div>
<pre>public void start() {

    System.out.print("Enter row: ");
    String userStr = Keyboard.readInput();
    int row = Integer.parseInt(userStr);

    System.out.print("Enter column: ");
    userStr = Keyboard.readInput();
    int col = Integer.parseInt(userStr);

}</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>We can create a method called&nbsp;<samp>getUserInt</samp>&nbsp;and move the code from step 1&ndash;3 to this method. We can then use&nbsp;<samp>getUserInt</samp>&nbsp;method in the&nbsp;<samp>start</samp>&nbsp;method as shown in the following code. If we want the user to enter more integer values, we can simply call the&nbsp;<samp>getUserInt</samp>&nbsp;method again.</p>
<div>
<pre>public void start() {
    int row = getUserInt("Enter row");
    int col = getUserInt("Enter column");
}

private int getUserInt(String prompt) {
    System.out.print(prompt + ": ");
    String userStr = Keyboard.readInput();
    int userIn = Integer.parseInt(userStr);
    return userIn;</pre>
</div>',2,'',13,'drcuoa',2,'1','Canva page','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-3-more-on-methods?module_item_id=1406314'),
 (37,'The 4 Access Modifiers Explained in Java','<p><strong>Fun Facts Continue</strong></p>
<p><strong>Access modifiers are keywords placed before attributes, methods, or classes to manage how they''re accessed. They restrict which methods, classes, or packages can use the modified data. </strong></p>
<p>Access modifiers are also sometimes referred to as visibility modifiers. This is an intuitive way of saying that they describe how visible certain parts of a program are to other components that may wish to access them.</p>
<p>Visibility modifiers enable you to limit how programmers access given classes.&nbsp;This actually fulfills a key principle of object-oriented programming&mdash;encapsulation.</p>
<p>These are the&nbsp;four access modifiers used in Java:</p>
<h2 id="default">Default</h2>
<p>When you don''t explicitly define a modifier, the Java compiler will use the default visibility access. At this access level, only classes in the same package as the defined class can access its variables or methods.</p>
<p>The default modifier also applies to classes, not just its members. It gives the same visibility restrictions to classes as it does to its members.</p>
<p>The default modifier is also referred to as package-private.</p>
<p>To use the default access modifier, just define your class members without any modifier:</p>
<pre><code>class Person{<br />int age;<br />String name;<br />int jump(){}<br />}</code><br /><br /></pre>
<h2 id="public-modifier">Public Modifier</h2>
<p>This modifier allows members of a class to be accessed in all packages. Simply put, you can access them everywhere.&nbsp;The&nbsp;<strong>public&nbsp;</strong>modifier provides the least restrictive level of access.</p>
<p>It''s also important to note that the&nbsp;<strong>public</strong>&nbsp;modifier can also be used with classes.</p>
<p>Simply prefix the class or its member with&nbsp;<strong>public</strong>&nbsp;so as to give it a public visibility. See the example below:</p>
<pre><code>public class Person{<br />public int age;<br />public String name;<br />public int jump(){}<br />}</code><br /><br /></pre>
<h2 id="private-modifier">Private Modifier</h2>
<p>This modifier allows members of a class to only be accessed within the class. Just like protected, private is also only applicable to members of a class.</p>
<p><strong>Private</strong>&nbsp;is the strictest level of access and should only be used if you are completely sure that you don''t want your class members being used by other classes. For example,&nbsp;you will get a compile-time error if you attempt to access a&nbsp;constructor with a private modifier.</p>
<p>As with&nbsp;<strong>public</strong>&nbsp;and&nbsp;<strong>private</strong>, simply add the keyword private to use this modifier.</p>
<pre>class Person{<br />private int age;<br />private String name;<br />private int jump (){}<br />}

<br /><br /></pre>
<h2 id="protected-modifier">Protected Modifier</h2>
<p>This modifier allows members of a class to be accessed within the class and its sub-classes. It can provide access outside a package though only through inheritance. Unlike the two previous modifiers,&nbsp;<strong>protected</strong>&nbsp;can only be used with members of a class, not the class itself.</p>
<p>See the code below on how you can use it:</p>
<pre><code>class Person{<br />protected int age;<br />protected String name;<br />protected int jump(){}<br />}</code></pre>',3,'',13,'drcuoa',2,'1','External Site','https://www.makeuseof.com/4-access-modifiers-java/'),
 (38,'Introduction to String/Convert Strings to Number and Reading Input from the User','<p><strong>String</strong>&nbsp;is a special type of object in Java. Strings can be used to represent words or sentences. We can assign String literals to variables of type&nbsp;<strong>String</strong>&nbsp;as shown in the following example. We can create a String using the<strong>&nbsp;new</strong>&nbsp;keyword. We can also create a String like a primitive value without using the new keyword. Note that we use " " (double quotes) to define a String whereas we use '' '' (single quotes) to define a character.</p>
<table style="width: 1090px;" border="0">
<tbody>
<tr>
<td style="width: 541px;">
<div>
<pre>String s;
s = new String("Hello World");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="width: 541px;">
<div>
<pre>String s;
s = "Hello World";</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<h3>String concatenation</h3>
<p>We can join (or concatenate) Strings using the plus operator (+). We can also use the plus operator to join numbers and Strings. If one of the operands is a String and the other operand is a primitive type, then the primitive value is converted automatically to a String. Don&rsquo;t forget that the usual rules of operator precedence are followed when joining Strings.</p>
<div>
<pre>System.out.println("Total is " + 3 + 4);</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>As we follow the rules of operator precedence, we first join the String&nbsp;<samp>"Total is "</samp>&nbsp;and the integer 3, which gives us&nbsp;<samp>"Total is 3"</samp>. Then, we join the String and the integer 4 to give us&nbsp;<samp>"Total is 34"</samp>.</p>
<p><strong>Q.</strong>&nbsp;What would the output be if the String concatenation is&nbsp;<samp>"Total is " + (3 + 4)</samp>? Remember, if the operands on both sides of the plus sign are numbers, then normal addition will occur. If there are no parentheses, evaluation of the expression will be from left to right.</p>
<p><strong>A.</strong>&nbsp;The output is&nbsp;<samp>"Total is 7"</samp></p>
<h3>Instance methods in the String class</h3>
<p>You already know that a character (<samp>char</samp>) is one of the primitive types. A String is composed of a sequence of these characters. Each character in a String has a corresponding number known as the index of the character. The first character has the index 0. As String is a predefined class in Java, there are different instance methods available to call on a String object. For example, we can call a String&rsquo;s&nbsp;<samp>charAt</samp>&nbsp;method to get the character at a given index in the String. We can also search a String for a given occurrence of a character using its&nbsp;<samp>indexOf</samp>&nbsp;method.</p>
<p>Here are some useful String methods:</p>
<ul>
<li><samp>length()</samp>returns the number of characters in the String including spaces</li>
<li><samp>charAt(int)</samp>&nbsp;returns the character in the String at a given position (the position in the String always starts from 0)</li>
<li><samp>indexOf(char)</samp>&nbsp;or&nbsp;<samp>indexOf(String)</samp>&nbsp;returns the index of the first occurrence of the given character or sub-string in a String</li>
<li><samp>substring(int)</samp>&nbsp;returns a part of the original String starting at the given index and ending at the end of the String</li>
<li><samp>substring(int,int)</samp>&nbsp;returns a part of the String starting from the first given index until the second given index. Note that the character at the end index is excluded</li>
<li><samp>toUpperCase()</samp>&nbsp;returns the String that has all characters converted to upper case</li>
<li><samp>toLowerCase()</samp>&nbsp;returns the String that has all characters converted to lower case.</li>
</ul>
<p>Don&rsquo;t forget that you can find a complete list of the methods for any predefined classes from the Java API.</p>
<div>
<div id="h5p-blanks-instructions-0">
<p>What is the value stored in each variable after the following statements have been executed?</p>
<pre><code>String greeting = new String("Hello World");
int greetingLength = greeting.length();
char c1 = greeting.charAt(0);
int position = greeting.indexOf(''d'');
String subStr = greeting.substring(8);
String subStr2 = greeting.substring(0, 2);
String greetingInUpperCase = greeting.toUpperCase();
String greetingInLowerCase = greeting.toLowerCase();
</code></pre>
</div>
</div>
<div>
<div role="group" aria-labelledby="h5p-blanks-instructions-0">
<div tabindex="-1">&nbsp;</div>
<p><code>greetingLength =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 1 of 7. Answered correctly" />;</code></p>
<p><code>c1 =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 2 of 7. Answered correctly" />;</code></p>
<p><code>position =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 3 of 7. Answered correctly" />;</code></p>
<p><code>subStr =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 4 of 7. Correct answer: &quot;rld&quot;. Answered incorrectly" /><span aria-hidden="true">"rld"</span>;</code></p>
<p><code>subStr2 =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 5 of 7. Correct answer: &quot;HE&quot;. Answered incorrectly" /><span aria-hidden="true">"HE"</span>;</code></p>
<p><code>greetingInUpperCase =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 6 of 7. Correct answer: &quot;HELLO WORLD&quot;. Answered incorrectly" /><span aria-hidden="true">"HELLO WORLD"</span>;</code></p>
<p><code>greetingInLowerCase =&nbsp;<input spellcheck="false" autocomplete="off" disabled="disabled" type="text" aria-label="Blank input 7 of 7. Correct answer: &quot;hello world&quot;. Answered incorrectly" /><span aria-hidden="true">"hello world"</span>;</code></p>
</div>
</div>
<h2>Converting Strings to numbers</h2>
<p>To convert a String to an integer value, we can use the static&nbsp;<samp>parseInt()</samp>&nbsp;method from the&nbsp;<strong>Integer</strong>&nbsp;class. For example:</p>
<div>
<pre>int num1 = Integer.parseInt("12");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>Similarly, to convert a String to a double value, we can use the static&nbsp;<samp>parseDouble()</samp>&nbsp;method from the Double class. For example:</p>
<div>
<pre>double num2 = Double.parseDouble("3.1415");</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p>If the String cannot be converted to a number, an error will occur when you run your program. A&nbsp;<samp>NumberFormatException</samp>&nbsp;will be thrown by&nbsp;<samp>Integer.parseInt()</samp>&nbsp;method or&nbsp;<samp>Double.parseDouble()</samp>&nbsp;method. We will look at exceptions later in this course.</p>
<h2>Reading input from the user</h2>
<p>In order to do anything useful, most programs require some input from the user. In the lab exercises, a source file&nbsp;<strong>Keyboard.java</strong>&nbsp;is provided to you. This source file should be in the same directory as other source files for the program you are writing. This class enables you to obtain input from the keyboard by calling the following static method:</p>
<pre>Keyboard.readInput();</pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<p>When you call the&nbsp;<samp>readInput()</samp>&nbsp;method, your program will halt and wait until the user presses the enter key. All the characters that have been typed will be returned from the method as a single String. For example, the following code could be used to read the name from the user and print out a welcome message.</p>
<div>
<pre>public class MyProgram {
    public void start() {
        System.out.print("Enter your name: ");
	String name = Keyboard.readInput();
	System.out.println("Hi there" + name);
    }
}</pre>
</div>
<p>&nbsp;</p>',3,'',13,'drcuoa',2,'1','Canvas','https://canvas.auckland.ac.nz/courses/72041/pages/2-dot-4-introduction-to-string?module_item_id=1406315'),
 (39,'Intellij Short-cuts','<h2>IntelliJ Shortcuts</h2>
<p>The list of IntelliJ IDEA shortcuts is extensive! And, while we''ve provided a number of them below, they only represent part of the key bindings at your disposal. For a one-page version of these IntelliJ IDEA shortcuts, be sure to skip to the end of the page and download our one-page IntelliJ cheat sheet. It features&nbsp;all of the IntelliJ&nbsp;Windows and&nbsp;IntelliJ Mac shortcuts&nbsp;below, and a few more for good measure.</p>
<h3 id="search">IntelliJ Search Shortcuts</h3>
<p>The shortcuts below are used for searching within usages, files, projects, and code.</p>
<table style="width: 700px;"><caption>IntelliJ Search Shortcuts</caption>
<tbody>
<tr>
<th>
<p><strong>Action</strong></p>
</th>
<th>
<p><strong>Windows</strong></p>
</th>
<th>
<p><strong>OS X</strong></p>
</th>
</tr>
<tr>
<td>
<p>Find usages</p>
</td>
<td>
<p>Ctrl + Alt + F7</p>
</td>
<td>
<p>⌘ + F7</p>
</td>
</tr>
<tr>
<td>
<p>Find usages (results)</p>
</td>
<td>
<p>Ctrl + Alt + Shift + F7</p>
</td>
<td>
<p>⌘ + Alt + F7</p>
</td>
</tr>
<tr>
<td>
<p>Find / Replace in file</p>
</td>
<td>
<p>Ctrl + F</p>
</td>
<td>
<p>⌘ + F / ⌘ + R</p>
</td>
</tr>
<tr>
<td>
<p>Find / Replace in projects</p>
</td>
<td>
<p>Ctrl + Shift + F</p>
</td>
<td>
<p>⌘ + Shift + F<br />⌘ + Shift + R</p>
</td>
</tr>
<tr>
<td>
<p>Find next</p>
</td>
<td>
<p>F3</p>
</td>
<td>
<p>F3</p>
</td>
</tr>
</tbody>
</table>
<h3 id="file-navigation">IntelliJ File Navigation Shortcuts</h3>
<p>The following IntelliJ shortcuts are for opening resources, types, lines, files, and switching tabs.</p>
<table style="width: 700px;"><caption>IntelliJ File Navigation Shortcuts</caption>
<tbody>
<tr>
<th>Action</th>
<th>
<p><strong>Windows</strong></p>
</th>
<th>
<p><strong>OS X</strong></p>
</th>
</tr>
<tr>
<td>
<p>Open resource / Navigate to file</p>
</td>
<td>
<p>Ctrl + Shift + N</p>
</td>
<td>
<p>⌘ + Shift + O</p>
</td>
</tr>
<tr>
<td>
<p>Open type</p>
</td>
<td>
<p>Ctrl + N</p>
</td>
<td>
<p>⌘&nbsp;+ O</p>
</td>
</tr>
<tr>
<td>
<p>Go to line</p>
</td>
<td>
<p>Ctrl + G</p>
</td>
<td>
<p>⌘ + L</p>
</td>
</tr>
<tr>
<td>
<p>Recent files</p>
</td>
<td>
<p>Ctrl + E</p>
</td>
<td>
<p>⌘ + E</p>
</td>
</tr>
<tr>
<td>
<p>Tab / File switcher</p>
</td>
<td>
<p>Ctrl + Tab</p>
</td>
<td>
<p>⌘ + Shift + [ / ]</p>
</td>
</tr>
</tbody>
</table>
<h3 id="text-editing">IntelliJ Text Editing Shortcuts</h3>
<p>These IntelliJ shortcuts for moving, deleting, copying, selecting, and formatting are great for&nbsp;editing text.</p>
<table style="width: 700px;"><caption>IntelliJ Text Editing Shortcuts</caption>
<tbody>
<tr>
<th>
<p><strong>Action</strong></p>
</th>
<th>
<p><strong>Windows</strong></p>
</th>
<th>
<p><strong>OS X</strong></p>
</th>
</tr>
<tr>
<td>
<p>Move lines</p>
</td>
<td>
<p>Alt + Shift + Up/Down</p>
</td>
<td>
<p>Alt + Shift + Up/Down</p>
</td>
</tr>
<tr>
<td>
<p>Delete lines</p>
</td>
<td>
<p>Ctrl + Y</p>
</td>
<td>
<p>⌘ + Y</p>
</td>
</tr>
<tr>
<td>
<p>Copy / Duplicate lines</p>
</td>
<td>
<p>Ctrl + D</p>
</td>
<td>
<p>⌘ + D</p>
</td>
</tr>
<tr>
<td>
<p>Select identifier</p>
</td>
<td>
<p>Ctrl + W</p>
</td>
<td>
<p>Alt + Up</p>
</td>
</tr>
<tr>
<td>
<p>Format code</p>
</td>
<td>
<p>Ctrl + Alt + L</p>
</td>
<td>
<p>⌘ + Alt + L</p>
</td>
</tr>
</tbody>
</table>
<h3 id="code-navigation">IntelliJ Code Navigation Shortcuts</h3>
<p>These IntelliJ shortcuts for finding, assessing, inspecting, and opening code are must-use for code navigation.</p>
<table style="width: 700px;"><caption>IntelliJ Code Navigation Shortcuts</caption>
<tbody>
<tr>
<th>
<p><strong>Action</strong></p>
</th>
<th>
<p><strong>Windows</strong></p>
</th>
<th>
<p><strong>OS X</strong></p>
</th>
</tr>
<tr>
<td>
<p>Find usages / References in workspace</p>
</td>
<td>
<p>Alt + F7</p>
</td>
<td>
<p>Alt + F7</p>
</td>
</tr>
<tr>
<td>
<p>Find usages results</p>
</td>
<td>
<p>Ctrl + Alt + Shift + F7</p>
</td>
<td>
<p>⌘ + Alt + Shift + F7</p>
</td>
</tr>
<tr>
<td>
<p>Inspect code hierachy</p>
</td>
<td>
<p>Ctrl + Alt + H</p>
</td>
<td>
<p>Ctrl + Alt + H</p>
</td>
</tr>
<tr>
<td>
<p>Open / Navigate to declaration</p>
</td>
<td>
<p>Ctrl + Alt + B</p>
</td>
<td>
<p>⌘ + Alt + B</p>
</td>
</tr>
<tr>
<td>
<p>Open / Navigate to type hierarchy</p>
</td>
<td>
<p>Ctrl + H</p>
</td>
<td>
<p>Ctrl + H</p>
</td>
</tr>
<tr>
<td>
<p>Open / Navigate to member hierarchy</p>
</td>
<td>
<p>Ctrl + Shift + H</p>
</td>
<td>
<p>⌘ + Shift + H</p>
</td>
</tr>
</tbody>
</table>
<h3 id="refactoring">IntelliJ Refactoring Shortcuts</h3>
<p>These shortcuts for IntelliJ include shortcuts for renaming, and extracting variables and methods.</p>
<table style="width: 700px;"><caption>IntelliJ Refactoring Shortcuts</caption>
<tbody>
<tr>
<th>
<p><strong>Action</strong></p>
</th>
<th>
<p><strong>Windows</strong></p>
</th>
<th>
<p><strong>OS X</strong></p>
</th>
</tr>
<tr>
<td>
<p>Rename</p>
</td>
<td>
<p>Ctrl + Alt + R</p>
</td>
<td>
<p>Shift + F6</p>
</td>
</tr>
<tr>
<td>
<p>Surround with</p>
</td>
<td>
<p>Ctrl + Alt + T</p>
</td>
<td>
<p>⌘ + Alt + T</p>
</td>
</tr>
<tr>
<td>
<p>Extract local variable</p>
</td>
<td>
<p>Ctrl + Alt + V</p>
</td>
<td>
<p>⌘ + Alt + V</p>
</td>
</tr>
<tr>
<td>
<p>Extract / Assign to field</p>
</td>
<td>
<p>Ctrl + Alt + F</p>
</td>
<td>
<p>⌘ + Alt + F</p>
</td>
</tr>
<tr>
<td>
<p>Extract method</p>
</td>
<td>
<p>Ctrl + Alt + M</p>
</td>
<td>
<p>⌘ + Alt + M</p>
</td>
</tr>
</tbody>
</table>
<p><br /><br /></p>',1,'',13,'drcuoa',2,'1','External Blog Site unverified','https://www.jrebel.com/blog/intellij-shortcuts'),
 (40,'Module 2 Lab Exercise One','<pre><code>package ictgradschool;</code><br /><br /><code>public class exerciseOne {</code><br /><code>    public void simpleCalc() {</code><br /><br /><code>        int a = 7;</code><br /><code>        int b = 1;</code><br /><code>        int c = a + 2;</code><br /><code>        a = b;</code><br /><code>        b = c;</code><br /><code>        c = c + 1;</code><br /><br /><code>        System.out.println("a is: " + a);</code><br /><code>        System.out.println("b is: " + b);</code><br /><code>        System.out.println("c is: " + c);</code><br /><br /><code>    }</code><br /><br /><br /><code>    public static void main(String[] args) {</code><br /><code>        exerciseOne output = new exerciseOne();</code><br /><code>        output.simpleCalc();</code><br /><code>    }</code><br /><code>}</code><br /><code>// REMEMBER PSEUDO CODE AND DIAGRAMS CAN HELP GET YOUR LOGIC STRAIGHT</code><br /><code>// you can use a 2 axis diagram with rows representing variables identifiers,</code><br /><code>// cols representing state at each line of execution of the code,</code><br /><code>// and the boxes on the diagram will represent what''s stored in memory</code></pre>',1,'',13,'drcuoa',2,'1','IntelliJ package java class',''),
 (41,'Java this Keyword','<h1>Java&nbsp;<span style="color: #0e0eff;">this</span>&nbsp;Keyword</h1>
<pre><code>public class Main {
  int x;

  // Constructor with a parameter
  public Main(int x) {
    this.x = x;
  }

  // Call the constructor
  public static void main(String[] args) {
    Main myObj = new Main(5);
    System.out.println("Value of x = " + myObj.x);
  }</code> }<br /><br /></pre>
<h2>Definition and Usage</h2>
<p>The&nbsp;<code>this</code>&nbsp;keyword refers to the current object in a method or constructor.</p>
<p>The most common use of the&nbsp;<code>this</code>&nbsp;keyword is to eliminate the confusion between class attributes and parameters with the same name (because a class attribute is shadowed by a method or constructor parameter). If you omit the keyword in the example above, the output would be "0" instead of "5".</p>
<p><code>this</code>&nbsp;can also be used to:</p>
<ul>
<li>Invoke current class constructor</li>
<li>Invoke current class method</li>
<li>Return the current class object</li>
<li>Pass an argument in the method call</li>
<li>Pass an argument in the constructor call</li>
</ul>
<hr />
<h2>Related Pages</h2>
<p>Read more about objects in our&nbsp;<a href="https://www.w3schools.com/java/java_classes.asp">Java Classes/Objects Tutorial</a>.</p>
<p>Read more about constructors in our&nbsp;<a href="https://www.w3schools.com/java/java_constructors.asp">Java Constructors Tutorial</a>.</p>
<p>Read more about methods in our&nbsp;<a href="https://www.w3schools.com/java/java_methods.asp">Java Methods Tutorial</a>.</p>
<p>&nbsp;</p>',3,'',13,'drcuoa',2,'1','w3Schools Java Pages','https://www.w3schools.com/java/ref_keyword_this.asp#:~:text=The%20this%20keyword%20refers%20to,a%20method%20or%20constructor%20parameter).'),
 (42,'Module 2 Lab Exercise Two','<p><strong>Fruit.java</strong></p>
<pre><code>package ictgradschool.industry.oop.fruits;</code><br /><br /><code>public class Fruit {</code><br /><code>    private String name;</code><br /><br /><code>    // calls, with reserved word ''new'' to the method will take the String parameter ''name'',</code><br /><code>    // supplied by the call and instantiate a new object in memory and place the String value inside this memory location:</code><br /><code>    public Fruit(String name) {</code><br /><code>        this.name = name;</code><br /><code>    }</code><br /><br /><code>    // calls to the method will return the existing value stored in reference objects state identifier in memory:</code><br /><code>    public String getFruitName() {</code><br /><code>        return this.name;</code><br /><code>    }</code><br /><br /><code>    // calls to the method will use object used to make the call and the supplied parameter ''(String) name''</code><br /><code>    // and place the value of the parameter in the memory location used for that object.name value storage</code><br /><code>    public void setFruitName(String name) {</code><br /><code>        this.name = name;</code><br /><code>    }</code></pre>
<p><strong>FruitStore.java</strong></p>
<pre>package ictgradschool.industry.oop.fruits;<br /><br /><code>public class FruitStore {</code><br /><code>    public static void main(String[] args) {</code><br /><code>        Fruit apple = new Fruit("red apple");</code><br /><code>        Fruit orange = new Fruit("orange");</code><br /><code>        Fruit greenApple = apple;  // note this is reference to an existing location in memory with variable identifier ''apple'',</code><br /><code>                                   // this means variable identifiers ''apple'' and ''greenApple'' will point to the same location in memory</code><br /><br /><code>        System.out.println("The fruit is " + apple.getFruitName()); // "The fruit is red apple" should print to console</code><br /><code>        System.out.println("The fruit is " + orange.getFruitName()); // "The fruit is orange" should print to console</code><br /><code>        System.out.println("The fruit is " + greenApple.getFruitName()); // "The fruit is red apple" should print to console</code><br /><br /><code>        orange.setFruitName("navel orange"); // existing orange object''s name property is changed in memory to navel orange</code><br /><code>        greenApple.setFruitName("green apple"); // existing memory location referenced by greenApple object''s name property is changed to green apple</code><br /><code>                                                // NOTE the same memory location is used for object variable Apple, so both are updated to ''green apple''</code><br /><code>        System.out.println("The fruit is " + apple.getFruitName()); //"The fruit is green apple" should print to console (see notes above)</code><br /><code>        System.out.println("The fruit is " + orange.getFruitName()); //"The fruit is navel orange" should print to console</code><br /><code>        System.out.println("The fruit is " + greenApple.getFruitName()); //"The fruit is green apple" should print to console</code><br /><code>    }</code><br /><code>}</code></pre>',2,'',13,'drcuoa',2,'1','Fruit.java',''),
 (43,'Module 2 Exercise one - object references Note on Card Structure','<p>NOTE</p>
<p>Module 2 Exercise one and two as documented previously both related to Module 2 Exercise one - <strong>object references</strong></p>',3,'',13,'drcuoa',2,'1','',''),
 (44,'Module 2 Lab - Method return types and parameters Exercise Two','<h4>Fill in the blanks below so that each method will compile.</h4>
<p>My answers:</p>
<pre><code>  
  1.
  	private <strong> Word </strong> getRandomLetter(String <strong> word </strong> ){
  	int position = (int)(Math.random()*word.length()); 
  	return word.charAt(position); 
  	}
    
  2. 
  	private <strong> String </strong>  getSurname(<strong> String </strong> name) { 
  	int positionOfSpace = name.indexOf(" "); 
  	return name.substring(positionOfSpace + 1); 
  	}
    
  3. 
  	private <strong> Double </strong> getBMI(double <strong> weight </strong>, <strong> double </strong>height){
  	double bmi = weight / Math.pow(height,2); 
  	return bmi; } 
    
  4. 
  	private <strong> void </strong> printTemperature(int degrees)
  	{ System.out.println("The temperature is " + degrees);
</code></pre>
<p>Solution:</p>
<p>my answer to 1.was wrong,&nbsp; should be char</p>
<pre><code> 
	private ____char____ getRandomLetter(String ____word_____ ){
		int position = (int)(Math.random()*word.length());
		return word.charAt(position);
	}

	private ___String__ getSurname(_____String_____ name) {
		int positionOfSpace = name.indexOf(" ");
		return name.substring(positionOfSpace + 1);
	}

	private ___double____ getBMI(double __weight__, __double__ height){
		double bmi = weight / Math.pow(height,2);
		return bmi;
	}

	private ___void___ printTemperature(int ____degrees____ ){
		System.out.println("The temperature is " + degrees);
	}
</code></pre>',3,'',13,'drcuoa',2,'1','',''),
 (46,'Method Signature Definition','<div id="article-meta_1-0" data-tracking-container="true">
<div id="reference-bylines_1-0">
<div id="mntl-bylines__group_1-0">
<div>In <a href="https://www.thoughtco.com/what-is-java-2034117" data-ordinal="1" data-type="internalLink" data-source="inlineLink" data-component="link">Java</a>, a method signature is part of the method declaration. It''s the combination of the method name and the&nbsp;<a href="https://www.thoughtco.com/parameter-2034268" data-ordinal="2" data-type="internalLink" data-source="inlineLink" data-component="link">parameter</a>&nbsp;list.</div>
</div>
</div>
</div>
<div id="article-content_1-0">
<div id="mntl-sc-page_1-0" data-bind-scroll-on-start="true" data-sc-content-positions="[1, 1050, 1250, 1550, 1950, 2350, 2750, 3150]" data-sc-load-immediate="3" data-sc-breakpoint="54em" data-sc-max-track-height="600" data-sc-min-track-height="250" data-sc-ad-track-spacing="100" data-sc-ad-label-height="24" data-sc-sticky-offset="85">
<div id="mntl-sc-block_1-0-1">
<div id="mntl-block_4-0">
<div id="ref-billboard1-sticky-dynamic_1-0" data-height="1050">
<div id="mntl-sc-sticky-billboard-ad_1-0">
<div id="billboard" data-auction-floor-value="5" data-auction-floor-id="b41477228fe543d197c2a129faf4a1bc" data-targeting="{}" data-rtb="true" data-sizes="[[300, 250],[300, 600],[160, 600],[300, 1050],[1, 2],&quot;fluid&quot;]" data-priority="2" data-pos="atf" data-type="billboard"></div>
</div>
</div>
</div>
</div>
<p id="mntl-sc-block_1-0-2">The reason for the emphasis on just the method name and parameter list is because of&nbsp;<a href="https://www.thoughtco.com/overloading-2034261" data-ordinal="1" data-type="internalLink" data-source="inlineLink" data-component="link">overloading</a>. It''s the ability to write methods that have the same name but accept different parameters. The Java compiler is able to discern the difference between the methods through their method signatures.</p>
<div id="mntl-sc-block_1-0-3"></div>
<span id="toc-method-signature-examples"></span>
<h2 id="mntl-sc-block_1-0-4">Method Signature Examples</h2>
<pre id="mntl-sc-block_1-0-5"><strong>public void setMapReference(int xCoordinate, int yCoordinate)</strong><br /><strong>{</strong><br /><strong>//method code</strong><br /><strong>}</strong></pre>
</div>
</div>
<p id="mntl-sc-block_1-0-7">The method signature in the above example is&nbsp;<em>setMapReference(int, int).&nbsp;</em>In other words, it''s the method name and the parameter list of two integers.&nbsp;</p>
<div id="mntl-sc-block_1-0-8">
<div id="mntl-block_6-0">
<div id="mntl-native_2-0">
<div id="mntl-native__adunit_2-0">
<div id="native" data-targeting="{}" data-rtb="true" data-sizes="[[1, 3],&quot;fluid&quot;]" data-priority="4" data-pos="native" data-type="native"></div>
</div>
</div>
</div>
</div>
<pre><strong>public void setMapReference(Point position)</strong><br /><strong>{</strong><br /><strong>//method code</strong><br /><strong>}</strong></pre>
<div title="Edit &amp; Save To Grepper">&nbsp;</div>
<pre id="mntl-sc-block_1-0-9"></pre>
<div id="mntl-sc-block_1-0-10"></div>
<p id="mntl-sc-block_1-0-11">The Java compiler will let us add another method like the above example because&nbsp;its method signature is different,&nbsp;<em>setMapReference(Point)</em>&nbsp;in this case.</p>',3,'',13,'drcuoa',2,'1','thought.co external link','https://www.thoughtco.com/method-signature-2034235'),
 (47,'Lab 2 - General Notes and Questions for Tutors (1)','<p>exercise 2 - each parameter passed to a method must have its data type confirmed in the method header (first line of the method) - think of this as the same as declaring variables.</p>
<p>Not sure I understand why we don''t define parameters in the method header when there are no returns (i.e. when we use <strong>void</strong>)</p>
<p>exercise 3&nbsp;</p>
<pre>System.out.println("Exercise Three Strings and Using String methods: test output follows:");<br />System.out.println((int)2.9 * Double.parseDouble("4.5")); // "a. 9"<br />System.out.println("17" + Integer.parseInt("2") * 3.5); // "b. 177"<br />System.out.println("5 + 3" + 19 % 2 + 19 / 2); // "c. 5 + 310"<br />System.out.println(2 + 5 + "59" + 3 * 2 + (3 + 2)); // "d. 75911"<br /><br />System.out.println("wtfruckly correction testing: a");<br />System.out.println((int)2.9);<br />System.out.println(Double.parseDouble("4.5"));// integer multiplied by a double is an integer fruckly!<br /><br />System.out.println("wtfruckly correction testing: b");<br />System.out.println(Integer.parseInt("2") * 3.5); // integer multiplied by a double is an integer fruckly!<br /><br /><br />System.out.println("wtfruckly correction testing: c");<br />System.out.println("5 + 3");<br />System.out.println(19 % 2);<br />System.out.println(19 / 2);  // why does the + operator concatenate in this example rather than perform addition?<br /><br />System.out.println("wtfruckly correction testing: d");<br />System.out.println(2 + 5);<br />System.out.println("59");<br />System.out.println(3 * 2);<br /><br /><br />CONSOLE OUTPUT:<br /><br />a is: 1<br />b is: 9<br />c is: 10<br />Exercise Three Strings and Using String methods: test output follows:<br />9.0<br />177.0<br />5 + 319<br />75965<br />wtfruckly correction testing: a<br />2<br />4.5<br />wtfruckly correction testing: b<br />7.0<br />wtfruckly correction testing: c<br />5 + 3<br />1<br />9<br />wtfruckly correction testing: d<br />7<br />59<br />6<br />5<br /><br />System.out.println((3 + 2)); // why does the + operator concatenate in this example rather than perform addition?</pre>',3,'',13,'sidenotes',3,'1','None',''),
 (48,'Module 2 Lab Exercise Five','<p><code>/* this program is my answer to lab02 ex 5</code></p>
<p><code>* it looks difficult for me</code></p>
<p><code>*</code></p>
<p><code>*&nbsp; &nbsp;Instance Method without parameter</code></p>
<p><code>*&nbsp; &nbsp;Syntax:</code></p>
<p><code>*</code></p>
<p><code>*&nbsp; &nbsp; &nbsp; &nbsp;modifier return_type method_name( )</code></p>
<p><code>*&nbsp; &nbsp; &nbsp; &nbsp;{</code></p>
<p><code>*&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;method body ;</code></p>
<p><code>*&nbsp; &nbsp; &nbsp; &nbsp;}</code></p>
<p><code>*</code></p>
<p><code>*modifier&nbsp; &nbsp;: It defines the access type of the method, and it is optional to use.</code></p>
<p><code>*return_type: Method may return a value. Ex:- int, void, String, char, float, etc.</code></p>
<p><code>*method_name: This is the method name you can write anything as you write the variable name.</code></p>
<p><code>*method body: The method body describes what the method does with statements.</code></p>
<p><code>*</code></p>
<p><code>&nbsp;*/</code></p>
<p>&nbsp;</p>
<p><code>import ictgradschool.Keyboard;</code></p>
<p>&nbsp;</p>
<p><code>public class exerciseFiveLowestWeight {</code></p>
<p><code>&nbsp; &nbsp; public void getLowestWeight(double firstWeight, double secondWeight) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; double lowestWeight = Math.min(firstWeight, secondWeight);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Lowest weight is " + lowestWeight);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; public static void main(String[] args) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Enter first person''s weight:");</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String inputFirstWeight = Keyboard.readInput();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Enter second person''s weight:");</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String inputSecondWeight = Keyboard.readInput();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; exerciseFiveLowestWeight w = new exerciseFiveLowestWeight();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; w.getLowestWeight(Double.parseDouble(inputFirstWeight),Double.parseDouble(inputSecondWeight));</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>}</code></p>',3,'',13,'drcuoa',2,'1','None',''),
 (49,'Module 2 Lab Exercise Six','<p>ictgradschool/industry/oop/luckynumbers/LuckyNumbers.java:17</p>
<p><code>package ictgradschool.industry.oop.luckynumbers;</code></p>
<p><code>/**</code></p>
<p><code>&nbsp;* Write a program which generates 2 random integers between 25 and 30 (inclusive),</code></p>
<p><code>&nbsp;* then uses Math.min() and Math.max() to display them in descending sequence.</code></p>
<p><code>&nbsp;*/</code></p>
<p>&nbsp;</p>
<p><code>/**</code></p>
<p><code>&nbsp;* TODO Your code here. You may also write additional methods if you like.</code></p>
<p><code>&nbsp;*/</code></p>
<p>&nbsp;</p>
<p><code>public class LuckyNumbers {</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; private void start() {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp;int firstLuckyNumber = getRandomInteger();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp;int secondLuckyNumber = getRandomInteger();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Your lucky numbers are "+ firstLuckyNumber + " and " + secondLuckyNumber);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p>&nbsp; &nbsp; private int getRandomInteger() {</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; // generate a random number between 25 and 30 inclusive</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; int highNumber=30;</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; double randomFactor= 1 - Math.random();</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; int randomNumber = (highNumber-((int)((randomFactor * 10) / 2)));</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; return randomNumber;</p>
<p>&nbsp; &nbsp; }</p>
<p>&nbsp; &nbsp;&nbsp;</p>
<p>&nbsp; &nbsp; /**</p>
<p>&nbsp; &nbsp; &nbsp;* Program entry point. Do not edit.</p>
<p>&nbsp; &nbsp; &nbsp;*/</p>
<p>&nbsp; &nbsp; public static void main(String[] args) {</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; LuckyNumbers ex = new LuckyNumbers();</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; ex.start();</p>
<p>&nbsp;</p>
<p>&nbsp; &nbsp; }</p>
<p>}</p>',3,'',13,'drcuoa',2,'1','None',''),
 (50,'Module 2 Lab Exercise Seven','<p><code>package ictgradschool.industry.oop.sortingnumbers;</code></p>
<p>&nbsp;</p>
<p><code>/**</code></p>
<p><code>&nbsp;* Write a program that prompts the user to enter a range &ndash; 2 integers representing a lower bound and an upper bound.</code></p>
<p><code>&nbsp;* You should use Keyboard.readInput() for this. Then, convert these bounds from String to int using Integer.parseInt().</code></p>
<p><code>&nbsp;* Your program should then use Math.random() to generate 3 random integers that lie between the range entered (inclusive),</code></p>
<p><code>&nbsp;* and then use Math.min() to determine which of the random integers is the smallest.</code></p>
<p><code>&nbsp;*/</code></p>
<p>&nbsp;</p>
<p><code>import ictgradschool.Keyboard;</code></p>
<p>&nbsp;</p>
<p><code>/**</code></p>
<p><code>&nbsp;* TODO Your code here. You may also write additional methods if you like.</code></p>
<p><code>&nbsp;*/</code></p>
<p>&nbsp;</p>
<p><code>public class SortingNumbers {</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; private void start() {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Enter lower bound:");</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int lowerBound = Integer.parseInt(Keyboard.readInput());</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Enter upper bound:");</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int upperBound = Integer.parseInt(Keyboard.readInput());</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int num1 = getRandomNumber(lowerBound, upperBound);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int num2 = getRandomNumber(lowerBound, upperBound);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int num3 = getRandomNumber(lowerBound, upperBound);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("3 randomly generated numbers: " + num1 + ", "+ num2 + " and " + num3);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int lowestNumber = getMinNumber(num1, num2, num3);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Smallest number is = " + lowestNumber);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; private int getRandomNumber(int lowBound, int highBound) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; // generate and return a random number within the lower and higher bound entered by the user inclusive.</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; double randomFactor = 1 - Math.random();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; int range= highBound - lowBound;</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; return ((int)(lowBound +( randomFactor * range)));</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; private int getMinNumber(int a, int b, int c) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; return Math.min(Math.min(a,b),c);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* Program entry point. Do not edit.</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public static void main(String[] args) {</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; SortingNumbers ex = new SortingNumbers();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; ex.start();</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>}</code></p>
<p>&nbsp;</p>',3,'',13,'drcuoa',2,'1','None','http://localhost:3000/dbcards'),
 (51,'String Methods JAVA','<table class="ws-table-all notranslate" style="font-family: ''Segoe UI'', Tahoma, sans-serif; font-size: 12px; margin: 0px;">
<tbody>
<tr>
<th style="width: 125.341px;">Method</th>
<th style="width: 156.169px;">Description</th>
<th style="width: 75.8906px;">Return Type</th>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_charat.asp">charAt()</a></td>
<td>Returns the character at the specified index (position)</td>
<td>char</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_codepointat.asp">codePointAt()</a></td>
<td>Returns the Unicode of the character at the specified index</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_codepointbefore.asp">codePointBefore()</a></td>
<td>Returns the Unicode of the character before the specified index</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_codepointcount.asp">codePointCount()</a></td>
<td>Returns the number of Unicode values found in a string.</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_compareto.asp">compareTo()</a></td>
<td>Compares two strings lexicographically</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_comparetoignorecase.asp">compareToIgnoreCase()</a></td>
<td>Compares two strings lexicographically, ignoring case differences</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_concat.asp">concat()</a></td>
<td>Appends a string to the end of another string</td>
<td>String</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_contains.asp">contains()</a></td>
<td>Checks whether a string contains a sequence of characters</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_contentequals.asp">contentEquals()</a></td>
<td>Checks whether a string contains the exact same sequence of characters of the specified CharSequence or StringBuffer</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_copyvalueof.asp">copyValueOf()</a></td>
<td>Returns a String that represents the characters of the character array</td>
<td>String</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_endswith.asp">endsWith()</a></td>
<td>Checks whether a string ends with the specified character(s)</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_equals.asp">equals()</a></td>
<td>Compares two strings. Returns true if the strings are equal, and false if not</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_equalsignorecase.asp">equalsIgnoreCase()</a></td>
<td>Compares two strings, ignoring case considerations</td>
<td>boolean</td>
</tr>
<tr>
<td>format()</td>
<td>Returns a formatted string using the specified locale, format string, and arguments</td>
<td>String</td>
</tr>
<tr>
<td>getBytes()</td>
<td>Encodes this String into a sequence of bytes using the named charset, storing the result into a new byte array</td>
<td>byte[]</td>
</tr>
<tr>
<td>getChars()</td>
<td>Copies characters from a string to an array of chars</td>
<td>void</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_hashcode.asp">hashCode()</a></td>
<td>Returns the hash code of a string</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_indexof.asp">indexOf()</a></td>
<td>Returns the position of the first found occurrence of specified characters in a string</td>
<td>int</td>
</tr>
<tr>
<td>intern()</td>
<td>Returns the canonical representation for the string object</td>
<td>String</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_isempty.asp">isEmpty()</a></td>
<td>Checks whether a string is empty or not</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_lastindexof.asp">lastIndexOf()</a></td>
<td>Returns the position of the last found occurrence of specified characters in a string</td>
<td>int</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_length.asp">length()</a></td>
<td>Returns the length of a specified string</td>
<td>int</td>
</tr>
<tr>
<td>matches()</td>
<td>Searches a string for a match against a regular expression, and returns the matches</td>
<td>boolean</td>
</tr>
<tr>
<td>offsetByCodePoints()</td>
<td>Returns the index within this String that is offset from the given index by codePointOffset code points</td>
<td>int</td>
</tr>
<tr>
<td>regionMatches()</td>
<td>Tests if two string regions are equal</td>
<td>boolean</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_replace.asp">replace()</a></td>
<td>Searches a string for a specified value, and returns a new string where the specified values are replaced</td>
<td>String</td>
</tr>
<tr>
<td>replaceFirst()</td>
<td>Replaces the first occurrence of a substring that matches the given regular expression with the given replacement</td>
<td>String</td>
</tr>
<tr>
<td>replaceAll()</td>
<td>Replaces each substring of this string that matches the given regular expression with the given replacement</td>
<td>String</td>
</tr>
<tr>
<td>split()</td>
<td>Splits a string into an array of substrings</td>
<td>String[]</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_startswith.asp">startsWith()</a></td>
<td>Checks whether a string starts with specified characters</td>
<td>boolean</td>
</tr>
<tr>
<td>subSequence()</td>
<td>Returns a new character sequence that is a subsequence of this sequence</td>
<td>CharSequence</td>
</tr>
<tr>
<td>substring()</td>
<td>Returns a new string which is the substring of a specified string</td>
<td>String</td>
</tr>
<tr>
<td>toCharArray()</td>
<td>Converts this string to a new character array</td>
<td>char[]</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_tolowercase.asp">toLowerCase()</a></td>
<td>Converts a string to lower case letters</td>
<td>String</td>
</tr>
<tr>
<td>toString()</td>
<td>Returns the value of a String object</td>
<td>String</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_touppercase.asp">toUpperCase()</a></td>
<td>Converts a string to upper case letters</td>
<td>String</td>
</tr>
<tr>
<td><a href="chrome-extension://cdmlkjchffgfbckhillkhofhmnnnkoej/ref_string_trim.asp">trim()</a></td>
<td>Removes whitespace from both ends of a string</td>
<td>String</td>
</tr>
<tr>
<td>valueOf()</td>
<td>Returns the string representation of the specified value</td>
<td>String</td>
</tr>
</tbody>
</table>',1,'',13,'drcuoa',2,'1','W3 Schools Help','https://www.w3schools.com/java/java_ref_string.asp'),
 (52,'Java String charAt() Method Examples','<p>&nbsp;</p>
<p>Let''s see Java program related to string in which we will use charAt() method that perform some operation on the give string.</p>
<p>FileName: CharAtExample.java</p>
<p>&nbsp;</p>
<p><code>public class CharAtExample{&nbsp;&nbsp;</code></p>
<p><code>public static void main(String args[]){&nbsp;&nbsp;</code></p>
<p><code>String name="javatpoint";&nbsp;&nbsp;</code></p>
<p><code>char ch=name.charAt(4);//returns the char value at the 4th index&nbsp;&nbsp;</code></p>
<p><code>System.out.println(ch);&nbsp;&nbsp;</code></p>
<p><code>}}&nbsp;&nbsp;</code></p>',1,'',13,'drcuoa',2,'1','JavaPoint','https://www.javatpoint.com/java-string-charat#:~:text=The%20Java%20String%20class%20charAt,length%20or%20a%20negative%20number.'),
 (53,'JavaScript forEach()','<p><strong>forEach() calls a function for each element in an array:</strong></p>
<p><code>&lt;p id="demo"&gt;&lt;/p&gt;</code></p>
<p><code>&lt;script&gt;</code></p>
<p><code>let text = "";</code></p>
<p><code>const fruits = ["apple", "orange", "cherry"];</code></p>
<p><code>fruits.forEach(myFunction);</code></p>
<p><code>document.getElementById("demo").innerHTML = text;</code></p>
<p><code>function myFunction(item, index) {</code></p>
<p><code>&nbsp; text += index + ": " + item + "&lt;br&gt;";&nbsp;</code></p>
<p><code>}</code></p>
<p><code>&lt;/script&gt;</code></p>',0,'',4,'drcuoa',2,'3','w3Schools JavaScript Pages','https://www.w3schools.com/jsref/jsref_foreach.asp'),
 (54,'Module 2 Lab Exercise Ten Naughts and Crosses','<p><code>package ictgradschool.industry.oop.noughtsandcrosses;</code></p>
<p>&nbsp;</p>
<p><code>/**</code></p>
<p><code>&nbsp;* Write a program to extract 3 rows of 6 characters from a String of 18 characters.</code></p>
<p><code>&nbsp;* The program should print out the 3 rows, followed by the left diagonal of the 3 rows.</code></p>
<p><code>&nbsp;* The String method substring() can be used to extract the required characters.</code></p>
<p><code>&nbsp;*/</code></p>
<p><code>public class NoughtsAndCrosses {</code></p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* Runs an example output.</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; private void start() {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String letters = "X X O O X O X O X ";</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String row1 = getRow(letters, 1);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String row2 = getRow(letters, 2);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String row3 = getRow(letters, 3);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; printRows(row1, row2, row3);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String leftDiagonal = getLeftDiagonal(row1, row2, row3);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; printDiagonal(leftDiagonal);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* TODO Implement this</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public String getRow(String letters, int row) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; switch (row) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 1:</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return letters.substring(0,6);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 2:</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return letters.substring(6,12);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; case 3:</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return letters.substring(12,18);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; default:</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return null;</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; }</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* TODO Implement this</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public void printRows(String row1, String row2, String row3) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(row1);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(row2);</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(row3);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* TODO Implement this</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public String getLeftDiagonal(String row1, String row2, String row3) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; String letters = row1 + row2 + row3;</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; return "Diagonal: " + letters.substring(0,2) + letters.substring(8,10) + letters.substring(16,18);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* TODO Implement this</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public void printDiagonal(String leftDiagonal) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(leftDiagonal);</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p>&nbsp;</p>
<p><code>&nbsp; &nbsp; /**</code></p>
<p><code>&nbsp; &nbsp; &nbsp;* Program entry point. Do not edit.</code></p>
<p><code>&nbsp; &nbsp; &nbsp;*/</code></p>
<p><code>&nbsp; &nbsp; public static void main(String[] args) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; NoughtsAndCrosses ex = new NoughtsAndCrosses();</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; ex.start();</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>}</code></p>',3,'',13,'drcuoa',2,'1','none','http://localhost:3000/dbcards'),
 (56,'Bug Report - Forms not loading options on all views','<p>e.g nav icon + clicked on view profile doesn''t have the input selection options loading</p>',0,'',1,'drcuoa',2,'1','',''),
 (57,'3.2 Boolean variables and expressions','<p>A boolean variable is a primitive type which stores either true or false. The following example shows two boolean variables. We can assign true or false directly to boolean variables:</p>
<p><code>boolean isTall = true;&nbsp;</code></p>
<p><code>boolean hasFinished = false;</code></p>
<p>We can assign one boolean variable to another boolean variable as shown in the following example.</p>
<p><code>boolean willPass = true;</code></p>
<p><code>boolean isEnrolled = willPass;</code></p>
<p>We can also output the value stored in a boolean variable as shown in the following example.</p>
<p><code>System.out.println("willPass: " + willPass);</code></p>',3,'',14,'drcuoa',2,'1','Module 3.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-2-boolean-variables-and-expressions?module_item_id=1406321'),
 (58,'Relational Operators','<p><span style="font-size: 14pt;"><strong>Relational operators</strong></span></p>
<p>Relational operators are used to compare two elements of data. Each of these operators evaluates to true or false. The following table shows the relational operators that we can use in Java programming.</p>
<table style="border-collapse: collapse; width: 99.9135%;" border="1">
<tbody>
<tr>
<td style="width: 29.5779%;">Operator</td>
<td style="width: 29.5779%;">Meaning</td>
<td style="width: 29.5779%;">Example</td>
</tr>
<tr>
<td style="width: 29.5779%;">==</td>
<td style="width: 29.5779%;">Equal to</td>
<td style="width: 29.5779%;">
<p>x == y: &ldquo;x is equal to y&rdquo;</p>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width: 29.5779%;">!=</td>
<td style="width: 29.5779%;">
<p>NOT equal to</p>
<p>&nbsp;</p>
</td>
<td style="width: 29.5779%;">
<p>x != y: &ldquo;x is not equal to y&rdquo;</p>
<p>&nbsp;</p>
</td>
</tr>
<tr>
<td style="width: 29.5779%;">&gt;&nbsp;</td>
<td style="width: 29.5779%;">Greater than</td>
<td style="width: 29.5779%;">x &gt; y: &ldquo;x is greater than y&rdquo;</td>
</tr>
<tr>
<td style="width: 29.5779%;">&lt;&nbsp;</td>
<td style="width: 29.5779%;">Less than</td>
<td style="width: 29.5779%;">x &lt; y: &ldquo;x is less than y&rdquo;</td>
</tr>
<tr>
<td style="width: 29.5779%;">&gt;=</td>
<td style="width: 29.5779%;">Greater than or equal</td>
<td style="width: 29.5779%;">x &gt;= y: &ldquo;x is greater than or equal to y&rdquo;</td>
</tr>
<tr>
<td style="width: 29.5779%;">&lt;=</td>
<td style="width: 29.5779%;">Less than or equal</td>
<td style="width: 29.5779%;">x &lt;= y: &ldquo;x is less than or equal to y&rdquo;</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
<p>These relational operators are used to define the boolean expressions that always evaluate to either true or false.</p>',3,'',14,'drcuoa',2,'1','Module 3.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-2-boolean-variables-and-expressions?module_item_id=1406321'),
 (59,'Reference equality and Value equality, Comparing objects and Floating Point Numbers','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Reference equality and Value equality</h3>
<p><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For primitive types, the equality&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>==</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;operator tests if the two values are the same. This is known as value equality or equality of value. As shown in the following example, we compare if a is equal to b. We then assign the result of the comparison, which is true, to the&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>isEqual</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;variable.</span></p>
<p><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For primitive types, the equality&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>==</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;operator tests if the two values are the same. This is known as value equality or equality of value. As shown in the following example, we compare if a is equal to b. We then assign the result of the comparison, which is true, to the&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>isEqual</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;variable.</span></p>
<p><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For object types (e.g. String), the&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>==</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;operator tests if two variables refer to the same object. This is known as reference equality. As shown in the following example, a and b are not the same object. Therefore,&nbsp;</span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #eeeeee; padding: 3px;"><samp>isEqual</samp></span><span style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;stores the value false even though a and b contain the same String value.</span></p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">String a = <span style="color: #0000ff;">new</span> String(<span style="color: #a31515;">"Hello"</span>);
String b = <span style="color: #0000ff;">new</span> String(<span style="color: #a31515;">"Hello"</span>);
<span style="color: #2b91af;">boolean</span> isEqual = (a == b);</pre>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Comparing objects</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">To compare the values of two objects, we can use the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>equals()</samp></span>&nbsp;instance method. For example, with Strings, the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>equals()</samp></span>&nbsp;method tests if two Strings contain exactly the same characters or String values. As shown in the following code,&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>isEqual</samp></span>&nbsp;is true because a and b contain the same String value.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">String a = <span style="color: #0000ff;">new</span> String(<span style="color: #a31515;">"Hello"</span>);
String b = <span style="color: #0000ff;">new</span> String(<span style="color: #a31515;">"Hello"</span>);
<span style="color: #2b91af;">boolean</span> isEqual = a.equals(b);</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Comparing floating-point numbers</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><strong>Q.</strong>&nbsp;What is the value of&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>isEqual</samp></span>&nbsp;when we execute the following code?</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">double</span> a = 1.0000000001 - 1.0;
<span style="color: #2b91af;">double</span> b = 0.0000000001;
<span style="color: #2b91af;">boolean</span> isEqual = (a == b);</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><strong>A.</strong>&nbsp;The answer is false. Why? This is because floating-point numbers are always stored approximately. Using&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>==</samp></span>&nbsp;is insufficient due to possible rounding errors. To test the equality of floating-point numbers, we can check if the difference between the two values is less than an acceptable error limit. For example:</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">boolean</span> isEqual = (Math.abs(a - b) &lt; 1e-15);</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">This shows that we first find the absolute difference of a and b using&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>Math.abs()</samp></span>. We then check if the absolute difference is within an acceptable error limit. In this example, the acceptable error limit is&nbsp;<em>1e-15</em>, which is a shorthand of writing exponents in Java.&nbsp;<em>1e-15&nbsp;</em>is equivalent to 1 * 10<span style="position: relative; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em;">-15</span>.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For more information on floating-point rounding errors, see&nbsp;<a class="external" style="outline: transparent solid 0.125rem;" href="https://floating-point-gui.de/basic/" target="_blank" rel="noreferrer noopener">https://floating-point-gui.de/basic/<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>.</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>',3,'',14,'drcuoa',2,'1','Module 3.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-2-boolean-variables-and-expressions?module_item_id=1406321'),
 (60,'Logical Operators and Operator Order of Precedence','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Logical operators</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The logical operators,&nbsp;<strong>AND</strong>,&nbsp;<strong>OR</strong>&nbsp;and&nbsp;<strong>NOT</strong>, are used to combine Boolean expressions and to negate Boolean expressions. Here is the summary of the logical operators in Java:</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<table class="table table-bordered" style="max-width: 100%; background-color: transparent; width: 541.2px; margin-bottom: 20px; border-width: 1px 1px 1px 0px; border-image: initial; border-radius: 3px; border-spacing: 0px; height: 272px; border-color: #dddddd #dddddd #dddddd initial; border-style: solid solid solid initial;" width="100%" cellpadding="20"><caption style="font-size: 0.9em; font-style: italic;">Logical operators</caption>
<thead style="background: #e4e9ed;">
<tr style="height: 65px;">
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-left-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 86.8375px;" scope="col">Operator name</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; background-color: #00457c; color: white; height: 65px; width: 72.2625px;" scope="col">Java syntax</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; background-color: #00457c; color: white; width: 198.925px; height: 65px;">Example</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-right-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 114.175px;" scope="col">Meaning</th>
</tr>
</thead>
<tbody>
<tr style="height: 77px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 86.8375px; height: 77px;" width="105">
<p style="margin: 12px 0px;">AND</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 72.2625px; height: 77px;" width="83">
<p style="margin: 12px 0px;">&amp;&amp;</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 198.925px; height: 77px;" width="229">
<p style="margin: 12px 0px;">age &gt;= 18 &amp;&amp; age &lt;= 99</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 114.175px; height: 77px;" width="199">
<p style="margin: 12px 0px;">age is greater than or equal to 18 and less than or equal to 99</p>
</td>
</tr>
<tr style="height: 77px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 86.8375px; height: 77px;" width="105">
<p style="margin: 12px 0px;">OR</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 72.2625px; height: 77px;" width="83">
<p style="margin: 12px 0px;">||</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 198.925px; height: 77px;" width="229">
<p style="margin: 12px 0px;">position.equals("Student") || position.equals("Lecturer")</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 114.175px; height: 77px;" width="199">
<p style="margin: 12px 0px;">position is equal to either &ldquo;Student&rdquo; or &ldquo;Lecturer&rdquo;</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-radius: 0px 0px 0px 4px; width: 86.8375px; height: 53px;" width="105">
<p style="margin: 12px 0px;">NOT</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 72.2625px; height: 53px;" width="83">
<p style="margin: 12px 0px;">!</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 198.925px; height: 53px;" width="229">
<p style="margin: 12px 0px;">!text.contains(naughtyWord)</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-bottom-right-radius: 4px; width: 114.175px; height: 53px;" width="199">
<p style="margin: 12px 0px;">text does not contain naughtyWord</p>
</td>
</tr>
</tbody>
</table>
<figcaption style="padding: 0.5em;">Logical operators (2021) courtesy of University of Auckland</figcaption>
</figure>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The following truth tables summarise the results of the combination of logical conditions based on the logical operators.</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<table class="table table-bordered" style="max-width: 100%; background-color: transparent; width: 541.2px; margin-bottom: 20px; border-width: 1px 1px 1px 0px; border-image: initial; border-radius: 3px; border-spacing: 0px; height: 277px; border-color: #dddddd #dddddd #dddddd initial; border-style: solid solid solid initial;" width="100%" cellpadding="20"><caption style="font-size: 0.9em; font-style: italic;">Operator combinations</caption>
<thead style="background: #e4e9ed;">
<tr style="height: 65px;">
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-left-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 113.375px;" scope="col">Input 1</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; background-color: #00457c; color: white; width: 105.738px; height: 65px;">Input 2</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; background-color: #00457c; color: white; height: 65px; width: 123.875px;" scope="col">&amp;&amp; (AND)</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-right-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 129.212px;" scope="col">|| (OR)</th>
</tr>
</thead>
<tbody>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 113.375px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 105.738px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 123.875px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 129.212px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 113.375px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 105.738px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 123.875px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 129.212px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 113.375px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 105.738px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 123.875px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 129.212px; height: 53px;" width="95">
<p style="margin: 12px 0px;">True</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-radius: 0px 0px 0px 4px; width: 113.375px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 105.738px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 123.875px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
<td style="padding: 8px; line-height: 20px; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-bottom-right-radius: 4px; width: 129.212px; height: 53px;" width="95">
<p style="margin: 12px 0px;">False</p>
</td>
</tr>
</tbody>
</table>
<figcaption style="padding: 0.5em;">Operator combinations (2021) courtesy of University of Auckland</figcaption>
</figure>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<table class="table table-bordered" style="max-width: 100%; background-color: transparent; width: 541.2px; margin-bottom: 20px; border-width: 1px 1px 1px 0px; border-image: initial; border-radius: 3px; border-spacing: 0px; height: 147px; margin-left: auto; margin-right: auto; border-color: #dddddd #dddddd #dddddd initial; border-style: solid solid solid initial;" width="60.1442%" cellpadding="20"><caption style="font-size: 0.9em; font-style: italic;">NOT expressions</caption>
<thead style="background: #e4e9ed;">
<tr style="height: 65px;">
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-left-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 270.562px;" scope="col"><strong>Input</strong></th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-right-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 235.637px;" scope="col">! (NOT)</th>
</tr>
</thead>
<tbody>
<tr style="height: 42px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 270.562px; height: 42px;">True</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 235.637px; height: 42px;">False</td>
</tr>
<tr style="height: 40px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-radius: 0px 0px 0px 4px; width: 270.562px; height: 40px;">False</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-bottom-right-radius: 4px; width: 235.637px; height: 40px;">True</td>
</tr>
</tbody>
</table>
<figcaption style="padding: 0.5em;">NOT expressions (2021) courtesy of University of Auckland</figcaption>
</figure>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">More examples on the use of logical operators:</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<table class="table table-bordered" style="max-width: 100%; background-color: transparent; width: 541.2px; margin-bottom: 20px; border-width: 1px 1px 1px 0px; border-image: initial; border-radius: 3px; border-spacing: 0px; height: 200px; margin-left: auto; margin-right: auto; border-color: #dddddd #dddddd #dddddd initial; border-style: solid solid solid initial;" width="100%" cellpadding="20"><caption style="font-size: 0.9em; font-style: italic;">Examples of logical operators</caption>
<thead style="background: #e4e9ed;">
<tr style="height: 65px;">
<th style="padding: 8px; line-height: 20px; text-align: left; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-left-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 166px;" scope="col"><strong>Expression</strong></th>
<th style="padding: 8px; line-height: 20px; text-align: left; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-right-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 340.2px;" scope="col">Meaning</th>
</tr>
</thead>
<tbody>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166px;" width="267">
<p style="margin: 12px 0px;">1. value &gt; 10 &amp;&amp; value &lt; 100</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value greater than 10 AND less than 100?</p>
</td>
</tr>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166px;" width="267">
<p style="margin: 12px 0px;">2. value &gt; 10 || value == 1</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value greater than 10 OR the value is equal to 1?</p>
</td>
</tr>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166px;" width="267">
<p style="margin: 12px 0px;">3. !(value &gt; 10)</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value NOT greater than 10?</p>
</td>
</tr>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166px;" width="267">
<p style="margin: 12px 0px;">4. value &lt;= 10</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value less than or equal to 10? (This is equivalent to #3)</p>
</td>
</tr>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166px;" width="267">
<p style="margin: 12px 0px;">5. !(value &gt; 10) &amp;&amp; value != 1</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value NOT greater than 10 AND NOT equal to 1?</p>
</td>
</tr>
<tr>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-radius: 0px 0px 0px 4px; width: 166px;" width="267">
<p style="margin: 12px 0px;">6. !(value &gt; 10 || value == 1)</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-bottom-right-radius: 4px; width: 340.2px;" width="348">
<p style="margin: 12px 0px;">Is the value NOT either greater than 10 OR equal to 1? (This is equivalent to #5)</p>
</td>
</tr>
</tbody>
</table>
<figcaption style="padding: 0.5em;">Examples of logical operators (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Operator precedence</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Like arithmetic operators, logical operators also have precedence. It is important to know which logical operators have the highest precedence so that the evaluation would be done in the correct order. The following table shows the list of operators according to the order of precedence from highest to lowest.</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<table class="table table-bordered" style="max-width: 100%; background-color: transparent; width: 541.2px; margin-bottom: 20px; border-width: 1px 1px 1px 0px; border-image: initial; border-radius: 3px; border-spacing: 0px; height: 542px; margin-left: auto; margin-right: auto; border-color: #dddddd #dddddd #dddddd initial; border-style: solid solid solid initial;" width="100%" cellpadding="20"><caption style="font-size: 0.9em; font-style: italic;">Operator precedence</caption>
<thead style="background: #e4e9ed;">
<tr style="height: 65px;">
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-left-radius: 4px; background-color: #00457c; color: white; height: 65px; width: 166.012px;" scope="col"><strong>Expression</strong></th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; background-color: #00457c; color: white; height: 65px; width: 161.587px;" scope="col">Meaning</th>
<th style="padding: 8px; line-height: 20px; text-align: center; vertical-align: bottom; border-top: 0px; border-left: 1px solid #dddddd; border-top-right-radius: 4px; background-color: #00457c; color: white; width: 161.6px; height: 65px;">Example</th>
</tr>
</thead>
<tbody>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Grouping operators</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">()</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">(a + b)</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Unary operators</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">+, -, !</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">+a, -a, !a</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Multiplicative arithmetic</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">*, /, %</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a * b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Additive arithmetic</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">+, -</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a + b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Relational ordering</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">&lt;, &gt;, &lt;=, &gt;=</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a &lt;= b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Relational equality</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">==, !=</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a == b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Logical and</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">&amp;&amp;</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a &amp;&amp; b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Logical or</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">||</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a || b</p>
</td>
</tr>
<tr style="height: 53px;">
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-radius: 0px 0px 0px 4px; width: 166.012px; height: 53px;" width="195">
<p style="margin: 12px 0px;">Assignment</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; width: 161.587px; height: 53px;" width="195">
<p style="margin: 12px 0px;">=, +=, -=, *=, /=, %=</p>
</td>
<td style="padding: 8px; line-height: 20px; text-align: left; vertical-align: top; border-top: 1px solid #dddddd; border-left: 1px solid #dddddd; border-bottom-right-radius: 4px; width: 161.6px; height: 53px;" width="195">
<p style="margin: 12px 0px;">a %= b</p>
</td>
</tr>
</tbody>
</table>
<figcaption style="padding: 0.5em;">Operator precedence (2021) courtesy of University of Auckland</figcaption>
</figure>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For more information, see&nbsp;<a class="instructure_file_link inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://docs.oracle.com/javase/tutorial/java/nutsandbolts/opsummary.html" target="_blank" rel="noreferrer noopener">Operators<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(Oracle, 2020).</p>',3,'',14,'drcuoa',2,'1','Module 3.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-2-boolean-variables-and-expressions?module_item_id=1406321'),
 (61,'Control Structures','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">So far, the statements that we have been writing are executed in the order in which they are written.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">private</span> <span style="color: #2b91af;">void</span> start() {
    <span style="color: #2b91af;">int</span> age = 0;
    test();
    test2();
    System.out.println(<span style="color: #a31515;">"age = "</span> + age);
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">To allow our programs to make decisions, we need to introduce the control structures; these allow us to change the flow of our programs.</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">If statements</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In Java, we can use if statements to make a decision on whether or not to follow a given set of instructions. The formal syntax is:</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">if (boolean_expression) {
    statement_list
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Note that the condition must be a Boolean expression. If the condition is true, then everything in the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>statement_list</samp></span>&nbsp;is executed. If the condition is false, then everything in the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>statement_list</samp></span>&nbsp;is ignored, and execution of code will continue with the instruction following the entire if statement. The statements in the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>statement_list</samp></span>&nbsp;are known as the body of the control structure.&nbsp;&nbsp;</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">If statements: Common errors</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In Java, when we want to check if something is between two values, we cannot use mathematics shortcuts. As shown in the following example, we need to use two Boolean expressions and the &amp;&amp; operator to check if b is between 10 and 20. The code on the left cannot be compiled.</p>
<table style="max-width: 100%; background-color: #ffffff; border-spacing: 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; width: 930px;" border="0">
<tbody>
<tr>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (10 &lt; b &lt; 20) {
    doSomething();
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (b &gt; 10 &amp;&amp; b &lt; 20) {
    doSomething();
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">When we want to check for value equality, we need to use double equals&nbsp;<strong>==,</strong>&nbsp;not a single equal sign&nbsp;<strong>=</strong>. Remember that the equal sign = in Java is used for value assignment, not for value comparison. The code on the left cannot be compiled.</p>
<table style="max-width: 100%; background-color: #ffffff; border-spacing: 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; width: 930px;" border="0">
<tbody>
<tr>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (a = b) {
    doSomething();
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (a == b) {
    doSomething();
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>',3,'',14,'drcuoa',2,'1','Module 3.3 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-3-control-structures?module_item_id=1406322'),
 (62,'If / Else statements','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can use the if / else statement to control which set of instructions to follow when the condition is true or false. The formal syntax is:</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">if (boolean_expression) {
    statement_list_A
} else {
    statement_list_B
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">If the condition is true, then statements in list A will be executed. If the condition is false, then statements in list B will be executed.</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Nested if statements</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">When you use an&nbsp;<strong>if</strong>&nbsp;statement, you can specify at least one statement to be executed if the condition evaluates to true. This statement can be any valid statement in Java, including another if statement. Similarly, any Java statement, including another if statement, can occur inside the&nbsp;<strong>else</strong>&nbsp;part of the if statement.</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">if (boolean_expression) { &nbsp; &nbsp; <br />    if (boolean_expression) {
        statement_list<br />    } <br />} else {<br />    if (boolean_expression) {
        statement_list<br />    }
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The following example shows the use of nested if statements.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (x &lt; 10) {
    <span style="color: #0000ff;">if</span> (y &gt; 9 || y == 5) {
        System.out.println(<span style="color: #a31515;">"line 1"</span>);
	x = 11;
    } <span style="color: #0000ff;">else</span> {
	<span style="color: #0000ff;">if</span> (y % 2 == 0 || y == 3) {
	    System.out.println(<span style="color: #a31515;">"line 2"</span>);
	} <span style="color: #0000ff;">else</span> {
	    System.out.println(<span style="color: #a31515;">"line 3"</span>);
	}
    }
} <span style="color: #0000ff;">else</span> {
    <span style="color: #0000ff;">if</span> (y &gt; x &amp;&amp; y &gt;= 5) {
        System.out.println(<span style="color: #a31515;">"line 4"</span>);
	x = 12;
    } <span style="color: #0000ff;">else</span> {
	System.out.println(<span style="color: #a31515;">"line 5"</span>);
    }
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Sometimes, using nested if statements can get confusing. Instead of using the nested if statements, we can use if / else if. Notice that we can replace the if statement inside the else with else if.&nbsp;</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">if (boolean_expression) {
    statement_list
} else if (boolean_expression) {
    statement_list
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Based on the previous example, we can change the code to use the else if statement:</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">if</span> (x &lt; 10) {
    <span style="color: #0000ff;">if</span> (y &gt; 9 || y == 5) {
	System.out.println(<span style="color: #a31515;">"line 1"</span>);
	x = 11;
    } <span style="color: #0000ff;">else</span> <span style="color: #0000ff;">if</span> (y % 2 == 0 || y == 3) {
	System.out.println(<span style="color: #a31515;">"line 2"</span>);
    } <span style="color: #0000ff;">else</span> {
	System.out.println(<span style="color: #a31515;">"line 3"</span>);
    }
} <span style="color: #0000ff;">else</span> <span style="color: #0000ff;">if</span> (y &gt; x &amp;&amp; y &gt;= 5) {
    System.out.println(<span style="color: #a31515;">"line 4"</span>);
    x = 12;
} <span style="color: #0000ff;">else</span> {
    System.out.println(<span style="color: #a31515;">"line 5"</span>);
}</pre>
</div>',3,'',14,'drcuoa',2,'1','Module 3.3 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-3-control-structures?module_item_id=1406322'),
 (63,'If / Else Example','<div class="h5p-guess-answer-title" style="text-align: center; margin: 1em 1em 0px; font-size: 1.25em; color: #555555; font-family: sans-serif;">
<p style="margin: 0.5em auto;"><img style="display: block; width: auto; height: auto; margin-bottom: 1em; line-height: 0; max-width: 100%; margin-left: auto; margin-right: auto; font-size: 16px; background-color: #ffffff;" title="" src="https://ap-southeast-2.cdn.h5p.com/orgs/1290410142176651809/organization/content/1291543734688229219/images/file-61ed2066db856.png" alt="java code" /></p>
</div>
<div class="media" style="color: #555555; font-family: sans-serif; font-size: 16px; text-align: center;">
<div class="h5p-image">Answer = AD30 (remember to you need to execute all the statements inside the block, you only skip whole blocks that follow the first instance of true in the overall execution)</div>
</div>',3,'',14,'drcuoa',2,'1','Module 3.3 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-3-control-structures?module_item_id=1406322'),
 (64,'More on RETURN statement','<h1 class="page-title" style="margin: 15px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: 200; line-height: 1.5; text-rendering: optimizelegibility; font-size: 2.5em; color: #666666; background-color: #ffffff;">More on return</h1>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Remember that when a return statement is reached inside a method, the execution of the method stops immediately. The code execution returns to the point of the method call and the rest of the code inside the method is ignored. If the method has a return type, then the return statement must always return to the type specified in the method header. For example, the following&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>getBlocks()</samp></span>&nbsp;method must return an integer value as specified in the method header.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">private</span> <span style="color: #2b91af;">int</span> getBlocks(<span style="color: #2b91af;">int</span> hrs, <span style="color: #2b91af;">int</span> mins) {
    <span style="color: #2b91af;">int</span> totalMins, blocks = 0;
    totalMins = hrs * 60 + mins;
    blocks = totalMins / 10;
    <span style="color: #0000ff;">return</span> blocks;
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Sometimes we may want to stop the execution of a method before the last statement in that method is reached. If the return type of the method is void, we can use the following statement which will immediately stop the execution of the method:</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">return;</code></pre>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">SEE VIDEO ON CP LINK : The return statement example.</code></p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;"></code></p>',3,'',14,'drcuoa',2,'1','Module 3.4 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-4-more-on-return?module_item_id=1406323'),
 (65,'Repetition (While and For Loops, including BREAK/CONTINUE statement)','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">When we have instructions that we want to execute repeatedly, we use a programming construct called a&nbsp;<strong>loop</strong>. There are common situations where loops are used. For example, we can use loops for counting items, or to require valid input from the user. Moreover, we can use loops to read an unspecified number of values or to iterate through a sequence of data.</span></p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">In this course, we will look at two types of loops:&nbsp;<strong>while</strong>&nbsp;and&nbsp;<strong>for</strong>&nbsp;loops.</span></p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;"><span style="color: #000000;">While loop</span></h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">The syntax for a&nbsp;<strong>while</strong>&nbsp;loop is:</span></p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #000000;"><code style="background-color: transparent; border-radius: 6px; padding: 0px; font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border: 0px; color: inherit;">while (boolean_expression) {
    statement_list
}</code></span></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">Note that the syntax of a&nbsp;<strong>while</strong>&nbsp;statement is similar to the syntax of an&nbsp;<strong>if</strong>&nbsp;statement. A while loop statement has the keyword&nbsp;<strong>while&nbsp;</strong>followed by a boolean expression in parentheses. The boolean expression is known as the condition of the loop. If the condition evaluates to true, then the statements between the curly braces (statement list) are executed. These statements are known as the body of the loop. After the statements are executed, control returns to the top of the loop and the condition is tested again. If the condition still evaluates to true, then the body of the loop is executed again and so on, until the condition finally evaluates to false. When the condition is false, then the body of the loop is skipped.</span></p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;"><span style="color: #000000;">Designing loops</span></h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">The following diagram shows the flow of control of a loop. The&nbsp;<strong>while&nbsp;</strong>loop consists of the following parts:</span></p>
<figure style="margin: 1em 0px; text-align: center; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;"><img style="max-width: 979px; height: auto; vertical-align: middle; border: 0px; display: block; margin-left: auto; margin-right: auto;" src="https://canvas.auckland.ac.nz/courses/72041/files/8161215/preview" alt="while loop: initialisation, check condition, repeat while condition is true" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161215" data-api-returntype="File" /></span>
<figcaption style="padding: 0.5em;"><span style="color: #000000;">Flow of control of a while loop (2021) courtesy of University of Auckland</span></figcaption>
</figure>
<ol style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li><span style="color: #000000;"><strong>Initialisation</strong>: any work that needs doing before the loop starts. Often a variable will need to be set to a starting value. In a&nbsp;<strong>while&nbsp;</strong>loop, the initialisation occurs before the keyword&nbsp;<strong>while&nbsp;</strong>is used to start the loop.</span></li>
<li><span style="color: #000000;"><strong>Condition</strong>: a boolean expression which determines when the loop will be executed. The loop is only executed when the condition is true. We need to make sure that the loop condition will eventually evaluate to false.</span></li>
<li><span style="color: #000000;"><strong>Body of the loop</strong>: these are the statements which are being repeated.</span></li>
<li><span style="color: #000000;"><strong>Increment</strong>: a loop will only stop when the condition is false. The increment is the part which makes a change to a variable that will eventually make the condition false. In a&nbsp;<strong>while&nbsp;</strong>loop, the increment is contained within the curly braces which define the body of the loop.</span></li>
</ol>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;"><span style="color: #000000;">For loop</span></h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">A&nbsp;<strong>for</strong>&nbsp;loop is similar to a while loop. The syntax of a&nbsp;<strong>for&nbsp;</strong>loop is:</span></p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #000000;"><code style="background-color: transparent; border-radius: 6px; padding: 0px; font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border: 0px; color: inherit;">for (initialisation ; condition ; increment) {
    statement_list
}</code></span></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: #000000;">A for loop consists of the following:</span></p>
<ol style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li><span style="color: #000000;"><strong>Initialisation</strong>: the initialisation part is executed only once. It occurs before anything else in the loop and it is used to initialise any variables which are required in the rest of the loop.</span></li>
<li><span style="color: #000000;"><strong>Condition</strong>: the condition must be a boolean expression. It is checked after the initialisation part is completed and before the execution of the body of the loop. If the condition is true, then the body of the loop is executed.</span></li>
<li><span style="color: #000000;"><strong>Increment</strong>: the increment part is executed after each time the body of the loop has executed and before the condition is tested.</span></li>
</ol>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">Scope of variables in loops</h2>
<p style="margin: 12px 0px;">The variable that controls a&nbsp;<strong>for&nbsp;</strong>loop is often only needed for the purposes of the loop, and is not referred to elsewhere. Any variables declared in the initialisation section of the&nbsp;<strong>for&nbsp;</strong>loop only exist inside the&nbsp;<strong>for&nbsp;</strong>loop, and cannot be referred to outside of the loop.</p>
<p style="margin: 12px 0px;">For example, the following code would not compile. This is because the variable&nbsp;<strong>i</strong>&nbsp;is defined in the&nbsp;<strong>for&nbsp;</strong>loop and only exists inside the loop. The last statement, as highlighted, would be illegal.</p>
<div style="background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span> firstNum = 681;
<span style="color: #2b91af;">int</span> lastNum = 712;
<span style="color: #0000ff;">for</span> (<span style="color: #2b91af;">int</span> i = firstNum; i &lt;= lastNum; i++) {
    <span style="color: #0000ff;">if</span> (i % 9 == 0) {
        System.out.println(i + <span style="color: #a31515;">""</span>);
    }
}
<span style="background-color: #fbeeb8;">System.out.println(i + <span style="color: #a31515;">""</span>);
</span></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px;">To correct the mistake, we could declare the variable&nbsp;<strong>i</strong>&nbsp;before the loop and use it normally within the loop. The following code would compile after declaring the variable outside the loop.</p>
<div style="background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span> firstNum = 681;
<span style="color: #2b91af;">int</span> lastNum = 712;
<span style="color: #2b91af;">int</span> i = 0;
<span style="color: #0000ff;">for</span> (i = firstNum; i &lt;= lastNum; i++) {
    <span style="color: #0000ff;">if</span> (i % 9 == 0) {
        System.out.println(i + <span style="color: #a31515;">""</span>);
    }
}
System.out.println(i + <span style="color: #a31515;">""</span>);</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px;">Any variables which are declared in the body of a loop only exist within the loop, and cannot be referred to outside of the loop body. The following code would not compile as the variable&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>num</samp></span>&nbsp;is declared inside the&nbsp;<strong>while</strong>&nbsp;loop. The highlighted statement would be illegal.</p>
<div style="background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span> i = 2;
<span style="color: #0000ff;">while</span> (i &lt; 10) {
    <span style="color: #2b91af;">int</span> num = i + 2 * 513 / 24 - 2;
    i++;
}
<span style="background-color: #fbeeb8;">System.out.println(num + <span style="color: #a31515;">""</span>);
</span></pre>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45;"><span style="color: #000000;">While loop vs For loop</span></h3>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;"><span style="color: #000000;">Any&nbsp;<strong>while</strong>&nbsp;loop can be written as a&nbsp;<strong>for</strong>&nbsp;loop and vice versa. For example, we could write a&nbsp;<strong>while</strong>&nbsp;loop that counts up to 10 as shown on the left. We could use a&nbsp;<strong>for</strong>&nbsp;loop to do the same as shown on the right.</span></p>
<table style="font-size: 16px; max-width: 100%; border-spacing: 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: 930px;" border="0">
<tbody>
<tr>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span> i = 0;
<span style="color: #0000ff;">while</span> (i &lt; 10) {
    <span style="color: #008000;">// statements to be repeated</span>
    i++;
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">for</span> (<span style="color: #2b91af;">int</span> i = 0; i &lt; 10; i++) {
    <span style="color: #008000;">// statements to be repeated</span>
}<br /><br /></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;"><span style="color: #000000;">Use a&nbsp;<strong>for</strong>&nbsp;loop when you need a simple counter to move from one value to another through the loop or when you know the number of iterations you need to perform. Use a&nbsp;<strong>while</strong>&nbsp;loop when you are not sure about the number of iterations you need to perform.</span></p>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;"><span style="color: #000000;"><strong>Q.&nbsp;</strong>What do the following loops do?</span></p>
<table style="font-size: 16px; max-width: 100%; border-spacing: 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: 930px;" border="0">
<tbody>
<tr>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">while</span> (<span style="color: #0000ff;">true</span>) {
    <span style="color: #008000;">// statements to be repeated</span>
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
<td style="padding: 2px; width: 461px;">
<div style="background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #0000ff;">for</span> (;;) {
    <span style="color: #008000;">// statements to be repeated</span>
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</td>
</tr>
</tbody>
</table>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;"><span style="color: #000000;"><strong>A.&nbsp;</strong>Both loops are infinite loops. An infinite loop is a loop that executes the body of the loop endlessly. Be careful of infinite loops as they might cause your program to crash!</span></p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45;"><span style="color: #000000;">Break statement</span></h2>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;">&nbsp;</p>
<figure style="margin: 1em 0px; text-align: center;"></figure>
<p>&nbsp;</p>
<p style="font-size: 16px; margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;"><span style="color: #000000;">Whenever a&nbsp;<strong>break</strong>&nbsp;statement is hit, it will skip to the end of the current block.&nbsp;<strong>break</strong>&nbsp;could be used in the&nbsp;<strong>switch</strong>&nbsp;block, but also in a&nbsp;<strong>for</strong>&nbsp;or&nbsp;<strong>while</strong>&nbsp;loop.&nbsp;</span></p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45;"><span style="color: #000000;">Break statement with nested loops</span></h2>
<p><span style="background-color: transparent; color: var(--black-800); font-family: var(--ff-mono); font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; white-space: inherit; font-size: 13px;">file:///</span>C:\Users\OEM\Documents\MYC-CloudOnPrem-Home\COMSCI718\screen_grabs_notes\module-1\Screenshot 2022-03-09 102658.png</p>
<p><span style="font-family: var(--ff-mono); color: var(--black-800); font-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inherit; font-weight: inherit; white-space: inherit; background-color: transparent; font-size: 13px;">file:///</span>C:\Users\OEM\Documents\MYC-CloudOnPrem-Home\COMSCI718\screen_grabs_notes\module-1\<span style="font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Oxygen, Ubuntu, Cantarell, Open Sans, Helvetica Neue, sans-serif;"><code></code>Screenshot 2022-03-09 104929.jpg</span></p>
</div>',3,'',14,'drcuoa',2,'1','Module 3.5 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-5-repetition?module_item_id=1406324'),
 (66,'Math is FUN - Factorial','<p style="min-width: 150px; color: #333333; font-family: Verdana, Arial, Tahoma, sans-serif; font-size: 15px; background-color: #e5f1ff;">The&nbsp;<strong>factorial function</strong>&nbsp;(symbol:&nbsp;<strong><span style="font-size: xx-small;">!</span></strong>) says to&nbsp;<strong>multiply all whole numbers</strong>&nbsp;from our chosen number down to 1.</p>
<p style="min-width: 150px; color: #333333; font-family: Verdana, Arial, Tahoma, sans-serif; font-size: 15px; background-color: #e5f1ff;">Examples:</p>
<div class="bigul">
<ul>
<li style="color: var(--b4clr); list-style-type: disc; padding-bottom: 7px;"><strong>4!</strong>&nbsp;= 4 &times; 3 &times; 2 &times; 1 = 24</li>
<li style="color: var(--b4clr); list-style-type: disc; padding-bottom: 7px;"><strong>7!</strong>&nbsp;= 7 &times; 6 &times; 5 &times; 4 &times; 3 &times; 2 &times; 1 = 5040</li>
<li style="color: var(--b4clr); list-style-type: disc; padding-bottom: 7px;"><strong>1!</strong>&nbsp;= 1</li>
</ul>
</div>',1,'',14,'drcuoa',2,'1','Factorial example','https://www.mathsisfun.com/numbers/factorial.html'),
 (67,'Math is FUN - Modulo (Modulus) Calculator','<p>30 % 9 = 3</p>',1,'',14,'drcuoa',2,'1','Online Calculator ','https://www.omnicalculator.com/math/modulo'),
 (68,'Switch','<h1 class="page-title" style="margin: 15px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: 200; line-height: 1.5; text-rendering: optimizelegibility; font-size: 2.5em; color: #666666; background-color: #ffffff;">Switch</h1>
<p>&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">When you have a conditional block of the form &ldquo;if x == a do something, else if x == b do something else, else if x == c do another thing&hellip;&rdquo;, you can use the&nbsp;<strong style="font-weight: bold;">switch / case</strong>&nbsp;block as an alternative. The&nbsp;<strong style="font-weight: bold;">switch / case&nbsp;</strong>block can be used to compare values with the equality operator&nbsp;<strong style="font-weight: bold;">==</strong>. Note that the&nbsp;<strong style="font-weight: bold;">switch / case</strong>&nbsp;block works with String and primitive types such as char and int.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Remember to include BREAK statements</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Video on canvas page.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</p>',3,'',14,'drcuoa',2,'1','Module 3.7 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-7-switch?module_item_id=1406326'),
 (69,'Module 3 Control Flow','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In this module,&nbsp;you will learn to define different Boolean expressions and use them to implement control structures in Java.&nbsp;You will also learn to implement repetition using while and for loops. Moreover, you will learn how to control the flow of a program using statements such as break and continue.</p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">This module''s objectives</h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">By the end of this module, you should be able to:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li>evaluate different Boolean expressions, including recognising logical and relational operators, and their order of precedence</li>
<li>differentiate between reference equality and value equality</li>
<li>implement different control structures in a program using if, if-else and switch statements</li>
<li>implement repetition using while and for loops in a program</li>
<li>explain the differences between break, continue and return statements.</li>
</ul>',3,'',14,'drcuoa',2,'1','Module 3.1 CP','https://canvas.auckland.ac.nz/courses/72041/pages/3-dot-1-this-modules-focus?module_item_id=1406320'),
 (70,'How To Compare Characters In Java','<div class="post hentry uncustomized-post-template" style="margin: 0px; padding: 20px; border-width: 0px 1px; border-image: initial; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; background: center bottom repeat-x scroll #ffffff; color: #333333; border-color: initial #ffffff initial #ffffff; border-style: initial solid initial solid;">
<div id="post-body-6406822360122749565" class="post-body entry-content" style="margin: 0px; padding: 5px 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: 18px; line-height: 22px; font-family: Arial, Tahoma, Verdana; vertical-align: baseline; color: #2f2e2e; overflow-wrap: break-word;">In this tutorial, I will be sharing how to compare characters in&nbsp;<a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600; text-decoration-line: none;" href="https://javahungry.blogspot.com/2021/05/core-java-tutorial.html" target="_blank" rel="noopener">java</a>. Characters can be a&nbsp;<a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600; text-decoration-line: none;" href="https://javahungry.blogspot.com/2021/10/char-to-character.html" target="_blank" rel="noopener">char primitive data type or Character wrapper class</a>. Let''s dive deep into the topic:&nbsp;<br /><br /><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #990000;"><em><strong>Read Also:&nbsp;</strong></em><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: black;">&nbsp;<a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600; text-decoration-line: none;" href="https://javahungry.blogspot.com/2013/12/first-non-repeated-character-in-string-java-program-code-example.html" target="_blank" rel="noopener">Find the first non-repeated character in the String</a></span></span><br />
<h2 style="margin: 25px 0px 15px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 30px; line-height: 36px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #a41600;"><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #38761d;"><strong>1. Comparing char primitives</strong></span></h2>
<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 24px; line-height: 22px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #333333;"><strong>1.&nbsp;&nbsp; Using &lt;, &gt;, ==&nbsp; operators</strong></h3>
Based on the Unicode table, the char primitive data type also has the associated integer value. Using ==, &lt;,&nbsp; &gt; operators you should be able to compare two characters just like you compare two integers.<br /><br />
<div style="margin: 0px; padding: 20px 10px; border: 1px solid #ceebce; font: inherit; vertical-align: baseline; background: 25px 25px #dff7df;"><strong>Note:</strong>&nbsp; Comparing char primitive values using &lt; , &gt; or == operators returns a boolean value.</div>
<br /><strong>Example:</strong><br /><br />
<div style="margin: 0px; padding: 0.2em 0.6em; border: 1px dotted; font: inherit; vertical-align: baseline; background: #f3f3f3; overflow: auto; width: auto;">
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">class</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #bb0066;">JavaHungry</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">static</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">void</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #0066bb;">main</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>String args<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">[])</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch1 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''A''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch2 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''B''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch3 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''A''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">==</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">&lt;</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">==</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span>
<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span></pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<br /><strong>Output:</strong><br /><a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600;" name="more"></a><strong>false<br />true<br />true</strong><br /><br />
<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 24px; line-height: 22px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #333333;"><strong>2. Using Character.compare(char x, char y)</strong></h3>
We can compare the char values numerically by using compare(char x, char y) method of Character class.<br /><br />
<div style="margin: 0px; padding: 20px 10px; border: 1px solid #ceebce; font: inherit; vertical-align: baseline; background: 25px 25px #dff7df;"><strong>Note:</strong>&nbsp; Comparing char primitive values using Character.compare(char x, char y) method returns an integer value.</div>
<br /><br />According to&nbsp;<a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600; text-decoration-line: none;" href="https://docs.oracle.com/javase/7/docs/api/java/lang/Character.html#compare(char,%20char)" target="_blank" rel="noopener">Java docs</a>,<br />The compare(char a, char b) method of Character class returns the following values:<br />0, if (a == b)<br />value less than 0, if a &lt; b<br />value greater than 0, if a &gt; b<br /><br />Example:<br /><br />
<div style="margin: 0px; padding: 0.2em 0.6em; border: 1px dotted; font: inherit; vertical-align: baseline; background: #f3f3f3; overflow: auto; width: auto;">
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">class</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #bb0066;">JavaHungry</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">static</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">void</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #0066bb;">main</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>String args<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">[])</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch1 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch2 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''Y''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">char</span> ch3 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">;</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span>
<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span></pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<br /><strong>Output:</strong><br /><strong>-1<br />1<br />0</strong><br />
<h2 style="margin: 25px 0px 15px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 30px; line-height: 36px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #a41600;"><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #38761d;"><strong>2. Comparing Character objects</strong></span></h2>
You can compare Character class objects:<br /><br />
<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 24px; line-height: 22px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #333333;"><strong>1. Using Character.compare(char x, char y)</strong></h3>
Using Character class constructor, we can convert the char primitive value to the Character object.<br /><br />
<div style="margin: 0px; padding: 0.2em 0.6em; border: 1px dotted; font: inherit; vertical-align: baseline; background: #f3f3f3; overflow: auto; width: auto;">
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">class</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #bb0066;">JavaHungry</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">static</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">void</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #0066bb;">main</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>String args<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">[])</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
      Character ch1 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      Character ch2 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''Y''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      Character ch3 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>&nbsp;</pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;">      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">compare</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">,</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span></pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;">&nbsp;<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span>
<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span></pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<br /><strong>Output:</strong><br /><strong>1</strong><br /><strong>0</strong><br /><strong>-1</strong><br /><br />
<h3 style="margin: 0px 0px 10px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: normal; font-stretch: inherit; font-size: 24px; line-height: 22px; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; color: #333333;"><strong>2. Using equals() method</strong></h3>
Using equals() method also we can compare the Character class objects.<br /><br />
<div style="margin: 0px; padding: 20px 10px; border: 1px solid #ceebce; font: inherit; vertical-align: baseline; background: 25px 25px #dff7df;"><strong>Note:</strong>&nbsp;Comparing Character class objects using equals() method returns a boolean value.</div>
<br /><br />
<div style="margin: 0px; padding: 0.2em 0.6em; border: 1px dotted; font: inherit; vertical-align: baseline; background: #f3f3f3; overflow: auto; width: auto;">
<pre style="margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: 22.5px; font-family: inherit; vertical-align: baseline; position: relative;"><span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">class</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #bb0066;">JavaHungry</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">public</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">static</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #333399;">void</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #0066bb;">main</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>String args<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">[])</span> <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">{</span>
      Character ch1 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      Character ch2 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''Y''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      Character ch3 <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">=</span> <span style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: #008800;">new</span> Character<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0044dd;">''X''</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">);</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">equals</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch2<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">equals</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
      System<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">out</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">println</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch1<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">.</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #0000cc;">equals</span><span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">(</span>ch3<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">));</span>
    <span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span>
<span style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #333333;">}</span></pre>
<div class="open_grepper_editor" style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<br /><strong>Output:</strong><br /><strong>false</strong><br /><strong>false</strong><br /><strong>true</strong><br /><br />That''s all for today, please mention in comments in case you have any questions related to how to compare characters in java.
<div style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; clear: both;">&nbsp;</div>
</div>
</div>
<div class="author-box" style="margin: 0px 0px 20px; padding: 20px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 14px; line-height: inherit; font-family: ''open sans'', Arial, Helvetica, sans-serif; vertical-align: baseline; overflow: hidden; color: #333333; background-color: #ffffff;">
<p style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 22px; vertical-align: baseline;"><strong>About The Author</strong></p>
<div style="margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: Arial, Helvetica, Tahoma, sans-serif; vertical-align: baseline; text-align: justify;">Subham Mittal has worked in Oracle for 3 years.<br />Enjoyed this post? Never miss out on future posts by&nbsp;<a style="margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; color: #a41600; text-decoration-line: none;" href="https://follow.it/java-hungry?action=followPub" target="_blank" rel="nofollow noopener">subscribing JavaHungry</a></div>
</div>',1,'Programming for Industry',14,'drcuoa',2,'3','Java Hungry Blog Page','https://javahungry.blogspot.com/2020/04/compare-characters-java.html'),
 (71,'Fix Report','<p>The validation middleware needs to run on each route.&nbsp; So a page response is also preceded by a call to check if the client browser has a valid user token.&nbsp; Need to update all routes for this.</p>',0,'Programming with Web Technologies',7,'drcuoa',2,'2','',''),
 (72,'Example of basic Java Class with Public and Private Methods','<p><code>package ictgradschool.industry.controlflow.guessing;</code></p>
<p><code>public class exampleClass {</code></p>
<p><code>&nbsp; &nbsp; // Static method</code></p>
<p><code>&nbsp; &nbsp; static void myStaticMethod() {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Static methods can be called without creating objects");</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>&nbsp; &nbsp; // Public method</code></p>
<p><code>&nbsp; &nbsp; public void myPublicMethod() {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Public methods must be called by creating objects");</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>&nbsp; &nbsp; // Main method</code></p>
<p><code>&nbsp; &nbsp; public static void main(String[] args) {</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; myStaticMethod(); // Call the static method</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; exampleClass myObj = new exampleClass(); // Create an object of exampleClass</code></p>
<p><code>&nbsp; &nbsp; &nbsp; &nbsp; myObj.myPublicMethod(); // Call the public method</code></p>
<p><code>&nbsp; &nbsp; }</code></p>
<p><code>}</code></p>',1,'Programming for Industry',13,'drcuoa',2,'1','w3 School Page','https://www.w3schools.com/java/java_class_methods.asp'),
 (73,'Class Object simple example','<p><span style="color: #000000;"><code>class Dog {</code></span></p>
<p><span style="color: #000000;"><code>&nbsp; &nbsp; int age = 5;</code></span></p>
<p>&nbsp;</p>
<p><span style="color: #000000;"><code>&nbsp; &nbsp; public static void main(String[]args) {</code></span></p>
<p>&nbsp;</p>
<p><span style="color: #000000;"><code>&nbsp; &nbsp; &nbsp; &nbsp; Dog myObj = new Dog();</code></span></p>
<p><span style="color: #000000;"><code>&nbsp; &nbsp; &nbsp; &nbsp; System.out.println(myObj.age);</code></span></p>
<p><span style="color: #000000;"><code>&nbsp; &nbsp; }</code></span></p>
<p><span style="color: #000000;"><code>}</code></span></p>',1,'Programming for Industry',13,'drcuoa',2,'1','',''),
 (74,'Guessing Game Module 3 Lab Exercise 6','<p><code><span style="font-size: 10pt;">package ictgradschool.industry.controlflow.guessing;</span></code></p>
<p><code><span style="font-size: 10pt;">import ictgradschool.Keyboard;</span></code></p>
<p><code><span style="font-size: 10pt;">/**</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp;* A guessing game!</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp;*/</span></code></p>
<p><code><span style="font-size: 10pt;">public class GuessingGame {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; public void start() {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; // TODO Write your code here.</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; /* pseudo code</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp;1. generate a random number between 0 and 100, and store this in a variable named ''goal''</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp;2. declare a variable named ''Guess''</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp;3. initialise guess to 0</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp;4. while user''s guess is != goal:</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp;a. Ask user to enter their guess.</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp;b. Store the guess in the guess variable.</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp;c. If the guess is greater than the goal, print ''Too High,Try Again".</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp;d. If the guess is less than the goal, print ''Too Low, Try Again".</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp; &nbsp; &nbsp;e. Else print the message ''Perfect'';</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*&nbsp; &nbsp;5. print "Goodbye"</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; int goal = getGoal();</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; int attempts = 0;</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; boolean result = false;</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; while (!result) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int guess = getUserGuess();</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; attempts++;</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (attempts == 1) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.println("You''ve had " + attempts + " attempt so far.");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.println("You''ve had " + attempts + " attempts so far.");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; // build the suspense with a simple loop :-)</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.print("Are you correct this time? Checking ");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; for (int i =0; i &lt; 3; i++) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.print(".");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sleep(1);}</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (goal == guess) result = true;</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else if (guess &gt; goal) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Too High, Try Again");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } else</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Too Low, Try Again");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Perfect! " + "you took " + attempts + " attempts to guess the number, good job!");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; // generate the random between 0 and 100 inclusive and return result .</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; private int getGoal() {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; return (int) (Math.random() * 100) + 1;</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; // prompt for and return user guess integer:</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; private int getUserGuess() {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; System.out.println("Guess an integer:");</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; return Integer.parseInt(Keyboard.readInput());</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; private void sleep(int seconds) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; try {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Thread.sleep(seconds * 1000);</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; } catch (InterruptedException ex) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ex.printStackTrace();</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; /**</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp;* Program entry point. Do not edit.</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp;*/</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; public static void main(String[] args) {</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; GuessingGame ex = new GuessingGame();</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; &nbsp; &nbsp; ex.start();</span></code></p>
<p><code><span style="font-size: 10pt;">&nbsp; &nbsp; }</span></code></p>
<p><code><span style="font-size: 10pt;">}</span></code></p>
<p>&nbsp;</p>',3,'Programming for Industry',14,'drcuoa',2,'3','',''),
 (75,'3.9 Activity: Module 3 Control Quiz','<header class="quiz-header" style="border-bottom: 1px solid #a4a4a4; overflow: hidden; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<h1 id="quiz_title" style="margin: 0px 0px 6px; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">&nbsp;Flow Self Assessment Quiz</h1>
<div class="row-fluid" style="width: 838px;">
<div id="quiz_details_wrapper" data-submitted-count=""></div>
</div>
<div class="row-fluid" style="width: 838px;">
<ul id="quiz_student_details" style="padding: 0.5em 0.25em; margin: 0px 0px 1em; list-style: none; border-top: 1px solid #bbbbbb; border-bottom: 1px solid #bbbbbb; width: 838px; font-size: 1.1em;">
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Due</span>&nbsp;<span class="value" style="padding-right: 2.5em;">No due date</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Points</span>&nbsp;<span class="value" style="padding-right: 2.5em;">6</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Questions</span>&nbsp;<span class="value" style="padding-right: 2.5em;">6</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Time limit</span>&nbsp;<span class="value" style="padding-right: 2.5em;">None</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Allowed attempts</span>&nbsp;<span class="value" style="padding-right: 2.5em;">Unlimited</span></li>
</ul>
<h2 style="margin: 0px 0px 6px; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">Instructions</h2>
<div class="description user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto;">
<p style="margin: 12px 0px;"><strong>Purpose</strong>: Getting regular feedback on your progress is an important part of your overall learning. This self-check will allow you to revisit key concepts from this week&rsquo;s learning materials so you can identify the areas you need to focus on in more detail.&nbsp;&nbsp;</p>
<p style="margin: 12px 0px;">It is not assessed or reviewed by your tutor and you will receive your results upon submission. There is no time limit and you can complete it as many times as you wish.&nbsp;</p>
<p style="margin: 12px 0px;"><strong>Task</strong>:&nbsp;Complete the questions and select ''Submit Quiz'' to check your answers.</p>
</div>
</div>
<div class="take_quiz_button" style="text-align: center; margin-top: 20px; font-size: 1.3em;"><a id="take_quiz_link" class="btn btn-primary" style="color: #ffffff; text-decoration-line: none; outline: transparent solid 0.125rem; background: #0770a3; border: 1px solid #043e5a; border-radius: 3px; transition: background-color 0.2s ease-in-out 0s; display: inline-block; position: relative; padding: 8px 14px; margin-bottom: 0px; font-size: 1rem; line-height: 20px; vertical-align: middle; cursor: pointer; overflow: hidden; text-shadow: none; user-select: none;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89561/take?user_id=334869" data-method="post">Take the quiz again</a></div>
<div id="quiz-submission-version-table" style="margin: 30px 0px 20px; height: auto; opacity: 1;">
<div class="desc">
<h3 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em;">Attempt history</h3>
</div>
<table class="ic-Table ic-Table--condensed" style="max-width: 100%; background-color: transparent; width: 838px; border-spacing: 0px;" summary="A table that shows your quiz attempt history. Each attempt is on the left side. The attempt, time, and score are across the top.">
<thead>
<tr>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">&nbsp;</td>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Attempt</th>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Time</th>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Score</th>
</tr>
</thead>
<tbody>
<tr class="kept">
<th class="ic-Table--header-row" style="padding: 7px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;" scope="row">KEPT</th>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;"><a style="outline: transparent solid 0.125rem;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89561/history?version=2">Attempt 2</a></td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">less than 1 minute</td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">6 out of 6</td>
</tr>
<tr class="">
<th class="ic-Table--header-row" style="padding: 7px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;" scope="row">LATEST</th>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;"><a style="outline: transparent solid 0.125rem;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89561/history?version=2">Attempt 2</a></td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">less than 1 minute</td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">6 out of 6</td>
</tr>
<tr class="">
<th class="ic-Table--header-row" style="padding: 7px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;" scope="row">&nbsp;</th>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;"><a style="outline: transparent solid 0.125rem;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89561/history?version=1">Attempt 1</a></td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">2 minutes</td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">3 out of 6</td>
</tr>
</tbody>
</table>
</div>
</header>
<div id="direct-share-mount-point" style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"></div>
<div class="quiz-submission " style="background: #ffffff; border: 1px solid #ffffff; padding: 16px; font-size: 16px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;">
<div>Submitted 10 Mar at 14:11</div>
<div id="questions" class="assessment_results  show_correct_answers" style="clear: both;">
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699039"></a>
<div id="question_1699039" class="display_question question multiple_answers_question  correct" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 1</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699039_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">
<ol style="padding: 0px; margin: 0px 0px 6px 25px;">
<li>Which of the following statements evaluate to true?</li>
</ol>
<p style="margin: 12px 0px; padding-left: 40px;">Given&nbsp; &nbsp;<strong>int i = 10; int j = 20;</strong></p>
</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_1256" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="i &lt; j;. You selected this answer. This was the correct answer."><span id="answer_1256_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-1256" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699039" type="checkbox" aria-disabled="true" aria-describedby="answer_1256_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">i &lt; j;</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-1256"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-1256">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_5177" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="i == 20;.">
<div class="select_answer answer_type"><input id="answer-5177" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699039" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">i == 20;</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-5177"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-5177">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_1466" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="i &gt; j &amp;&amp; i == 10;.">
<div class="select_answer answer_type"><input id="answer-1466" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699039" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">i &gt; j &amp;&amp; i == 10;</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-1466"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-1466">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_2637" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="i &gt; j || i == 10;. You selected this answer. This was the correct answer."><span id="answer_2637_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-2637" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699039" type="checkbox" aria-disabled="true" aria-describedby="answer_2637_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">i &gt; j || i == 10;</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-2637"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-2637">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699040"></a>
<div id="question_1699040" class="display_question question true_false_question  correct" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 2</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699040_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;"><strong>for( ; ; ) { ... }</strong>&nbsp;is the same as&nbsp;<strong>while(true) {...}</strong></div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_7542" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="True. You selected this answer. This was the correct answer."><span id="answer_7542_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-7542" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699040" type="radio" aria-disabled="true" aria-describedby="answer_7542_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7542"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7542">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_3" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="False.">
<div class="select_answer answer_type"><input id="answer-3" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699040" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699041"></a>
<div id="question_1699041" class="display_question question multiple_answers_question  correct" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 3</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699041_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">Which of the following is an infinite loop?</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_9682" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="A loop that executes exactly 10 times.">
<div class="select_answer answer_type"><input id="answer-9682" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699041" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">A loop that executes exactly 10 times</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9682"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9682">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_9812" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="The condition of the loop never evaluates to false. You selected this answer. This was the correct answer."><span id="answer_9812_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-9812" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699041" type="checkbox" aria-disabled="true" aria-describedby="answer_9812_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">The condition of the loop never evaluates to false</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9812"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9812">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699042"></a>
<div id="question_1699042" class="display_question question true_false_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 4</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699042_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">Every&nbsp;<strong>for</strong>&nbsp;loop can be written as a&nbsp;<strong>while</strong>&nbsp;loop.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_7057" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="True. You selected this answer. This was the correct answer."><span id="answer_7057_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-7057" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699042" type="radio" aria-disabled="true" aria-describedby="answer_7057_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7057"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7057">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_9481" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="False.">
<div class="select_answer answer_type"><input id="answer-9481" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699042" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9481"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9481">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699043"></a>
<div id="question_1699043" class="display_question question true_false_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 5</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699043_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">The&nbsp;<strong>break</strong>&nbsp;statement and the&nbsp;<strong>return</strong>&nbsp;statement can be used interchangeably to end the current iteration of a loop.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_930" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="True.">
<div class="select_answer answer_type"><input id="answer-930" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699043" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-930"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-930">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_9566" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="False. You selected this answer. This was the correct answer."><span id="answer_9566_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-9566" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699043" type="radio" aria-disabled="true" aria-describedby="answer_9566_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9566"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9566">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699044"></a>
<div id="question_1699044" class="display_question question true_false_question  correct" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 6</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699044_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">The&nbsp;<strong>continue</strong>&nbsp;statement is used to exit the loop completely</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_3787" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="True.">
<div class="select_answer answer_type"><input id="answer-3787" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699044" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3787"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3787">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_6729" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="False. You selected this answer. This was the correct answer."><span id="answer_6729_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-6729" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699044" type="radio" aria-disabled="true" aria-describedby="answer_6729_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6729">&nbsp;</label></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>',3,'Programming for Industry',14,'drcuoa',2,'1','Module 3.9 CP','https://canvas.auckland.ac.nz/courses/72041/quizzes/89561?module_item_id=1406328'),
 (76,'2.6 Activity: Module 2 OOP Quiz','<header class="quiz-header" style="border-bottom: 1px solid #a4a4a4; overflow: hidden; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<h1 id="quiz_title" style="margin: 0px 0px 6px; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">&nbsp;Self Assessment Quiz</h1>
<div class="row-fluid" style="width: 838px;">
<div id="quiz_details_wrapper" data-submitted-count=""></div>
</div>
<div class="row-fluid" style="width: 838px;">
<ul id="quiz_student_details" style="padding: 0.5em 0.25em; margin: 0px 0px 1em; list-style: none; border-top: 1px solid #bbbbbb; border-bottom: 1px solid #bbbbbb; width: 838px; font-size: 1.1em;">
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Due</span>&nbsp;<span class="value" style="padding-right: 2.5em;">No due date</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Points</span>&nbsp;<span class="value" style="padding-right: 2.5em;">6</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Questions</span>&nbsp;<span class="value" style="padding-right: 2.5em;">6</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Time limit</span>&nbsp;<span class="value" style="padding-right: 2.5em;">None</span></li>
&nbsp;
<li style="display: inline-block;"><span class="title" style="font-weight: bold; margin-right: 2px;">Allowed attempts</span>&nbsp;<span class="value" style="padding-right: 2.5em;">Unlimited</span></li>
</ul>
<h2 style="margin: 0px 0px 6px; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">Instructions</h2>
<div class="description user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto;">
<p style="margin: 12px 0px;"><strong>Purpose</strong>: Getting regular feedback on your progress is an important part of your overall learning. This self-check will allow you to revisit key concepts from this week&rsquo;s learning materials so you can identify the areas you need to focus on in more detail.&nbsp;&nbsp;</p>
<p style="margin: 12px 0px;">It is not assessed or reviewed by your tutor and you will receive your results upon submission. There is no time limit and you can complete it as many times as you wish.&nbsp;</p>
<p style="margin: 12px 0px;"><strong>Task</strong>:&nbsp;Complete the questions and select ''Submit Quiz'' to check your answers.</p>
</div>
</div>
<div class="take_quiz_button" style="text-align: center; margin-top: 20px; font-size: 1.3em;"><a id="take_quiz_link" class="btn btn-primary" style="color: #ffffff; text-decoration-line: none; outline: transparent solid 0.125rem; background: #0770a3; border: 1px solid #043e5a; border-radius: 3px; transition: background-color 0.2s ease-in-out 0s; display: inline-block; position: relative; padding: 8px 14px; margin-bottom: 0px; font-size: 1rem; line-height: 20px; vertical-align: middle; cursor: pointer; overflow: hidden; text-shadow: none; user-select: none;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89562/take?user_id=334869" data-method="post">Take the quiz again</a></div>
<div id="quiz-submission-version-table" style="margin: 30px 0px 20px; height: auto; opacity: 1;">
<div class="desc">
<h3 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em;">Attempt history</h3>
</div>
<table class="ic-Table ic-Table--condensed" style="max-width: 100%; background-color: transparent; width: 838px; border-spacing: 0px;" summary="A table that shows your quiz attempt history. Each attempt is on the left side. The attempt, time, and score are across the top.">
<thead>
<tr>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">&nbsp;</td>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Attempt</th>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Time</th>
<th style="padding: 7px 7px 3.5px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #a5afb5;" scope="col">Score</th>
</tr>
</thead>
<tbody>
<tr class="">
<th class="ic-Table--header-row" style="padding: 7px; line-height: 1.3; text-align: left; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;" scope="row">LATEST</th>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;"><a style="outline: transparent solid 0.125rem;" href="https://canvas.auckland.ac.nz/courses/72041/quizzes/89562/history?version=1">Attempt 1</a></td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">4 minutes</td>
<td style="padding: 7px; line-height: 1.3; vertical-align: middle; border-bottom: 1px solid #c7cdd1; font-size: 0.875rem;">5 out of 6</td>
</tr>
</tbody>
</table>
</div>
</header>
<div id="direct-share-mount-point" style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"></div>
<div class="quiz-submission " style="background: #ffffff; border: 1px solid #ffffff; padding: 16px; font-size: 16px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif;">
<div>Submitted 8 Mar at 11:31</div>
<div id="questions" class="assessment_results  show_correct_answers" style="clear: both;">
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699045"></a>
<div id="question_1699045" class="display_question question true_false_question  correct" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 1</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699045_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">All methods must be public. You cannot have private methods.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_7449" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="True.">
<div class="select_answer answer_type"><input id="answer-7449" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699045" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7449"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7449">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_9296" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="False. You selected this answer. This was the correct answer."><span id="answer_9296_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-9296" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699045" type="radio" aria-disabled="true" aria-describedby="answer_9296_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9296"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9296">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699046"></a>
<div id="question_1699046" class="display_question question multiple_answers_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 2</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699046_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">Which of the following method signature(s) are correct?</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_6297" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="public void printNum(num).">
<div class="select_answer answer_type"><input id="answer-6297" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699046" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public void printNum(num)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6297"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6297">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_3792" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="public void printNum(int num). You selected this answer. This was the correct answer."><span id="answer_3792_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-3792" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699046" type="checkbox" aria-disabled="true" aria-describedby="answer_3792_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public void printNum(int num)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3792"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3792">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_9728" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="public void printNum(). You selected this answer. This was the correct answer."><span id="answer_9728_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-9728" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699046" type="checkbox" aria-disabled="true" aria-describedby="answer_9728_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public void printNum()</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9728"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9728">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_3597" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="public void printNum(String name, int num). You selected this answer. This was the correct answer."><span id="answer_3597_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-3597" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699046" type="checkbox" aria-disabled="true" aria-describedby="answer_3597_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public void printNum(String name, int num)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3597"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3597">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699047"></a>
<div id="question_1699047" class="display_question question true_false_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 3</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699047_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">A method that returns a value must have at least one return statement inside.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_5660" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="True. You selected this answer. This was the correct answer."><span id="answer_5660_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-5660" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699047" type="radio" aria-disabled="true" aria-describedby="answer_5660_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-5660"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-5660">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_6766" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="False.">
<div class="select_answer answer_type"><input id="answer-6766" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699047" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6766"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6766">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699048"></a>
<div id="question_1699048" class="display_question question true_false_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 4</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699048_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">The method&nbsp;<strong>indexOf</strong>&nbsp;in the String class is an example of a void method.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_9932" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="True.">
<div class="select_answer answer_type"><input id="answer-9932" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699048" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9932"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9932">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_3283" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="False. You selected this answer. This was the correct answer."><span id="answer_3283_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-3283" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699048" type="radio" aria-disabled="true" aria-describedby="answer_3283_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3283"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-3283">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699049"></a>
<div id="question_1699049" class="display_question question true_false_question  correct   " style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2">Question 5</span>
<div class="user_points">1&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699049_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">The method&nbsp;<strong>indexOf</strong>&nbsp;in the String class is an example of a static method.</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_9385" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="True.">
<div class="select_answer answer_type"><input id="answer-9385" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699049" type="radio" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">True</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9385"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-9385">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_878" class="answer answer_for_
         
         
         
         
         selected_answer correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="False. You selected this answer. This was the correct answer."><span id="answer_878_arrow" class="answer_arrow correct" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -34px; color: #ffffff; left: -128px; top: 5px;">Correct!</span>
<div class="select_answer answer_type"><input id="answer-878" class="question_input" style="margin-top: 4px; margin-right: 0px; margin-left: 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" checked="checked" disabled="disabled" name="question-1699049" type="radio" aria-disabled="true" aria-describedby="answer_878_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">False</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-878"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-878">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div class="after_answers">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
</div>
<div id="" class="quiz_sortable question_holder " style="position: relative;" role="region" aria-label="Question" data-group-id="">
<div style="height: 1px; overflow: hidden;">&nbsp;</div>
<a style="color: var(--ic-link-color); text-decoration-line: underline; outline: transparent solid 0.125rem;" name="question_1699050"></a>
<div id="question_1699050" class="display_question question multiple_answers_question   incorrect unanswered" style="border: 1px solid #aaaaaa; position: relative; min-height: 50px; margin: 0.7em auto 30px; min-width: 415px; width: 643.188px;">
<div class="header" style="font-size: 1.2em; font-weight: bold; border-bottom: 1px solid #aaaaaa; background-color: #f5f5f5; padding: 8px 20px; margin: 0px; overflow: auto;"><span class="name question_name" style="display: inline-block; padding-top: 5px;" role="heading" aria-level="2" aria-describedby="user_answer_NaN_arrow"><span id="user_answer_NaN_arrow" class="answer_arrow incorrect" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(0, 0, 0, 0.5) 0px -1px 0px; background-position: left -62px; color: #ffffff; left: -108px; top: 9px;">Unanswered</span>Question 6</span>
<div class="user_points">0&nbsp;<span class="points question_points">/ 1</span>&nbsp;pts</div>
</div>
<div class="text" style="clear: left; padding: 5px 20px 20px;">
<div id="question_1699050_question_text" class="question_text user_content enhanced jqueryUIWidgetized" style="position: relative; min-height: 5px; max-width: 100%; overflow-x: auto; margin-top: 1.5em; margin-bottom: 1.5em;">
<p style="margin: 12px 0px;">Assume you have written a method with the following method signature:</p>
<p style="margin: 12px 0px;"><strong>public String myMethod(int num)</strong></p>
<p style="margin: 12px 0px;">Which of the following method signature(s) will not cause a compile error if we were to create multiple methods within the same class? Select all that apply.</p>
</div>
<div class="answers">
<div class="answers_wrapper" style="position: relative;">
<div id="answer_4968" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="public void myMethod(int num).">
<div class="select_answer answer_type"><input id="answer-4968" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699050" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public void myMethod(int num)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-4968"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-4968">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_7464" class="answer answer_for_
         
         
         
         
          correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="public String myMethod(). This was the correct answer."><span id="answer_7464_arrow" class="answer_arrow info" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(255, 255, 255, 0.5) 0px -1px 0px; background-position: left -90px; color: #333333; left: -128px; top: 5px;">Correct answer</span>
<div class="select_answer answer_type"><input id="answer-7464" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699050" type="checkbox" aria-disabled="true" aria-describedby="answer_7464_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public String myMethod()</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7464"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-7464">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_6075" class="answer answer_for_
         
         
         
         
          " style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; clear: both; margin: 0px 0px 8px; position: relative; opacity: 0.7;" title="public String myMethod(int random).">
<div class="select_answer answer_type"><input id="answer-6075" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699050" type="checkbox" aria-disabled="true" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public String myMethod(int random)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6075"><label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-6075">&nbsp;</label></label>
<div class="answer_html" style="display: inline-block;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
</div>
<div class="clear" style="clear: both;">&nbsp;</div>
<div id="answer_932" class="answer answer_for_
         
         
         
         
          correct_answer" style="border-top: 1px solid #dddddd; padding: 8px 30px 0px; background: none; clear: both; margin: 0px 0px 8px; position: relative; opacity: 1;" title="public String myMethod(double num). This was the correct answer."><span id="answer_932_arrow" class="answer_arrow info" style="background-image: url(''dist/images/answers_sprite_hc-44b386cf85.png''); background-repeat: repeat-x; display: inline-block; font-size: 0.875rem; font-weight: bold; line-height: 27px; min-width: 96px; padding: 0px 8px; position: absolute; text-align: center; text-shadow: rgba(255, 255, 255, 0.5) 0px -1px 0px; background-position: left -90px; color: #333333; left: -128px; top: 5px;">Correct answer</span>
<div class="select_answer answer_type"><input id="answer-932" class="question_input" style="margin: 4px 0px 0px; font-size: 0.875rem; vertical-align: middle; font-weight: normal; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; width: auto; cursor: not-allowed;" disabled="disabled" name="question-1699050" type="checkbox" aria-disabled="true" aria-describedby="answer_932_arrow" />&nbsp;&nbsp;
<div class="answer_text" style="display: inline-block;">public String myMethod(double num)</div>
<label style="font-size: 0.875rem; line-height: 20px; display: inline-block; margin-bottom: 5px; vertical-align: -4px;" for="answer-932">&nbsp;</label></div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>',3,'Programming for Industry',13,'drcuoa',2,'3','Module 2.6 CP','https://canvas.auckland.ac.nz/courses/72041/quizzes/89562?module_item_id=1406317'),
 (77,'Java API Version 11 SE and JDK Specifications','<h1 class="title" style="font-size: 20px; color: #2c4557; margin: 10px 0px; font-family: ''DejaVu Sans'', Arial, Helvetica, sans-serif; background-color: #ffffff;">Java<sup style="font-size: 8px;">&reg;</sup>&nbsp;Platform, Standard Edition &amp;&nbsp;Java&nbsp;Development&nbsp;Kit<br />Version 11 API Specification</h1>',3,'Programming for Industry',13,'drcuoa',2,'1','Java API','https://docs.oracle.com/en/java/javase/11/docs/api/index.html'),
 (78,'Arrays and Classes','<p><span style="color: #ffffff; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 25.6px; background-color: #ffffff;">Ar</span><span style="background-color: #ffffff; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">In this module,</span><span style="background-color: #ffffff; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">&nbsp;</span><span style="background-color: #ffffff; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">you will learn how to use arrays to store different types of data. You will also construct new classes and create various objects. By the end of this module, you will be able to identify different types of visibility modifiers used in a Java program. You will also be able to explain important object-oriented programming concepts such as abstraction and information hiding.</span></p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">This module''s objectives</h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">By the end of this module, you should be able to:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li>construct arrays of primitive types and object types</li>
<li>use loops to process elements in an array</li>
<li>construct classes, objects and understand the differences between them</li>
<li>describe different types of visibility modifiers used for classes, methods, and variables, and their scope</li>
<li>explain the concepts of abstraction, encapsulation and information hiding</li>
<li>explain how to use the &ldquo;this&rdquo; keyword.</li>
</ul>
<p><span style="color: #ffffff; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 25.6px; background-color: #ffffff;">rays classes</span></p>',3,'Programming for Industry',15,'drcuoa',2,'1','Module 4.1 CP','https://canvas.auckland.ac.nz/courses/72041/pages/4-dot-1-this-modules-focus?module_item_id=1406331'),
 (80,'Arrays','<h1 class="page-title" style="margin: 15px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: 200; line-height: 1.5; text-rendering: optimizelegibility; font-size: 2.5em; color: #666666; background-color: #ffffff;">Arrays</h1>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">An array is a data structure which holds a sequence of variables of the same type. Each variable (known as an element) in an array has an index number (its position in the array). The index number always starts at 0. Each variable can be accessed using its index number. In Java, arrays are objects.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">An array can be visualised as shown in the following diagram. The reference of the array is stored in the variable&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>myNumbers</samp></span>. Every array has a length, which is the number of elements in the array. In this example, the length of the array is 5.</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><img style="max-width: 729px; height: auto; vertical-align: middle; border: 0px;" src="https://canvas.auckland.ac.nz/courses/72041/files/8161216/preview" alt="array of length 5" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161216" data-api-returntype="File" />
<figcaption style="padding: 0.5em;">Array of length five (2021) courtesy of University of Auckland</figcaption>
</figure>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">To declare an array variable, we specify the type of elements which the array is going to hold. It''s then followed by square brackets&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>[]</samp></span>&nbsp;which are followed by the name of the array variable. The syntax for declaring an array is as follows.</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">data_type[] variable_identifier;</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For example, we can declare an array called&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>stringArray</samp></span>&nbsp;that stores a sequence of String elements:</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">String[] stringArray;</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">To initialise an array, we use the keyword&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>new</samp></span>, just as we have done for creating other kinds of objects. However, at the same time, we must specify how many elements we want the array to hold. The syntax for initialising an array is as follows.</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">variable_identifier = new data_type[positive_integer_number];</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">For example, we can initialise the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>stringArray</samp></span>&nbsp;with the length of 10:</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">stringArray = <span style="color: #0000ff;">new</span> String[10];</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can assign each element in the array a value by specifying its index. For example, we can assign values to the first three elements of the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>stringArray</samp></span>&nbsp;as shown in the following code snippet. Note that the index always starts at 0.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">stringArray[0] = <span style="color: #a31515;">"Hello"</span>;
stringArray[1] = <span style="color: #a31515;">"World"</span>;
stringArray[2] = <span style="color: #a31515;">"Hi"</span>;</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can also construct the array and initialise the elements at the same time using an array initialiser statement. As shown in the following example, we create a String array of three elements with the values specified.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">stringArray = <span style="color: #0000ff;">new</span> String[]{<span style="color: #a31515;">"Hello"</span>, <span style="color: #a31515;">"World"</span>, <span style="color: #a31515;">"Hi"</span>};</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">When we create an array, all the elements are initialised automatically to their standard default values. For example, we can create an int array called&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>numbers</samp></span>&nbsp;with the length of 12. The default value for each element in the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>numbers</samp></span>&nbsp;array would be 0.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span>[] numbers = <span style="color: #0000ff;">new</span> <span style="color: #2b91af;">int</span>[12];</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can then assign values to specific elements of the array as shown in the following code.</p>
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">numbers[0] = 10;
numbers[7] = 23;
numbers[11] = 99;</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can visualise the numbers array as follows:</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><img style="max-width: 877px; height: auto; vertical-align: middle; border: 0px;" src="https://canvas.auckland.ac.nz/courses/72041/files/8161214/preview" alt="example of a numbers array of length 12" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161214" data-api-returntype="File" />
<figcaption style="padding: 0.5em;">Example of numbers array of length 12 (2021) courtesy of University of Auckland</figcaption>
</figure>
<h4 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px; color: #2d3b45; background-color: #ffffff;">&nbsp;</h4>',3,'Programming for Industry',15,'drcuoa',2,'1','Module 4.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/4-dot-2-arrays?module_item_id=1406332'),
 (81,'Object Arrays','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">If the variable type is an object type (i.e. a class name), then the array represents a sequence of object variables. Each element of the array would initially contain the value&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>null</samp></span>, which is the default value for any object typed array. For example, we can create a String array called&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>names</samp></span>&nbsp;with the length of 12. The default value for each element in the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>names</samp></span>&nbsp;array would be&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>null</samp></span>. We can then assign values to specific elements of the array as shown in the following code:</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;">String[] names = <span style="color: #0000ff;">new</span> String[12];
names[0] = <span style="color: #a31515;">"Alice"</span>;
names[7] = <span style="color: #a31515;">"Bob"</span>;
names[11] = <span style="color: #a31515;">"Caitlin"</span>;</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We can visualise the&nbsp;<strong>names</strong>&nbsp;array as follows.</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><img style="max-width: 877px; height: auto; vertical-align: middle; border: 0px;" src="https://canvas.auckland.ac.nz/courses/72041/files/8161218/preview" alt="example of a names array" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/72041/files/8161218" data-api-returntype="File" /></figure>',3,'Programming for Industry',15,'drcuoa',2,'1','Module 4.2 CP 2','https://canvas.auckland.ac.nz/courses/72041/pages/4-dot-2-arrays?module_item_id=1406332'),
 (82,'Processing arrays','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Every array has a length property (also known as a field) which indicates the number of elements in the array. The length field of an array can be accessed by using dot notation. Dot notation means using a dot (full stop) to access the behaviour or fields of a given object or class. A dot is the de-referencing operator in Java, which means &ldquo;follow the reference to the actual object&rdquo;. As highlighted in the following example, we use the length of the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>numbers</samp></span>&nbsp;array to access the last element of the array. Note that the last element of the array is always the length of the array minus one.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span>[] numbers = <span style="color: #0000ff;">new</span> <span style="color: #2b91af;">int</span>[12];
numbers[0] = 10;
numbers[7] = 23;
numbers[<span style="background-color: #fbeeb8;">numbers.length</span> - 1] = 99;</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">It is important to understand that each element in an array is the same as a variable of the array type. For example, if we have an element of a String array such as&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>words[3]</samp></span>. We can treat the&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>words[3]</samp></span>&nbsp;as though it were a String variable. That is, we can call the length method on it, or we could append another String to it, or use it any way that a normal String could be used. For example:</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span> size = words[3].length();
String longerWord = words[3] + words[4];</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Similarly, we can add 1 to each element in an&nbsp;<span style="background-color: #eeeeee; padding: 3px;"><samp>int</samp></span>&nbsp;array as follows.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span>[] nums = <span style="color: #0000ff;">new</span> <span style="color: #2b91af;">int</span>[100];
nums[0]++;
nums[1]++;
nums[2]++;
nums[3]++;
<span style="color: #008000;">// code omitted for simplicity</span>
nums[98]++;
nums[99]++;</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Note the repetition in the example code. Instead, we can use a&nbsp;<strong>for&nbsp;</strong>loop to access each element in an array. The&nbsp;<strong>for&nbsp;</strong>loop is the standard way to access each element of the array, one at the time. To add 1 to each element in an int array, we can use a&nbsp;<strong>for&nbsp;</strong>loop as shown in the following. When we access each element of the array, we use the variable i to indicate the index of the element in the nums array.</p>
<div style="color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background: #ffffff; overflow: auto; width: auto;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 0px; line-height: 15px; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><span style="color: #2b91af;">int</span>[] nums = <span style="color: #0000ff;">new</span> <span style="color: #2b91af;">int</span>[100];
<span style="color: #0000ff;">for</span> (<span style="color: #2b91af;">int</span> i = 0; i &lt; nums.length; i++) {
    nums[i]++;
}</pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>',3,'Programming for Industry',15,'drcuoa',2,'1','Module 4.2 CP','https://canvas.auckland.ac.nz/courses/72041/pages/4-dot-2-arrays?module_item_id=1406332'),
 (83,'Filters, transformations and transitions','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Filters</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">CSS filters are graphical effects that are applied to elements after they have been placed on the page. These effects can change the appearance of the elements in a number of ways.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Most commonly, filters are used on images using the supported operations, which include blurring, contrast shifting, brightness adjustment and greyscaling. These are controlled using the&nbsp;<span style="color: #169179;"><samp>filter</samp></span>&nbsp;property. More than one effect can be specified in the same statement, and will be evaluated left-to-right by the web browser.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Following are some examples of these filters in use, which you can feel free to play with to see how each filter works:</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><iframe style="border-width: 0px; border-style: initial; padding: 0px; margin: 0px; max-width: 100%; width: 1090px;" title="COMPSCI 719 Module 3.2 image filter example" src="https://codepen.io/oes/embed/WNpowJo?height=392&amp;theme-id=dark&amp;default-tab=css,result&amp;editable=true" height="392" allowfullscreen="allowfullscreen"></iframe>
<figcaption style="padding: 0.5em;">COMPSCI 719 Module 3.2 image filter example (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Transformations</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Dr Meads discusses using filters in greater detail, as well as demonstrating how they are used in the CSS, in the video that follows. He then follows on to talk about using transformations, and how these can change the way elements appear on the page.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In short, transformations let us do things like rotate, scale, and move elements on a page. They''re specified by the&nbsp;<span style="color: #169179;"><samp>transform</samp></span>&nbsp;property, and like filters, multiple can be specified at once, on one line.</p>
<p>&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Once you''ve watched the video, return to the CodePen above, and try to add some of your own transform properties. Maybe you''d like to replicate what Dr Meads does in the video, or you might try something entirely new.&nbsp;</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Transitions</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The next step from transformations in css, is to consider transitions. These allow us to transition smoothly between different element states&mdash;changing the CSS properties over a given period of time, which can give a smoother feeling to the user experience.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">They are simply to specify, as you just indicate which property to watch, and how long the change should take. It''s worth also noting that transitions don''t run immediately, but rather they run once the property they are watching has changed.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Controlled with the&nbsp;<span style="color: #169179;"><samp>transition</samp></span>&nbsp;property, as with filters, more than one property can be watched in the same statement.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Watch Dr Meads demonstrate how to use various transitions in this video.</p>',1,'Programming with Web Technologies',1,'drcuoa',2,'default','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-2-filters-transformations-and-transitions?module_item_id=1210182'),
 (84,'Animations','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">CSS animations allow us to specify more complex visual effects, compared to using transitions. They were introduced to save animators from needing to write complex JavaScript code. However, it is still possible, and sometimes inevitable, to augment animations using JavaScript if CSS animations themselves aren''t sufficient.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Animations are made up of a&nbsp;<samp>@<span style="color: #843fa1;">keyframes</span></samp>&nbsp;block, as well as a collection of&nbsp;<span style="color: #169179;"><samp>animation-*</samp></span>&nbsp;properties to control the behaviour of the defined animation.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Here is an example of how you might code an animation, with an explanation of how it presents. You might like to copy this code and import it to your VS code, or try it in a CodePen.</p>
<div class="grid-row" style="box-sizing: border-box; display: flex; flex-flow: row wrap; margin-right: -12px; margin-left: -12px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 1.5em; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;"><span style="color: #236fa1;">h1</span> {
  <span style="color: #169179;">animation-duration</span>: <span style="color: #e67e23;">3</span>s;
  <span style="color: #169179;">animation-name</span>: <span style="color: #e67e23;">slide-right</span>;
}
 
@<span style="color: #843fa1;">keyframes</span> <span style="color: #236fa1;">slide-right</span> {
  <span style="color: #843fa1;">from</span> {
   <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">100</span>%;
   <span style="color: #169179;">width</span>: <span style="color: #e67e23;">300</span>%;
  }
 
  <span style="color: #843fa1;">to</span> {
   <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">0</span>%;
   <span style="color: #169179;">width</span>: <span style="color: #e67e23;">100</span>%;
  }
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<p style="margin: 12px 0px;">This animation starts with its target off screen, accomplished by setting its left margin to 100%. It then slides towards the left of the screen until its left side is touching the left of its container.</p>
<p style="margin: 12px 0px;">The&nbsp;<span style="color: #236fa1;"><samp>h1</samp></span>&nbsp;element, in this case, uses this animation, and executes it over the course of 3 seconds.</p>
</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Once you''ve read through this, watch Dr Meads discuss animations using relevant examples in CodePen in the following video.</p>
<div id="oes-panel" class="oes-panel panel-primary" style="margin-bottom: 20px; background-color: #f2f2f2; border: 1px solid #0062b2; border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;" data-oes-paneltype="primary">
<div class="panel-body" style="padding: 15px; background-color: #ffffff; color: #000000;">
<h4 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px;">Apply your learning</h4>
<p style="margin: 12px 0px;">Now you''ve watched Dr Meads explain animations, it''s time for you to test your understanding of how they work. To do so, you should review the following code. What will it actually do?</p>
<div class="grid-row" style="box-sizing: border-box; display: flex; flex-flow: row wrap; margin-right: -12px; margin-left: -12px;">
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 1.5em; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">
@<span style="color: #843fa1;">keyframes</span> <span style="color: #236fa1;">hrmm</span> {
  <span style="color: #843fa1;">from</span> {
      <span style="color: #169179;">width</span>: <span style="color: #e67e23;">50</span>px;
      <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">0</span>px;
      <span style="color: #169179;">background-color</span>: <span style="color: #e67e23;">blue</span>;
  } <span style="color: #843fa1;">25</span>% {
      <span style="color: #169179;">width</span>: <span style="color: #e67e23;">150</span>px;
      <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">0</span>px;
  } <span style="color: #843fa1;">50</span>% {
      <span style="color: #169179;">width</span>: <span style="color: #e67e23;">50</span>px;
      <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">100</span>px;
      <span style="color: #169179;">background-color</span>: <span style="color: #e67e23;">red</span>;
  } <span style="color: #843fa1;">75</span>% {
      <span style="color: #169179;">width</span>: <span style="color: #e67e23;">150</span>px;
      <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">100</span>px;
  } <span style="color: #843fa1;">to</span> {
      <span style="color: #169179;">width</span>: <span style="color: #e67e23;">50</span>px;
      <span style="color: #169179;">margin-left</span>: <span style="color: #e67e23;">200</span>px;
      <span style="color: #169179;">background-color</span>: <span style="color: #e67e23;">green</span>;
  } 
}</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<pre style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 0.75rem; border-radius: 6px; background-color: #ebedee; border: 1px solid #c7cdd1; color: #2d3b45; padding: 9px; margin-top: 0px; margin-bottom: 12px; line-height: 1.2; word-break: break-all; overflow-wrap: break-word; white-space: pre-wrap; position: relative;"><code style="font-family: Monaco, Menlo, Consolas, ''Courier New'', monospace; font-size: 1.5em; border-radius: 6px; background-color: transparent; border: 0px; padding: 0px; color: inherit;">
#<span style="color: #236fa1;">blue</span> {
   <span style="color: #169179;">width</span>: <span style="color: #e67e23;">50</span>px;
   <span style="color: #169179;">height</span>: <span style="color: #e67e23;">50</span>px;
   <span style="color: #169179;">background-color</span>: <span style="color: #e67e23;">blue</span>;
   <span style="color: #169179;">animation-duration</span>: <span style="color: #e67e23;">3</span>s;
   <span style="color: #169179;">animation-name</span>: <span style="color: #e67e23;">hrmm</span>;
   <span style="color: #169179;">animation-iteration-count</span>: <span style="color: #e67e23;">infinite</span>;
   <span style="color: #169179;">animation-direction</span>: <span style="color: #e67e23;">alternate</span>;
}

&lt;<span style="color: #236fa1;">div</span> <span style="color: #169179;">id</span>="<span style="color: #e67e23;">blue</span>"&gt;&lt;/<span style="color: #236fa1;">div</span>&gt;
</code></pre>
<div class="open_grepper_editor" style="height: 20px !important; width: 20px !important; position: absolute !important; top: 0px !important; right: 0px !important; background-size: 20px 20px !important; cursor: pointer !important; background-color: #000000 !important; background-image: url(''data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAAABmJLR0QA8gBBAEG7NC6zAAAACXBIWXMAAA7EAAAOxAGVKw4bAAAAB3RJTUUH4wwNFQsGe+TrNQAAADxpVFh0Q29tbWVudAAAAAAAUHJvY2Vzc2VkIEJ5IGVCYXkgd2l0aCBJbWFnZU1hZ2ljaywgejEuMS4wLiB8fEIyejRLlgAAA0RJREFUOMuNlE0odG8Yxn/nOc+c+TCimCkUGYUmjLJgUtgqKQt2srC1sLextbak9EqyHktfO1G+lZIkGVOiTseMMfPMjOe/0IzXy9/7/pbn1NV1X/d9Pcbw8LDmG7TW5PN5DMPANE0MwwDAMAyUUry9vSGlREqJ1h8S4k8BgLe3NwzDYHR0lLGxsdI3gEwmQyQSYWpqimAwiFLqkxFZUhYCv9+P4zgIIZBS0tTUhGmauN1uXl9fUUpRX1/P+Pg4Qggsy/rkruQwm81SV1fH9PQ0ra2t5PN5UqkUu7u7pFIpMpkMQgjy+Ty9vb04jsPc3BzxeBzLsr4KGoZBJpPB7/fT29tLoVBACMHLywvPz8+k02kKhQKNjY2Ew2Hm5+eJx+OYpvklewFgWRb39/fs7OwQCoUIBAIopfB6vdi2XcpwaGiI1dVVbNvG5/N9t8sPh263m1gsRiKRIBqNks1mqaio4PHxkXw+T39/Pzc3N5yfn+N2u/k/hGmaaK3JZDJorfn16xft7e1UVVXh8/l4fHykpaWFcDjMxsYGXq/3yyJ+x5yZmZmdmJggmUySzWZ5enqivLycjo4O3G43tm0TjUbZ3t7Gtm2klPyEMTk5qTs7O2lubqasrIx0Oo3L5aK6uhqtNVJKtra2iMViSCkpFApIKT8d+yeHNTU1s5eXl+zv77O3t4fP56OtrQ2lFLlcDpfLVTr4wcFBAHK5HI7joJTCMAyEEAjx3hFZrE+xUicnJ/T09ODxePB6vVxcXLC+vo5SCq01oVCI7u5uDMPg4eGB6+tr4vE4juO81/H36mmt8Xg8SCmxLIuLiwsWFxdLDg4PDzk+PkZKSUNDA5FIhJGRESorK3Ech7W1NcyWlpbZomgulyMYDDIwMMDt7S1LS0vFMUp1NE0TIQS2bXN0dMTZ2RmBQICmpqZ3M3+GWlNTw/PzMwsLCyilvt2q1hohBOXl5SSTSZaXlzk9PeX+/v5DsBhuV1cXKysrJJNJPB4Pf8PlcgFwcHDwPknxh1KKcDiMbducnp7+2IbvsCzrPeviCAB9fX1sbm7i8/m+vbF/QQAUCgVqa2u5uroikUh8+4r8K7KYw8PDA3d3d3g8nh+7+jf+A6kWbVI0BmDOAAAAAElFTkSuQmCC'') !important;" title="Edit &amp; Save To Grepper">&nbsp;</div>
</div>
</div>
<p class="visible-desktop" style="margin: 12px 0px; display: none;"><a id="link1" class="Button" style="color: #2d3b45; text-decoration-line: none; outline: transparent solid 0.125rem; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border: 1px solid #c7cdd1; border-radius: 3px; transition: background-color 0.2s ease-in-out 0s; display: inline-block; position: relative; padding: 8px 14px; margin-bottom: 0px; font-size: 1rem; line-height: 20px; text-align: center; vertical-align: middle; cursor: pointer; overflow: hidden; text-shadow: none; user-select: none;" href="https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-3-animations?module_item_id=1210183#dialog_for_link1">Select for answers</a></p>
</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>
<div class="well" style="background: #f2f2f2; border: 1px solid #d9d9d9; min-height: 20px; padding: 19px; margin-bottom: 20px; border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px inset; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">
<h4 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px;">Supplementary resources</h4>
<p style="margin: 12px 0px;">For more information on CSS transitions, transforms, and animations, you can visit the following links:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px;">
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transitions" target="_blank" rel="noreferrer noopener">MDN CSS Transitions<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2020)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Transforms" target="_blank" rel="noreferrer noopener">MDN CSS Transforms<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2020)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://daneden.github.io/animate.css/" target="_blank" rel="noreferrer noopener">''Just Add Water'' CSS Animations<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(Animate.css, n.d.)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Animations" target="_blank" rel="noreferrer noopener">MDN CSS Animations<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2021)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_animated_properties" target="_blank" rel="noreferrer noopener">MDN Animatable CSS Properties<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2020).</li>
</ul>
</div>',1,'Programming with Web Technologies',3,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-3-animations?module_item_id=1210183'),
 (85,'Flexbox','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Modern page layouts</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The current approach for modern page layouts is to use two new CSS techniques, which were designed from the ground up to make coding layouts a less complicated task, and to broaden the range of what can be done with various elements on web page. Because of this work, producing more complex and challenging layouts is now quite simple.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">We will begin with&nbsp;<strong>Flexbox</strong>, which is designed for one-dimensional layouts, and allows for arranging and aligning items in a row or a column (in a single direction, either vertical or horizontal). We will then move on to&nbsp;<strong>Grid</strong>,<strong>&nbsp;</strong>that addresses two-dimensional layouts, presenting something that gives the same ease-of-thought of using a table, but without the extraneous tags.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The vast majority of modern web page layouts use these features, especially Flexbox, in abundance. Often, they are used in combination with each other, which can help you achieve pretty much any page layout that you can imagine.&nbsp;</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Flexbox</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Flexbox, as we have just briefly introduced, is concerned primarily with laying out, aligning, and distributing elements in a single row or column. It can be used for much more complex layouts than we will discuss here, however, it is intended to be used in conjunction with CSS Grid.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Flexbox layouts utilise two components: the&nbsp;<strong>container</strong>, in which the layout is described and where elements appear; and&nbsp;<strong>items</strong>, which are laid out according to the rules set by the container. Let''s get straight to an example of how Flexbox actually works, by Dr Andrew Meads'' demonstration in the following video.</p>
<div class="well" style="background: #f2f2f2; border: 1px solid #d9d9d9; min-height: 20px; padding: 19px; margin-bottom: 20px; border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px inset; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">
<h4 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px;">Supplementary resources</h4>
<p style="margin: 12px 0px;">You can find the link to the site discussed in the video here:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px;">
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://css-tricks.com/snippets/css/a-guide-to-flexbox/" target="_blank" rel="noreferrer noopener">A complete guide to Flexbox<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(Coyier, 2021)</li>
<li>
<p style="margin: 12px 0px;"><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://css-tricks.com/snippets/css/complete-guide-grid/" target="_blank" rel="noreferrer noopener">A complete guide to Grid<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(House, 2021).</p>
</li>
</ul>
</div>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Grid</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Grid expands on the ideas given by Flexbox, and transforms them into two-dimensions, making it perfectly suited to layouts of a whole page, rather than just a small part.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">As with Flexbox, Grid deals with&nbsp;<strong>containers</strong>&nbsp;and&nbsp;<strong>items</strong>&nbsp;for its layouts, but it also introduces&nbsp;<strong>tracks</strong>&nbsp;(rows and columns within the layout),&nbsp;<strong>lines</strong>&nbsp;(the ''borders'' between tracks), and&nbsp;<strong>areas</strong>&nbsp;(rectangular groups of items within the layout). Examples of how these represent can be seen in these figures.</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><img style="max-width: 1090px; height: auto; vertical-align: middle; border: 0px;" src="https://canvas.auckland.ac.nz/courses/68863/files/7013374/preview" alt="Image shows five different grid layouts. ''Container'' is illustrated by a single box. The next four images show a grid of nine cells inside a container with the following highlighted: ''Item (cell)'' shows one cell highlighted; ''Track (col)'' shows three cells in a column highlighted; ''Track (row)'' shows three cells in a row highlighted. ''Area'' shows four cells in a blockl" width="100%" height="auto" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/files/7013374" data-api-returntype="File" />
<figcaption style="padding: 0.5em;">Example of Grid layouts (2021) courtesy of University of Auckland</figcaption>
</figure>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Dr Meads uses multiple CodePens in this module to demonstrate Flexbox and Grid layouts, and you may want to play with these as he presents. Select the tabs to experiment with the different layouts at your own pace.</p>
<div id="oes-tabs" class="oes-tabs ui-tabs ui-widget ui-widget-content ui-corner-all" style="position: relative; zoom: 1; border-radius: 3px; border: 1px solid #c5c5c5; background: #ffffff; font-size: 16px; color: #333333; visibility: visible; margin-bottom: 20px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; padding: 0.2em;">
<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" style="padding: 0.2em 0.2em 0px; margin: 0px; border-width: 0px 0px 1px; border-style: solid; border-color: #c7cdd1; border-image: initial; outline: 0px; line-height: 1.3; list-style: none; zoom: 1; background: transparent; border-radius: 0px; font-weight: bold; box-shadow: none;" role="tablist">
<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" style="border-width: 1px 1px 0px; border-style: solid; border-color: #c7cdd1; border-image: initial; color: #ffffff; font-weight: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-top-left-radius: 3px; border-top-right-radius: 3px; list-style: none; float: left; position: relative; top: 0px; margin: 1px 0.2em -1px 0px; padding: 0px 0px 1px; white-space: nowrap; box-shadow: none;" tabindex="0" role="tab" aria-controls="oes-tabs-0-0" aria-labelledby="ui-id-1" aria-selected="true"><a id="ui-id-1" class="ui-tabs-anchor" style="color: white; outline: transparent solid 0.125rem; float: left; padding: 0.5em 1em; text-shadow: none; background-color: #00457c;" tabindex="-1" role="presentation" href="https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-4-flexbox?module_item_id=1210184#oes-tabs-0-0" target="_blank" rel="noopener" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/pages/3-dot-4-flexbox" data-api-returntype="Page">Flexbox</a></li>
<li class="ui-state-default ui-corner-top" style="border-width: 1px 1px 0px; border-style: solid; border-color: #c5c5c5; border-image: initial; color: #454545; font-weight: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-top-left-radius: 3px; border-top-right-radius: 3px; list-style: none; float: left; position: relative; top: 0px; margin: 1px 0.2em 0px 0px; padding: 0px; white-space: nowrap; box-shadow: none;" tabindex="-1" role="tab" aria-controls="oes-tabs-0-1" aria-labelledby="ui-id-2" aria-selected="false"><a id="ui-id-2" class="ui-tabs-anchor" style="color: white; outline: transparent solid 0.125rem; float: left; padding: 0.5em 1em; text-shadow: none; cursor: pointer; background-color: #00457c;" tabindex="-1" role="presentation" href="https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-4-flexbox?module_item_id=1210184#oes-tabs-0-1" target="_blank" rel="noopener" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/pages/3-dot-4-flexbox" data-api-returntype="Page">Grid</a></li>
<li class="ui-state-default ui-corner-top" style="border-width: 1px 1px 0px; border-style: solid; border-color: #c5c5c5; border-image: initial; color: #454545; font-weight: normal; background-image: initial; background-position: initial; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; border-top-left-radius: 3px; border-top-right-radius: 3px; list-style: none; float: left; position: relative; top: 0px; margin: 1px 0.2em 0px 0px; padding: 0px; white-space: nowrap; box-shadow: none;" tabindex="-1" role="tab" aria-controls="oes-tabs-0-2" aria-labelledby="ui-id-3" aria-selected="false"><a id="ui-id-3" class="ui-tabs-anchor" style="color: white; outline: transparent solid 0.125rem; float: left; padding: 0.5em 1em; text-shadow: none; cursor: pointer; background-color: #00457c;" tabindex="-1" role="presentation" href="https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-4-flexbox?module_item_id=1210184#oes-tabs-0-2" target="_blank" rel="noopener" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/pages/3-dot-4-flexbox" data-api-returntype="Page">Named areas and media queries</a></li>
</ul>
<div id="oes-tabs-0-0" class="ui-tabs-panel ui-widget-content ui-corner-bottom" style="border: 0px solid #c7cdd1; background: none; border-radius: 0px; padding: 1em 1.4em;" role="tabpanel" aria-labelledby="ui-id-1" aria-expanded="true" aria-hidden="false">
<figure style="text-align: center; margin: 1em 0px;"><iframe style="border-width: 0px; border-style: initial; padding: 0px; margin: 0px; max-width: 100%; width: 1034.88px;" title="COMPSCI 719 Module 3.4 Flexbox" src="https://codepen.io/oes/embed/ZEeBKey?height=360&amp;theme-id=dark&amp;default-tab=css,result&amp;editable=true" height="360" allowfullscreen="allowfullscreen"></iframe>
<figcaption style="padding: 0.5em;">COMPSCI 719 Module 3.4 Flexbox (2021) courtesy of University of Auckland</figcaption>
</figure>
</div>
</div>',1,'Programming with Web Technologies',3,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-4-flexbox?module_item_id=1210184'),
 (86,'Responsive design','<h1 class="page-title" style="margin: 15px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: 200; line-height: 1.5; text-rendering: optimizelegibility; font-size: 2.5em; color: #666666; background-color: #ffffff;">&nbsp;</h1>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">The story so far</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">To now, the web pages you have developed have been fairly simple. Elements have been placed on the page and mostly allowed to lay themselves out, and no consideration has been made for the size or type of display being used for viewing the document.</p>
<div class="grid-row" style="box-sizing: border-box; display: flex; flex-flow: row wrap; margin-right: -12px; margin-left: -12px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<p style="margin: 12px 0px;">This style of web pages might have been fine in the 90s and early 00s, but not now. Modern computing devices include the cellphone, tablet, and smartwatch, and there are often more users on these than on ''traditional'' desktops devices. We need to ensure that our pages work well on these devices.</p>
<p style="margin: 12px 0px;">The types of devices that we need to consider can be broadly split into five groups:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px;">
<li>regular computer displays (desktops, laptops, projectors)</li>
<li>small displays (phones, tablets, smartwatches)</li>
<li>large displays (digital signage, televisions)</li>
<li>accessibility tools (screen readers, braille)</li>
<li>print.</li>
</ul>
</div>
<div class="col-md-6 col-xs-12" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<figure style="text-align: center; margin: 1em 0px;"><img style="max-width: 534px; height: auto; vertical-align: middle; border: 0px; width: 533px;" src="https://canvas.auckland.ac.nz/courses/68863/files/7013375/preview" alt="Image shows the same style of heading appear at a different height and width as it adapts to four different device types: phone, tablet, laptop and desktop." width="100%" height="auto" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/files/7013375" data-api-returntype="File" />
<figcaption style="padding: 0.5em;">Responsive design mockup (2020) &lt;https://bit.ly/3wjlwU4&gt;</figcaption>
</figure>
</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Each of these device categories have their own layout requirements if we want to make our page usable and attractive, and these are often complex and contradictory. Regular displays favour a more open, spread out layout with plenty of space, whereas on a small screen device, you want to make the best use of limited space, so the layout is compact and not wasteful. When printing pages, you want dense, simple, black text with minimal wasteful images. Alternatively, on large format screens, you want bright colours with big, clear text that stands out.</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Device considerations</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">If we have to support all of the these different devices, how do we write our web pages? One approach that was popular throughout the ''olden days''&mdash;the 2000s and early-mid 2010s&mdash;was to have separate pages for each of the supported devices. This leads to different URLs for each device, with layouts that need to be maintained separately.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">This approach was difficult, and not scalable with a wide variety of devices, and often prone to errors as updates had to happen across multiple pages.</p>
<p>&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">So, what is the answer to this problem? In the next section, we''ll discuss media queries, which will greatly aid us in our pursuit of responsive layouts. Watch Dr Meads discuss how media queries can help, in the following video. You have already interacted with the pen that has some media queries within, so let''s also return to that and you can follow along with Dr Meads as he demonstrates their use.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>
<figure style="text-align: center; margin: 1em 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><iframe style="border-width: 0px; border-style: initial; padding: 0px; margin: 0px; max-width: 100%; width: 1090px;" title="COMPSCI 719 Module 3.4 Named areas and Media queries" src="https://codepen.io/oes/embed/ExWNmvE?height=360&amp;theme-id=dark&amp;default-tab=css,result&amp;editable=true" height="360" allowfullscreen="allowfullscreen"></iframe>
<figcaption style="padding: 0.5em;">COMPSCI 719 Module 3.4 Named areas and Media queries (2021) courtesy of University of Auckland</figcaption>
</figure>
<div id="oes-panel" class="oes-panel panel-primary" style="margin-bottom: 20px; background-color: #f2f2f2; border: 1px solid #0062b2; border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;" data-oes-paneltype="primary">
<div class="panel-body" style="padding: 15px; background-color: #ffffff; color: #000000;">
<h4 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px;">&nbsp;Supplementary resources</h4>
<p style="margin: 12px 0px;">You can refer to the site Dr Meads mentions in the video here:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px;">
<li><a class="external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/CSS/Media_Queries/Using_media_queries" target="_blank" rel="noreferrer noopener">Using media queries<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2021).</li>
</ul>
</div>
</div>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">&nbsp;</p>',1,'Programming with Web Technologies',3,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-5-responsive-design?module_item_id=1210185'),
 (87,'Adv CSS Activity: Lab','<div class="grid-row" style="box-sizing: border-box; display: flex; flex-flow: row wrap; margin-right: -12px; margin-left: -12px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<div class="col-md-6" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<h2 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em;">Purpose</h2>
<p style="margin: 12px 0px;">In each module, you''ll be presented with a practical activity or lab exercise, which will give you an opportunity to test your understanding of what you''ve learned so far. In some cases there will be more than one exercise per module.</p>
<p style="margin: 12px 0px;">Each of these will be hosted within the repository that you have already signed up to on GitHub Classroom, and you can work through them sequentially. You should find that each one builds on the foundations of the activity prior.</p>
<p style="margin: 12px 0px;">Additionally, there is a discussion space set up in each module where you can raise any problems you might be having, or questions about the specifics of the activities.&nbsp;</p>
</div>
<div class="col-md-6" style="box-sizing: border-box; display: flex; flex-direction: column; flex: 0 0 50%; padding-right: 12px; padding-left: 12px; max-width: 50%;">
<figure style="text-align: center; margin: 1em 0px;"><img style="max-width: 534px; height: auto; vertical-align: middle; border: 0px; width: 533px;" src="https://canvas.auckland.ac.nz/courses/68863/files/7013410/preview" alt="COMPSCI718 Lab image (3).jpg" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/files/7013410" data-api-returntype="File" /></figure>
</div>
</div>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">Task</h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><strong>Step 1: Start&nbsp;</strong>by accessing the GitHub Classroom repository. This is the place that you will find all of the activities, as well as much of the information required to complete your assessments.&nbsp;</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://classroom.github.com/a/bM9ZGCTN" target="_blank" rel="noreferrer noopener">GitHub Classroom Module 3 repository<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a></li>
<li><span class="instructure_file_holder link_holder instructure_file_link_holder"><a class="inline_disabled" style="outline: transparent solid 0.125rem;" title="cs719-module-03-lab.zip" href="https://canvas.auckland.ac.nz/courses/68863/files/7516449?wrap=1" target="_blank" rel="noopener" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/files/7516449" data-api-returntype="File">Lab Zip file</a><a class="file_download_btn" style="text-decoration-line: none; outline: transparent solid 0.125rem; margin-inline-start: 5px;" role="button" href="https://canvas.auckland.ac.nz/courses/68863/files/7516449/download?download_frd=1" download="">&nbsp;<img style="max-width: 100%; height: 16px; vertical-align: middle; border: 0px; width: 16px;" role="presentation" src="https://canvas.auckland.ac.nz/images/svg-icons/svg_icon_download.svg" alt="" />&nbsp;<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">Download Lab Zip file</span></a></span>(ONLY use if you can''t get git working, or you want to come back and re-attempt the lab later with a clean slate. If you''re having git issues,&nbsp;<strong>please</strong>&nbsp;contact our student success advisor ASAP!)</li>
</ul>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">You will be able to access the documents you need to complete the activity, which you can download, and then work in using the code editor you have selected&mdash;we have previously recommended you use VS code editor.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><strong>Step 2: Try to complete&nbsp;</strong>these activities by the end of the week. These lab exercises are designed to be demanding, and you should expect to spend several hours completing these each week.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><strong>Your tutor&nbsp;</strong>will provide you with solutions to the lab exercises a couple of weeks after the end of the module, to give you ample time to work through them at your own pace. However, selected lab exercises will be covered as a group during the live sessions, run by Dr Andrew Meads.&nbsp;</p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">Model solutions</h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">The model solutions for this lab are available here:&nbsp;<span class="instructure_file_holder link_holder instructure_file_link_holder"><a class="inline_disabled" style="outline: transparent solid 0.125rem;" title="cs719-module-03-lab-solution.zip" href="https://canvas.auckland.ac.nz/courses/68863/files/7283187?wrap=1" target="_blank" rel="noopener" data-api-endpoint="https://canvas.auckland.ac.nz/api/v1/courses/68863/files/7283187" data-api-returntype="File">cs719-module-03-lab-solution.zip</a><a class="file_download_btn" style="text-decoration-line: none; outline: transparent solid 0.125rem; margin-inline-start: 5px;" role="button" href="https://canvas.auckland.ac.nz/courses/68863/files/7283187/download?download_frd=1" download=""> </a></span></p>',3,'Programming with Web Technologies',3,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/3-dot-6-activity-lab-exercises?module_item_id=1210186'),
 (88,'Introduction to JavaScript','<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Now, we''re really into the swing of things and starting to get a feel for creating responsive and dynamic web pages. For the next couple of modules, we''ll be focusing on client-side JavaScript (JS).</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">It''s worth noting up front that these modules may be easier for those students who have already completed COMPSCI 718 Programming for Industry, but if you haven''t yet done so, don''t worry. You''re going to be just fine, too.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In this series, we&rsquo;ll talk about why we would want JS in our webpages, and how to include it. We&rsquo;ll then go over basic concepts&mdash;variables, strings, and console debugging. Finally, we&rsquo;ll jump right into how we can actually interact with our HTML from JavaScript, to bend the page to our will.</p>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">This module''s objectives</h2>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">By the end of this module, you should be able to:</p>
<ul style="padding: 0px; margin: 0px 0px 6px 25px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">
<li>add &lt;script&gt; tags to your HTML which point to JavaScript code to run</li>
<li>declare and modify variables in JavaScript, including numbers and strings</li>
<li>query and modify webpage contents using JavaScript</li>
<li>understand Boolean (true/false) logic and operators, and use them to conditionally execute code</li>
<li>loop through arrays of content in JavaScript, to modify many page elements at once.</li>
</ul>
<h2 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.8em; color: #2d3b45; background-color: #ffffff;">This module''s readings</h2>
<figure class="oes-splash" style="margin: 1em 0px; position: relative; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;"><span style="color: var(--ic-brand-font-color-dark); font-family: inherit; font-size: 1rem;">There are no set, essential readings in this module. Instead, you might like to take some time to explore the additional resources.&nbsp;The additional resources might be useful to help contextualise and extend your understanding of this module''s themes and ideas.&nbsp;</span></figure>
<div class="well" style="background: #f2f2f2; border: 1px solid #d9d9d9; min-height: 20px; padding: 19px; margin-bottom: 20px; border-radius: 4px; box-shadow: rgba(0, 0, 0, 0.05) 0px 1px 1px inset; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px;">
<h4 style="margin: 6px 0px; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 18px;">Additional resources</h4>
<ul style="padding: 0px; margin: 0px 0px 6px 25px;">
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://dev.to/sarah_chima/var-let-and-const--whats-the-difference-69e" target="_blank" rel="noreferrer noopener">Var, let and const- what''s the difference?<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(Chima, 2017)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://www.w3schools.com/jsref/dom_obj_all.asp" target="_blank" rel="noreferrer noopener">The HTML DOM Element Object<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(W3Schools, 2021)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/API/Element/getAttribute" target="_blank" rel="noreferrer noopener">Element.getAttribute()<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2021)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://developer.mozilla.org/en-US/docs/Web/API/Element/setAttribute" target="_blank" rel="noreferrer noopener">Element.setAttribute()<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(MDN Web Docs, 2021)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://www.w3schools.com/jsref/dom_obj_event.asp" target="_blank" rel="noreferrer noopener">HTML DOM Events<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(W3Schools, 2021)</li>
<li><a class="inline_disabled external" style="outline: transparent solid 0.125rem;" href="https://www.w3schools.com/js/default.asp" target="_blank" rel="noreferrer noopener">JavaScript Tutorial<span class="screenreader-only" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; transform: translateZ(0px);">&nbsp;(Links to an external site.)</span></a>&nbsp;(W3Schools, 2021)</li>
</ul>
</div>',1,'Programming with Web Technologies',4,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/4-dot-1-this-modules-focus?module_item_id=1210189'),
 (89,' Running JavaScript code','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">What is JavaScript (JS)?</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">JavaScript (JS) is a full programming language that lets us manipulate anything we like within a webpage. Why is this useful? Have a think about some common websites you use, and think about how many of those would be possible without JavaScript.&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">JavaScript is a full programming language that lets us manipulate anything that we like within a web page. It grants the developer fine-grained control of every element in order to achieve the exact look and feel that we''re aiming for.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Consider the example of Gmail&mdash;it''s a neat and responsive page that is nicely interactive. Whenever you click to read a new email, it doesn''t have to completely reload the page; it just takes you to that email. Want to start to write a new email? Well, click on the ''compose'' button and a pop-up box allows you to do just that. All of these are things that could not be achieved without the use of JavaScript.</p>
<p>&nbsp;</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Once you''ve decided that you want to include JavaScript functionality in your page, how do you actually make it work with your site and on the page? In the following video, Dr Meads discusses how to incorporate it seamlessly.</p>',1,'Programming with Web Technologies',4,'drcuoa',2,'3','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/4-dot-2-running-javascript-code?module_item_id=1210190'),
 (90,'JavaScript Variables, arithmetic and strings','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Variables and arithmetic</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">JavaScript variables are containers for storing data values, like a number we might use in a sum, or a string that we might use as part of a sentence. But one special thing about variables is that their contained values can change. Another special thing about variables is that they can contain just about anything&mdash;not just strings and numbers. Variables can also contain complex data and even entire functions to do amazing things. You''ll learn more about this as you go along.</p>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">It''s important to note, before you continue to watching the following videos, that variables are not the values themselves, but only containers for the values. You can imagine variables as being like little boxes that can store things, and you write a label on the outside. Select the arrows to navigate through the videos.</p>
<p style="margin: 12px 0px;">Once you''ve had an opportunity to review the videos above, try your hand at replicating some of the work that Dr Meads demonstrated, using the CodePen embedded here.</p>
<figure style="text-align: center; margin: 1em 0px;"><iframe style="border-width: 0px; border-style: initial; padding: 0px; margin: 0px; max-width: 100%; width: 1090px;" title="COMPSCI 719 Module 4.2 JS example" src="https://codepen.io/oes/embed/WNpjrBa?height=360&amp;theme-id=dark&amp;default-tab=css,result&amp;editable=true" height="360" allowfullscreen="allowfullscreen"></iframe>
<figcaption style="padding: 0.5em;">COMPSCI 719 Module 4.2 JS example (2021) courtesy of University of Auckland</figcaption>
</figure>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em;">Strings</h3>
<p style="margin: 12px 0px;">In addition to setting up variables to display numbers, you will also want to display text. The process for declaring variables with strings is roughly the same as for numbers, but there are many different applications, some of which are discussed by Dr Meads in the following videos. Select the arrows to navigate through the videos.</p>',1,'Programming with Web Technologies',4,'drcuoa',2,'1','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/4-dot-3-variables-arithmetic-and-strings?module_item_id=1210191'),
 (91,'JavaScript Adding and modifying elements','<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Getting page elements</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">In this next sequence, we''ll start to see how we can actually interact with elements on our web pages using JavaScript. We''ll start by learning how to find various HTML elements on the page using JS code.&nbsp;</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Modifying page elements</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Now that we''ve gotten references to page elements within our JavaScript, we might now want to modify those elements. The next two videos discuss how to modify the page elements once you''ve found them, and then also how to change the style of those elements. Select the arrows to navigate through the videos.</p>
<h3 style="margin: 6px 0px; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-weight: normal; line-height: 1.5; text-rendering: optimizelegibility; font-size: 1.5em; color: #2d3b45; background-color: #ffffff;">Handling button clicks</h3>
<p style="margin: 12px 0px; color: #2d3b45; font-family: ''Lato Extended'', Lato, ''Helvetica Neue'', Helvetica, Arial, sans-serif; font-size: 16px; background-color: #ffffff;">Now, we can look at how the web page can handle a button click, which is what makes the page more interactive, and brings it closer to what you might be used to experiencing in a web page. The following video explains how to code for your page to respond to button clicks.</p>',1,'Programming with Web Technologies',4,'drcuoa',2,'1','WebTec CP','https://canvas.auckland.ac.nz/courses/68863/pages/4-dot-4-adding-and-modifying-elements?module_item_id=1210192'),
 (93,'Bubble Sort-sorting algorithm','<h1 style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 32px; vertical-align: baseline; clear: both; color: #273239; font-family: sofia-pro, sans-serif; background-color: #ffffff;">Bubble Sort</h1>
<div class="media" style="box-sizing: border-box; margin: 15px 0px; padding: 0px; border: 0px; font-size: 10.8px; vertical-align: baseline; display: flex; flex-flow: row wrap; justify-content: space-between; color: #273239; font-family: sofia-pro, sans-serif; background-color: #ffffff;">
<div class="meta" style="box-sizing: border-box; margin: auto 0px; padding: 0px; border: 0px; font-size: 10.8px; vertical-align: baseline;">
<ul style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font-size: 15px; vertical-align: baseline; list-style: none; display: flex; flex-flow: row nowrap; color: var(--gfg-color-lg);">
<li style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><span class="strong" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">Difficulty Level :</span>&nbsp;<span style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;"><a style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; outline: 0px; text-decoration-line: none; display: inline;" href="https://www.geeksforgeeks.org/easy/">Easy</a></span></li>
<li style="box-sizing: border-box; margin: 0px; padding: 0px 0px 0px 10px; border: 0px; vertical-align: baseline;"><span class="strong" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">Last Updated :</span>&nbsp;<span style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">09 Mar, 2022</span></li>
</ul>
</div>
</div>
<div class="text" style="box-sizing: border-box; margin: 40px 0px 0px; padding: 0px; border: 0px; font-size: 17px; vertical-align: baseline; letter-spacing: 0.015rem; line-height: 1.67; font-family: var(--font-din); color: #273239; background-color: #ffffff;">
<div style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">&nbsp;</div>
<p style="box-sizing: border-box; margin: 0px 0px 10px; padding: 0px; border: 0px; vertical-align: baseline; color: var(--color-black);">Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping the adjacent elements if they are in wrong order.<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">Example:</strong>&nbsp;<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">First Pass:</strong>&nbsp;<br style="box-sizing: border-box;" />(&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;4 2 8 ) &ndash;&gt; (&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;4 2 8 ), Here, algorithm compares the first two elements, and swaps since 5 &gt; 1.&nbsp;<br style="box-sizing: border-box;" />( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;2 8 ) &ndash;&gt;&nbsp; ( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;2 8 ), Swap since 5 &gt; 4&nbsp;<br style="box-sizing: border-box;" />( 1 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;8 ) &ndash;&gt;&nbsp; ( 1 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;8 ), Swap since 5 &gt; 2&nbsp;<br style="box-sizing: border-box;" />( 1 4 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;) &ndash;&gt; ( 1 4 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;), Now, since these elements are already in order (8 &gt; 5), algorithm does not swap them.<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">Second Pass:</strong>&nbsp;<br style="box-sizing: border-box;" />(&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;2 5 8 ) &ndash;&gt; (&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;2 5 8 )&nbsp;<br style="box-sizing: border-box;" />( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;5 8 ) &ndash;&gt; ( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;5 8 ), Swap since 4 &gt; 2&nbsp;<br style="box-sizing: border-box;" />( 1 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;8 ) &ndash;&gt; ( 1 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;8 )&nbsp;<br style="box-sizing: border-box;" />( 1 2 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;) &ndash;&gt;&nbsp; ( 1 2 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;)&nbsp;<br style="box-sizing: border-box;" />Now, the array is already sorted, but our algorithm does not know if it is completed. The algorithm needs one&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">whole</strong>&nbsp;pass without&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">any</strong>&nbsp;swap to know it is sorted.<br style="box-sizing: border-box;" /><strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">Third Pass:</strong>&nbsp;<br style="box-sizing: border-box;" />(&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;4 5 8 ) &ndash;&gt; (&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">1</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;4 5 8 )&nbsp;<br style="box-sizing: border-box;" />( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;5 8 ) &ndash;&gt; ( 1&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">2</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;5 8 )&nbsp;<br style="box-sizing: border-box;" />( 1 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;8 ) &ndash;&gt; ( 1 2&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">4</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;8 )&nbsp;<br style="box-sizing: border-box;" />( 1 2 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;) &ndash;&gt; ( 1 2 4&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">5</strong>&nbsp;<strong style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; vertical-align: baseline;">8</strong>&nbsp;)&nbsp;</p>
</div>',0,'Programming with Web Technologies',1,'drcuoa',2,'default','GeeksforGeeks page','https://www.geeksforgeeks.org/bubble-sort/'),
 (96,'Lexical Scope in JavaScript – What Exactly Is Scope in JS?','<p style="line-height: 1;"><span class="author-card-name" style="box-sizing: inherit; margin: 0px 0px 2px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: arial, helvetica, sans-serif; font-size: 2rem; vertical-align: baseline; color: #0a0a23; background-color: #ffffff;"><a style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-size: 20px; vertical-align: baseline; background-color: transparent; text-decoration-line: none; cursor: pointer; word-break: break-word;" href="https://www.freecodecamp.org/news/author/oluwatobiss/" data-test-label="profile-link"><span style="font-size: 10pt; color: #7e8c8d;">Credit : Oluwatobi Sofela https://www.freecodecamp.org/ extracted 23-8-2022</span></a></span></p>
<h2 id="what-exactly-is-scope" style="box-sizing: inherit; margin: 0.5em 0px 0.2em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.15; font-size: 3.6rem; vertical-align: baseline; text-rendering: optimizelegibility; min-width: 100%; color: var(--gray85); background-color: #ffffff;">What exactly is Scope?</h2>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Scope</span>&nbsp;refers to the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">area&nbsp;</em>where an item (such as a function or variable) is visible and accessible to other&nbsp;<a style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; background-color: transparent; cursor: pointer; word-break: break-word;" href="https://www.codesweetly.com/document-vs-data-vs-code/">code</a>.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Note:</span></p>
<ul style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px 1.5em 0px 1.3em; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; max-width: 100%; min-width: 100%; color: #0a0a23; background-color: #ffffff;">
<li style="box-sizing: inherit; margin: 0px 0px 0.5em; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Scope</span>&nbsp;means area, space, or region.</li>
<li style="box-sizing: inherit; margin: 0.5em 0px; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Global scope&nbsp;</span>means global space or a public space.</li>
<li style="box-sizing: inherit; margin: 0.5em 0px; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Local scope&nbsp;</span>means a local region or a restricted region.</li>
</ul>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Here''s an example:</span></p>
<pre class=" language-js" style="box-sizing: inherit; margin-top: 1.5em; margin-bottom: 3em; padding: 20px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.5em; font-size: 1.4rem; vertical-align: baseline; color: var(--gray85); background: var(--gray05); word-spacing: 0px; min-width: 100%; max-width: 100%;"><code class=" language-js" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-size: inherit; vertical-align: baseline;"><span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define a variable in the global scope:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">const</span> fullName <span class="token operator" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">=</span> <span class="token string" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">"Oluwatobi Sofela"</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>

<span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define nested functions:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">profile</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
      <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> fullName<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
    <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
  <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span></code></pre>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><a style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; background-color: transparent; cursor: pointer; word-break: break-word;" href="https://stackblitz.com/edit/web-platform-fqqxjl?file=script.js"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Try it on StackBlitz</span></a></p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">In the snippet above, we defined the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>&nbsp;variable in the global scope. This means that it is visible and accessible globally to all code within the script.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">But we defined&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;within the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">sayName()</code>&nbsp;function, so it is locally scoped to&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">sayName()</code>.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">In other words,&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;is locally visible and accessible only to code in the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">sayName()</code>&nbsp;function.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">Keep in mind that whenever the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;function gets invoked, the computer will&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">not</em>&nbsp;go straight to the global scope to call the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>&nbsp;variable. Instead, it must sequentially go through the&nbsp;<a style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; background-color: transparent; cursor: pointer; word-break: break-word;" href="https://www.freecodecamp.org/news/javascript-lexical-scope-tutorial/#what-is-a-scope-chain">scope chain</a>&nbsp;to look for&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>.</p>
<h2 id="what-is-a-scope-chain" style="box-sizing: inherit; margin: 0.5em 0px 0.2em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.15; font-size: 3.6rem; vertical-align: baseline; text-rendering: optimizelegibility; min-width: 100%; color: var(--gray85); background-color: #ffffff;">What is a Scope Chain?</h2>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">A&nbsp;<span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">scope chain&nbsp;</span>refers to the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">unique</em>&nbsp;spaces that exist from the scope where a variable got&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">called&nbsp;</em>to the global scope.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Here''s an example:</span></p>
<pre class=" language-js" style="box-sizing: inherit; margin-top: 1.5em; margin-bottom: 3em; padding: 20px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.5em; font-size: 1.4rem; vertical-align: baseline; color: var(--gray85); background: var(--gray05); word-spacing: 0px; min-width: 100%; max-width: 100%;"><code class=" language-js" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-size: inherit; vertical-align: baseline;"><span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define a variable in the global scope:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">const</span> fullName <span class="token operator" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">=</span> <span class="token string" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">"Oluwatobi Sofela"</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>

<span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define nested functions:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">profile</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
      <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> fullName<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
    <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
  <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span></code></pre>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">In the snippet above, observe that the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>&nbsp;variable got called from the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;function''s scope.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">Therefore, the scope chain that exists from the variable&rsquo;s call to the global scope is:</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">writeName() scope ---&gt; sayName() scope ---&gt; profile() scope ---&gt; global scope</span></p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">In other words, there are four (4) spaces from&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>&rsquo;s invocation scope to its lexical scope (the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">global scope</em>&nbsp;in this instance).</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;"><span style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">Note:&nbsp;</span>The global scope is the last link in&nbsp;<a style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; background-color: transparent; cursor: pointer; word-break: break-word;" href="https://www.codesweetly.com/html-css-javascript/">JavaScript</a>''s scope chain.</p>
<h2 id="how-does-the-scope-chain-work" style="box-sizing: inherit; margin: 0.5em 0px 0.2em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.15; font-size: 3.6rem; vertical-align: baseline; text-rendering: optimizelegibility; min-width: 100%; color: var(--gray85); background-color: #ffffff;">How Does the Scope Chain Work?</h2>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">JavaScript''s scope chain determines the hierarchy of places the computer must go through &mdash; one after the other &mdash; to find the lexical scope (origin) of the specific variable that got called.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">For instance, consider the code below:</p>
<pre class=" language-js" style="box-sizing: inherit; margin-top: 1.5em; margin-bottom: 3em; padding: 20px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: 1.5em; font-size: 1.4rem; vertical-align: baseline; color: var(--gray85); background: var(--gray05); word-spacing: 0px; min-width: 100%; max-width: 100%;"><code class=" language-js" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: inherit; font-size: inherit; vertical-align: baseline;"><span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define a variable in the global scope:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">const</span> fullName <span class="token operator" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">=</span> <span class="token string" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">"Oluwatobi Sofela"</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>

<span class="token comment" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">// Define nested functions:</span>
<span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">profile</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">function</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span> <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">{</span>
      <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> fullName<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
    <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
    <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">writeName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
  <span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span>
  <span class="token keyword" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">return</span> <span class="token function" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">sayName</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">(</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">)</span><span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">;</span>
<span class="token punctuation" style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; font-size: 14px; vertical-align: baseline;">}</span></code></pre>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">In the snippet above, whenever the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">profile()</code>&nbsp;function gets invoked, the computer will first invoke the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">sayName()</code>&nbsp;function (which is the only code in the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">profile()</code>&nbsp;function).</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">Secondly, the computer will invoke the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;function (which is the only code in the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">sayName()</code>&nbsp;function).</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">At this point, since the code in&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">writeName()</code>&nbsp;instructs the computer to call and return the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>&nbsp;variable''s content, the computer will call&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>. But it will not go directly to the global scope to call&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">Instead, the computer must go&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">step-by-step</em>&nbsp;through the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">scope chain</em>&nbsp;to look for the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">lexical scope&nbsp;</em>of&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>.</p>
<p style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; min-width: 100%; color: #0a0a23; background-color: #ffffff;">So, here are the sequential steps the computer must take to locate&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15); word-break: normal;">fullName</code>''s lexical scope:</p>
<ol style="box-sizing: inherit; margin: 0px 0px 1.5em; padding: 0px 1.5em 0px 1.3em; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; font-family: Lato, sans-serif; font-size: 22px; vertical-align: baseline; list-style-position: initial; list-style-image: initial; max-width: 100%; min-width: 100%; color: #0a0a23; background-color: #ffffff;">
<li style="box-sizing: inherit; margin: 0px 0px 0.5em; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;">Firstly, the computer will check if&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>&nbsp;got defined locally within the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">writeName()</code>&nbsp;function. But it will find no&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>&nbsp;definition there, so it moves up to the next scope to continue its quest.</li>
<li style="box-sizing: inherit; margin: 0.5em 0px; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;">Secondly, the computer will search for&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>''s definition in&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">sayName()</code>&nbsp;(the next space in the scope chain). Still, it doesn''t find it there, so it climbs up the ladder to the next scope.</li>
<li style="box-sizing: inherit; margin: 0.5em 0px; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;">Thirdly, the computer will search for&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>''s definition in the&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">profile()</code>&nbsp;function. Yet still,&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>&nbsp;is not found there. So the computer goes forward to seek&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">fullName</code>''s lexical scope in the next region of the scope chain.</li>
<li style="box-sizing: inherit; margin: 0.5em 0px; padding: 0px 0px 0px 0.3em; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 1.6em; font-family: inherit; vertical-align: baseline; word-break: break-word;">Fourthly, the computer goes to the&nbsp;<em style="box-sizing: inherit; margin: 0px; padding: 0px; border: 0px; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; color: var(--gray85);">global scope</em>&nbsp;(the following scope after&nbsp;<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">profile()</code>). Fortunately, it finds fullName''s definition there! Therefore, it gets its content (<code style="box-sizing: inherit; margin: 0px; padding: 0px 5px 2px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; line-height: 1em; font-family: ''Roboto Mono'', monospace; font-size: 0.8em; vertical-align: baseline; background: var(--gray15);">"Oluwatobi Sofela"</code>) and returns it.</li>
</ol>',3,'Programming with Web Technologies',5,'codern',6,'3','Oluwatobi Sofela Oh, sweet programming, my interest is to make you sweeter for all.','https://www.freecodecamp.org/news/javascript-lexical-scope-tutorial/'),
 (97,'JS Collision Detection Circles','<div style="color: #d4d4d4; background-color: #1e1e1e; font-family: Consolas, ''Courier New'', monospace; font-size: 14px; line-height: 19px; white-space: pre;">
<div>&nbsp;<span style="color: #6a9955;">// collision detection</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemies.forEach(enemy <span style="color: #569cd6;">=&gt;</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> dx = enemy.x - <span style="color: #569cd6;">this</span>.x;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> dy = enemy.y - <span style="color: #569cd6;">this</span>.y;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> distance = Math.sqrt(dx * dx + dy * dy);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>( distance &lt; enemy.width/<span style="color: #b5cea8;">2</span> + <span style="color: #569cd6;">this</span>.width/<span style="color: #b5cea8;">2</span> ){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gameOver = <span style="color: #569cd6;">true</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; })</div>
</div>',0,'Programming with Web Technologies',5,'codern',6,'1','Franks Lab','https://www.youtube.com/watch?v=GFO_txvwK_c&t=19124s'),
 (98,'Project 7 JS Game ','<div style="color: #d4d4d4; background-color: #1e1e1e; font-family: Consolas, ''Courier New'', monospace; font-size: 14px; line-height: 19px; white-space: pre;">
<div>window.addEventListener(<span style="color: #ce9178;">''load''</span>, <span style="color: #569cd6;">function</span> () {</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">const</span> canvas = document.querySelector(<span style="color: #ce9178;">''#canvas1''</span>);</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">const</span> ctx = canvas.getContext(<span style="color: #ce9178;">''2d''</span>);</div>
<div>&nbsp; &nbsp; canvas.width = <span style="color: #b5cea8;">800</span>;</div>
<div>&nbsp; &nbsp; canvas.height = <span style="color: #b5cea8;">720</span>;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> enemies = [];</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> score = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> gameOver = <span style="color: #569cd6;">false</span>;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">class</span> InputHandler {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">constructor</span>() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.keys = [];</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; window.addEventListener(<span style="color: #ce9178;">''keydown''</span>, e <span style="color: #569cd6;">=&gt;</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (( &nbsp; e.key === <span style="color: #ce9178;">''ArrowDown''</span> ||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowUp''</span> ||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowLeft''</span>||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowRight''</span>)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;&amp; <span style="color: #569cd6;">this</span>.keys.indexOf(e.key) === -<span style="color: #b5cea8;">1</span>){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.keys.push(e.key);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color: #6a9955;">// console.log(e.key, this.keys);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; });</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; window.addEventListener(<span style="color: #ce9178;">''keyup''</span>, e <span style="color: #569cd6;">=&gt;</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (( &nbsp; e.key === <span style="color: #ce9178;">''ArrowDown''</span> ||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowUp''</span> ||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowLeft''</span>||</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; e.key === <span style="color: #ce9178;">''ArrowRight''</span>)){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.keys.splice(<span style="color: #569cd6;">this</span>.keys.indexOf(e.key), <span style="color: #b5cea8;">1</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// &nbsp;console.log(e.key, this.keys);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; });</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">class</span> Player {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">constructor</span>(gameWidth, gameHeight){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameWidth = gameWidth;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameHeight = gameHeight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.width = <span style="color: #b5cea8;">200</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.height = <span style="color: #b5cea8;">200</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x = <span style="color: #b5cea8;">10</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.y = <span style="color: #569cd6;">this</span>.gameHeight - <span style="color: #569cd6;">this</span>.height;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.image = document.querySelector(<span style="color: #ce9178;">''#playerImage''</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameX = <span style="color: #b5cea8;">1</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.maxFrame = <span style="color: #b5cea8;">8</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameY = <span style="color: #b5cea8;">1</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.fps = <span style="color: #b5cea8;">20</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameInterval = <span style="color: #b5cea8;">1000</span>/<span style="color: #569cd6;">this</span>.fps;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.vy = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.weight = <span style="color: #b5cea8;">1</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.vx = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; draw(context){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.strokeStyle = ''white'';</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.strokeRect(this.x, this.y, this.width, this.height);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.beginPath();</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.arc(this.x + this.width/2, this.y + this.height/2, this.width/2, 0, Math.PI * 2);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.stroke();</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.drawImage(<span style="color: #569cd6;">this</span>.image,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameX * <span style="color: #569cd6;">this</span>.width, &nbsp;<span style="color: #6a9955;">//source -</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameY * <span style="color: #569cd6;">this</span>.height,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.width,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.height,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x, &nbsp;<span style="color: #6a9955;">// destination -</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.y,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.width,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.height);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; update(input, deltaTime, enemies) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// collision detection</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemies.forEach(enemy <span style="color: #569cd6;">=&gt;</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> dx = (enemy.x + enemy.width/<span style="color: #b5cea8;">2</span>) - (<span style="color: #569cd6;">this</span>.x + <span style="color: #569cd6;">this</span>.width/<span style="color: #b5cea8;">2</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> dy = (enemy.y + enemy.height/<span style="color: #b5cea8;">2</span>) - (<span style="color: #569cd6;">this</span>.y + <span style="color: #569cd6;">this</span>.height/<span style="color: #b5cea8;">2</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> distance = Math.sqrt(dx * dx + dy * dy);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>( distance &lt; enemy.width/<span style="color: #b5cea8;">2</span> + <span style="color: #569cd6;">this</span>.width/<span style="color: #b5cea8;">2</span>){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; gameOver = <span style="color: #569cd6;">true</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; })</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">//sprite animation</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.frameTimer &gt; <span style="color: #569cd6;">this</span>.frameInterval) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.frameX &gt;= <span style="color: #569cd6;">this</span>.maxFrame) <span style="color: #569cd6;">this</span>.frameX = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">else</span> <span style="color: #569cd6;">this</span>.frameX++;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer += deltaTime;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">//controls</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(input.keys.indexOf(<span style="color: #ce9178;">''ArrowRight''</span>) &gt; -<span style="color: #b5cea8;">1</span> ) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = <span style="color: #b5cea8;">5</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> <span style="color: #569cd6;">if</span>(input.keys.indexOf(<span style="color: #ce9178;">''ArrowLeft''</span>) &gt; -<span style="color: #b5cea8;">1</span> ) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = -<span style="color: #b5cea8;">5</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> <span style="color: #569cd6;">if</span>(input.keys.indexOf(<span style="color: #ce9178;">''ArrowUp''</span>) &gt; -<span style="color: #b5cea8;">1</span> &amp;&amp; <span style="color: #569cd6;">this</span>.onGround()) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.vy -= <span style="color: #b5cea8;">32</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// x (horizontal) axis movement </span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x += <span style="color: #569cd6;">this</span>.speed;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (<span style="color: #569cd6;">this</span>.x &lt; <span style="color: #b5cea8;">0</span>) <span style="color: #569cd6;">this</span>.x =<span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">else</span> <span style="color: #569cd6;">if</span> (<span style="color: #569cd6;">this</span>.x &gt; <span style="color: #569cd6;">this</span>.gameWidth - <span style="color: #569cd6;">this</span>.width) <span style="color: #569cd6;">this</span>.x = <span style="color: #569cd6;">this</span>.gameWidth - <span style="color: #569cd6;">this</span>.width;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span style="color: #6a9955;">// y (vertical) axis movement</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.y += <span style="color: #569cd6;">this</span>.vy;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (!<span style="color: #569cd6;">this</span>.onGround()) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.vy += <span style="color: #569cd6;">this</span>.weight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameY = <span style="color: #b5cea8;">1</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.maxFrame = <span style="color: #b5cea8;">5</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.vy = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameY = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (<span style="color: #569cd6;">this</span>.y &gt; <span style="color: #569cd6;">this</span>.gameHeight - <span style="color: #569cd6;">this</span>.height) <span style="color: #569cd6;">this</span>.y = <span style="color: #569cd6;">this</span>.gameHeight - <span style="color: #569cd6;">this</span>.height</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.vy != <span style="color: #b5cea8;">0</span>)console.log(<span style="color: #ce9178;">`Velocity Y: </span><span style="color: #569cd6;">${this</span>.vy<span style="color: #569cd6;">}</span><span style="color: #ce9178;">`</span>) &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; onGround() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">return</span> <span style="color: #569cd6;">this</span>.y &gt;= <span style="color: #569cd6;">this</span>.gameHeight - <span style="color: #569cd6;">this</span>.height;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">class</span> Background {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">constructor</span>(gameWidth, gameHeight) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameWidth = gameWidth;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameHeight = gameHeight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.image = document.querySelector(<span style="color: #ce9178;">''#backgroundImage''</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.y = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.width = <span style="color: #b5cea8;">2200</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.height = <span style="color: #b5cea8;">720</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = <span style="color: #b5cea8;">5</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; draw(context){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.drawImage(<span style="color: #569cd6;">this</span>.image, <span style="color: #569cd6;">this</span>.x, <span style="color: #569cd6;">this</span>.y, <span style="color: #569cd6;">this</span>.width, <span style="color: #569cd6;">this</span>.height);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.drawImage(<span style="color: #569cd6;">this</span>.image, <span style="color: #569cd6;">this</span>.x + <span style="color: #569cd6;">this</span>.width - <span style="color: #569cd6;">this</span>.speed, <span style="color: #569cd6;">this</span>.y, <span style="color: #569cd6;">this</span>.width, <span style="color: #569cd6;">this</span>.height);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; update() {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x -= <span style="color: #569cd6;">this</span>.speed;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.x &lt; <span style="color: #b5cea8;">0</span> - <span style="color: #569cd6;">this</span>.width) <span style="color: #569cd6;">this</span>.x =<span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">class</span> Enemy {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">constructor</span>(gameWidth,gameHeight) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameWidth = gameWidth;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.gameHeight = gameHeight;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.width = <span style="color: #b5cea8;">160</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.height = <span style="color: #b5cea8;">119</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.image = document.querySelector(<span style="color: #ce9178;">''#enemyImage''</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x = <span style="color: #569cd6;">this</span>.gameWidth;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.y = <span style="color: #569cd6;">this</span>.gameHeight - <span style="color: #569cd6;">this</span>.height;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameX = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.maxFrame = <span style="color: #b5cea8;">5</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.fps = <span style="color: #b5cea8;">20</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameInterval = <span style="color: #b5cea8;">1000</span>/<span style="color: #569cd6;">this</span>.fps;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.speed = <span style="color: #b5cea8;">8</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.markedForDeletion = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; draw(context) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.strokeStyle = ''white'';</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.strokeRect(this.x, this.y, this.width, this.height);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.beginPath();</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.arc(this.x + this.width/2, this.y + this.height/2, this.width/2, 0, Math.PI * 2);</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// context.stroke();</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.drawImage(<span style="color: #569cd6;">this</span>.image, <span style="color: #569cd6;">this</span>.frameX * <span style="color: #569cd6;">this</span>.width, <span style="color: #b5cea8;">0</span>, <span style="color: #569cd6;">this</span>.width, <span style="color: #569cd6;">this</span>.height, <span style="color: #569cd6;">this</span>.x, <span style="color: #569cd6;">this</span>.y, <span style="color: #569cd6;">this</span>.width, <span style="color: #569cd6;">this</span>.height);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; update(deltaTime){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.frameTimer &gt; <span style="color: #569cd6;">this</span>.frameInterval) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(<span style="color: #569cd6;">this</span>.frameX &gt;= <span style="color: #569cd6;">this</span>.maxFrame) <span style="color: #569cd6;">this</span>.frameX = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">else</span> <span style="color: #569cd6;">this</span>.frameX++;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.frameTimer += deltaTime;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.x -= <span style="color: #569cd6;">this</span>.speed;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (<span style="color: #569cd6;">this</span> .x &lt; <span style="color: #b5cea8;">0</span> - <span style="color: #569cd6;">this</span>.width) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">this</span>.markedForDeletion = <span style="color: #569cd6;">true</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; score++; &nbsp; &nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; <span style="color: #6a9955;">// &nbsp;enemies.push(new Enemy(canvas.width, canvas.height));</span></div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">function</span> handleEnemies(deltaTime) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span> (enemyTimer &gt; enemyInterval + randomEnemyInterval) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemies.push(<span style="color: #569cd6;">new</span> Enemy(canvas.width, canvas.height));</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; console.log(enemies)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; randomEnemyInterval = Math.random() * <span style="color: #b5cea8;">1000</span> + <span style="color: #b5cea8;">500</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemyTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; } <span style="color: #569cd6;">else</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemyTimer += deltaTime;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; enemies.forEach(enemy <span style="color: #569cd6;">=&gt;</span> {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemy.draw(ctx);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; enemy.update(deltaTime);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; });</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; enemies = enemies.filter(enemy <span style="color: #569cd6;">=&gt;</span> !enemy.markedForDeletion);</div>
<br />
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">function</span> displayStatusText(context) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.fillStyle = <span style="color: #ce9178;">''black''</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.font = <span style="color: #ce9178;">''48px Arial Bold''</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.fillText(<span style="color: #ce9178;">`Score: </span><span style="color: #569cd6;">${</span>score<span style="color: #569cd6;">}</span><span style="color: #ce9178;">`</span>, <span style="color: #b5cea8;">20</span>, <span style="color: #b5cea8;">50</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.fillStyle = <span style="color: #ce9178;">''darkgrey''</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.font = <span style="color: #ce9178;">''48px Arial Bold''</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; context.fillText(<span style="color: #ce9178;">`Score: </span><span style="color: #569cd6;">${</span>score<span style="color: #569cd6;">}</span><span style="color: #ce9178;">`</span>, <span style="color: #b5cea8;">22</span>, <span style="color: #b5cea8;">52</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>(gameOver){</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.textAlign = <span style="color: #ce9178;">''center''</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.fillStyle = <span style="color: #ce9178;">''black''</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.fillText(<span style="color: #ce9178;">''GAME OVER, try again!''</span>, canvas.width/<span style="color: #b5cea8;">2</span>, canvas.height/<span style="color: #b5cea8;">2</span>);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.fillStyle = <span style="color: #ce9178;">''red''</span>;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; context.fillText(<span style="color: #ce9178;">''GAME OVER, try again!''</span>, canvas.width/<span style="color: #b5cea8;">2</span> + <span style="color: #b5cea8;">2</span>, canvas.height/<span style="color: #b5cea8;">2</span> + <span style="color: #b5cea8;">2</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; );</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; }</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">const</span> input = <span style="color: #569cd6;">new</span> InputHandler();</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">const</span> player = <span style="color: #569cd6;">new</span> Player(canvas.width, canvas.height);</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">const</span> background = <span style="color: #569cd6;">new</span> Background(canvas.width, canvas.height);</div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> lastTime = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> enemyTimer = <span style="color: #b5cea8;">0</span>;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> enemyInterval = <span style="color: #b5cea8;">1000</span>;</div>
<div>&nbsp; &nbsp; <span style="color: #569cd6;">let</span> randomEnemyInterval = Math.random() * <span style="color: #b5cea8;">1000</span> + <span style="color: #b5cea8;">500</span></div>
<br />
<div>&nbsp; &nbsp; <span style="color: #569cd6;">function</span> animate(timeStamp) {</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">const</span> deltaTime = timeStamp - lastTime;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; lastTime = timeStamp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; ctx.clearRect(<span style="color: #b5cea8;">0</span>,<span style="color: #b5cea8;">0</span>, canvas.width, canvas.height);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; background.draw(ctx);</div>
<div>&nbsp; &nbsp; &nbsp; <span style="color: #6a9955;">// &nbsp;background.update();</span></div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; player.draw(ctx);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; player.update(input, deltaTime, enemies);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; handleEnemies(deltaTime);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; displayStatusText(ctx);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; <span style="color: #569cd6;">if</span>( !gameOver) requestAnimationFrame(animate);</div>
<div>&nbsp; &nbsp; }</div>
<div>&nbsp; &nbsp; animate(<span style="color: #b5cea8;">0</span>);</div>
<div>});</div>
</div>',0,'Programming with Web Technologies',1,'codern',6,'default','',''),
 (99,'Software Architecture Patterns','<p style="margin-top: 0px; font-family: Verdana; font-size: 16px; background-color: #ffffff;">How many plots are there in Hollywood movies? Some critics say there are only five. How many ways can you structure a program? Right now, the majority of programs use one of five architectures.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Mark Richards is a Boston-based software architect who&rsquo;s been thinking for more than 30 years about how data should flow through software. His new (free) book,&nbsp;<a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Fwww.oreilly.com%2Fprogramming%2Ffree%2Fsoftware-architecture-patterns.csp" target="_blank" rel="nofollow noopener">Software Architecture Patterns</a>,&nbsp;focuses on five architectures that are commonly used to organize software systems. The best way to plan new programs is to study them and understand their strengths and weaknesses.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">In this article, I&rsquo;ve distilled the five architectures into a quick reference of the strengths and weaknesses, as well as optimal use cases. Remember that you can use multiple patterns in a single system to optimize each section of code with the best architecture. Even though they call it computer science, it&rsquo;s often an art.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">&nbsp;</p>
<p><span style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Layered (n-tier) architecture</span></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">This approach is probably the most common because it is usually built around the database, and many applications in business naturally lend themselves to storing information in tables.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">This is something of a self-fulfilling prophecy. Many of the biggest and best software frameworks&mdash;like Java EE, Drupal, and Express&mdash;were built with this structure in mind, so many of the applications built with them naturally come out in a layered architecture.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The code is arranged so the data enters the top layer and works its way down each layer until it reaches the bottom, which is usually a database. Along the way, each layer has a specific task, like checking the data for consistency or reformatting the values to keep them consistent. It&rsquo;s common for different programmers to work independently on different layers.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Image credit:&nbsp;<a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Fstackoverflow.com%2Fa%2F30745329" target="_blank" rel="nofollow noopener">Izhaki</a></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The Model-View-Controller (MVC) structure, which is the standard software development approach offered by most of the popular web frameworks, is clearly a layered architecture. Just above the database is the model layer, which often contains business logic and information about the types of data in the database. At the top is the view layer, which is often CSS, JavaScript, and HTML with dynamic embedded code. In the middle, you have the controller, which has various rules and methods for transforming the data moving between the view and the model.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The advantage of a layered architecture is the&nbsp;separation of concerns, which means that each layer can focus solely on its role. This makes it:</p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Maintainable</p>
</li>
<li>
<p style="margin-top: 0px;">Testable</p>
</li>
<li>
<p style="margin-top: 0px;">Easy to assign separate "roles"</p>
</li>
<li>
<p style="margin-top: 0px;">Easy to update and enhance layers separately</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Proper layered architectures will have isolated layers that aren&rsquo;t affected by certain changes in other layers, allowing for easier refactoring. This architecture can also contain additional open layers, like a service layer, that can be used to access shared services only in the business layer but also get bypassed for speed.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Slicing up the tasks and defining separate layers is the biggest challenge for the architect. When the requirements fit the pattern well, the layers will be easy to separate and assign to different programmers.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Caveats:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Source code can turn into a &ldquo;big ball of mud&rdquo; if it is unorganized and the modules don&rsquo;t have clear roles or relationships.</p>
</li>
<li>
<p style="margin-top: 0px;">Code can end up slow thanks to what some developers call the &ldquo;sinkhole anti-pattern.&rdquo; Much of the code can be devoted to passing data through layers without using any logic.</p>
</li>
<li>
<p style="margin-top: 0px;">Layer isolation, which is an important goal for the architecture, can also make it hard to understand the architecture without understanding every module.</p>
</li>
<li>
<p style="margin-top: 0px;">Coders can skip past layers to create tight coupling and produce a logical mess full of complex interdependencies.</p>
</li>
<li>
<p style="margin-top: 0px;"><a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=https%3A%2F%2Fcontent.microfocus.com%2Fcontinuous-delivery-release-automation-tb%2Fmove-app-to-continuous-delivery%3Flx%3D-DC2cJ%26utm_source%3Dtechbeacon%26utm_medium%3Dreferral%26utm_campaign%3D7014J000000dVOkQAM">Monolithic deployment</a>&nbsp;is often unavoidable, which means small changes can require a complete redeployment of the application.</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Best for:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">New applications that need to be built quickly</p>
</li>
<li>
<p style="margin-top: 0px;">Enterprise or business applications that need to mirror traditional IT departments and processes</p>
</li>
<li>
<p style="margin-top: 0px;">Teams with inexperienced developers who don&rsquo;t understand other architectures yet</p>
</li>
<li>
<p style="margin-top: 0px;">Applications requiring strict maintainability and testability standards</p>
</li>
</ul>
<p><span style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Event-driven architecture</span></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Many programs spend most of their time waiting for something to happen. This is especially true for computers that work directly with humans, but it&rsquo;s also common in areas like networks. Sometimes there&rsquo;s data that needs processing, and other times there isn&rsquo;t.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The event-driven architecture helps manage this by building a central unit that accepts all data and then delegates it to the separate modules that handle the particular type. This handoff is said to generate an &ldquo;event,&rdquo; and it is delegated to the code assigned to that type.<br /><br />Programming a web page with JavaScript involves writing the small modules that react to events like mouse clicks or keystrokes. The browser itself orchestrates all of the input and makes sure that only the right code sees the right events. Many different types of events are common in the browser, but the modules interact only with the events that concern them. This is very different from the layered architecture where all data will typically pass through all layers. Overall, event-driven architectures:</p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Are easily adaptable to complex, often chaotic environments</p>
</li>
<li>
<p style="margin-top: 0px;">Scale easily</p>
</li>
<li>
<p style="margin-top: 0px;">Are easily extendable when new event types appear</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Caveats:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;"><a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=https%3A%2F%2Fcontent.microfocus.com%2Fai-test-automation-tb%2Fai-test-automation-examples%26utm_source%3Dtechbeacon%26utm_medium%3Dreferral%26utm_campaign%3D7014J000000dVOkQAM">Testing can be complex</a>&nbsp;if the modules can affect each other. While individual modules can be tested independently, the interactions between them can only be tested in a fully functioning system.</p>
</li>
<li>
<p style="margin-top: 0px;">Error handling can be difficult to structure, especially when several modules must handle the same events.</p>
</li>
<li>
<p style="margin-top: 0px;">When modules fail, the central unit must have a backup plan.</p>
</li>
<li>
<p style="margin-top: 0px;">Messaging overhead can slow down processing speed, especially when the central unit must buffer messages that arrive in bursts.</p>
</li>
<li>
<p style="margin-top: 0px;">Developing a systemwide data structure for events can be complex when the events have very different needs.</p>
</li>
<li>
<p style="margin-top: 0px;">Maintaining a transaction-based mechanism for consistency is difficult because the modules are so decoupled and independent.</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Best for:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Asynchronous systems with asynchronous data flow</p>
</li>
<li>
<p style="margin-top: 0px;">Applications where the individual data blocks interact with only a few of the many modules</p>
</li>
<li>
<p style="margin-top: 0px;">User interfaces</p>
</li>
</ul>
<p><span style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Microkernel architecture</span></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Many applications have a core set of operations that are used again and again in different patterns that depend upon the data and the task at hand. The popular development tool Eclipse, for instance, will open files, annotate them, edit them, and start up background processors. The tool is famous for doing all of these jobs with Java code and then, when a button is pushed, compiling the code and running it.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">In this case, the basic routines for displaying a file and editing it are part of the microkernel. The Java compiler is just an extra part that&rsquo;s bolted on to support the basic features in the microkernel. Other programmers have extended Eclipse to develop code for other languages with other compilers. Many don&rsquo;t even use the Java compiler, but they all use the same basic routines for editing and annotating files.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The extra features that are layered on top are often called plug-ins. Many call this extensible approach a plug-in architecture instead.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Richards likes to explain this with an example from the insurance business:&nbsp;&ldquo;Claims processing is necessarily complex, but the actual steps are not. What makes it complex are all of the rules.&rdquo;</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The solution is to push some basic tasks&mdash;like asking for a name or checking on payment&mdash;into the microkernel. The different business units can then write plug-ins for the different types of claims by knitting together the rules with calls to the basic functions in the kernel.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Caveats:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Deciding what belongs in the microkernel is often an art. It ought to hold the code that&rsquo;s used frequently.</p>
</li>
<li>
<p style="margin-top: 0px;">The plug-ins must include a fair amount of handshaking code so the microkernel is aware that the plug-in is installed and ready to work.</p>
</li>
<li>
<p style="margin-top: 0px;">Modifying the microkernel can be very difficult or even impossible once a number of plug-ins depend upon it. The only solution is to modify the plug-ins too.</p>
</li>
<li>
<p style="margin-top: 0px;">Choosing the right granularity for the kernel functions is difficult to do in advance but almost impossible to change later in the game.</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Best for:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Tools used by a wide variety of people</p>
</li>
<li>
<p style="margin-top: 0px;">Applications with a clear division between basic routines and higher order rules</p>
</li>
<li>
<p style="margin-top: 0px;">Applications with a fixed set of core routines and a dynamic set of rules that must be updated frequently</p>
</li>
</ul>
<p><span style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Microservices architecture</span></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Software can be like a baby elephant: It is cute and fun when it&rsquo;s little, but once it gets big, it is difficult to steer and resistant to change. The microservice architecture is designed to help developers avoid letting their babies grow up to be unwieldy, monolithic, and inflexible. Instead of building one big program, the goal is to create a number of different tiny programs and then create a new little program every time someone wants to add a new feature. Think of a herd of guinea pigs.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Fgiphy.com%2Fgifs%2Fcute-flood-ehWeTxjeCy2li" rel="nofollow">via GIPHY</a></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">&ldquo;If you go onto your iPad and look at Netflix&rsquo;s UI, every single thing on that interface comes from a separate service,&rdquo; points out Richards. The list of your favorites, the ratings you give to individual films, and the accounting information are all delivered in separate batches by separate services. It&rsquo;s as if Netflix is a constellation of dozens of smaller websites that just happens to present itself as one service.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">This approach is similar to the event-driven and microkernel approaches, but it&rsquo;s used mainly when the different tasks are easily separated. In many cases, different tasks can require different amounts of processing and may vary in use. The servers delivering Netflix&rsquo;s content get pushed much harder on Friday and Saturday nights, so they must be ready to scale up. The servers that track DVD returns, on the other hand, do the bulk of their work during the week, just after the post office delivers the day&rsquo;s mail. By implementing these as separate services, the Netflix cloud can scale them up and down independently as demand changes.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Caveats:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">The services must be&nbsp;<a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Ftechbeacon.com%2F5-fundamentals-successful-microservice-design">largely independent</a>&nbsp;or else interaction can cause the cloud to become imbalanced.</p>
</li>
<li>
<p style="margin-top: 0px;"><a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Ftechbeacon.com%2Fwhy-your-project-may-not-be-ready-microservices">Not all applications</a>&nbsp;have tasks that can&rsquo;t be easily split into independent units.</p>
</li>
<li>
<p style="margin-top: 0px;">Performance can suffer when tasks are spread out between different microservices. The communication costs can be significant.</p>
</li>
<li>
<p style="margin-top: 0px;">Too many microservices can confuse users as parts of the web page appear much later than others.</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Best for:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Websites with small components</p>
</li>
<li>
<p style="margin-top: 0px;">Corporate data centers with well-defined boundaries</p>
</li>
<li>
<p style="margin-top: 0px;">Rapidly developing new businesses and web applications</p>
</li>
<li>
<p style="margin-top: 0px;">Development teams that are spread out, often across the globe</p>
</li>
</ul>
<p><span style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Space-based architecture</span></p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Many websites are built around a database, and they function well as long as the database is able to keep up with the load. But when usage peaks, and the database can&rsquo;t keep up with the constant challenge of writing a log of the transactions, the entire website fails.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">The space-based architecture is designed to avoid functional collapse under high load by splitting up both the processing and the storage between multiple servers. The data is spread out across the nodes just like the responsibility for servicing calls. Some architects use the more amorphous term &ldquo;cloud architecture.&rdquo; The name &ldquo;space-based&rdquo; refers to the &ldquo;tuple space&rdquo; of the users, which is cut up to partition the work between the nodes.&nbsp;&ldquo;It&rsquo;s all in-memory objects,&rdquo; says Richards. &ldquo;The space-based architecture supports things that have unpredictable spikes by eliminating the database.&rdquo;</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">Storing the information in RAM makes many jobs much faster, and spreading out the storage with the processing can simplify many basic tasks. But the distributed architecture can make some types of analysis more complex. Computations that must be spread out across the entire data set&mdash;like finding an average or doing a statistical analysis&mdash;must be split up into subjobs, spread out across all of the nodes, and then aggregated when it&rsquo;s done.</p>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Caveats:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">Transactional support is more difficult with RAM databases.</p>
</li>
<li>
<p style="margin-top: 0px;">Generating enough load to test the system can be challenging, but the individual nodes can be tested independently.</p>
</li>
<li>
<p style="margin-top: 0px;">Developing the expertise to cache the data for speed without corrupting multiple copies is difficult.</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;"><strong>Best for:</strong></p>
<ul style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">
<li>
<p style="margin-top: 0px;">High-volume data like click streams and user logs</p>
</li>
<li>
<p style="margin-top: 0px;">Low-value data that can be lost occasionally without big consequences&mdash;in other words,&nbsp;not&nbsp;bank transactions</p>
</li>
<li>
<p style="margin-top: 0px;">Social networks</p>
</li>
</ul>
<p style="font-family: Verdana; font-size: 16px; background-color: #ffffff;">These are Richards'' big five. They may be just what you need. And if they&rsquo;re not, the right solution could be a mixture of two. Or maybe even three. Be sure to&nbsp;<a style="text-decoration-line: none; font-weight: bold; color: black;" href="https://www.textise.net/showText.aspx?strURL=http%3A%2F%2Fwww.oreilly.com%2Fprogramming%2Ffree%2Fsoftware-architecture-patterns.csp" target="_blank" rel="nofollow noopener">download his book for free</a>; it contains a lot more detail.&nbsp;<strong>If you can think of more, please let us know in the comments.</strong></p>',2,'Programming with Web Technologies',11,'codern',6,'1','link to source website','https://techbeacon.com/app-dev-testing/top-5-software-architecture-patterns-how-make-right-choice'),
 (100,'CHMODE','<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">chmod =&gt; change modification of file permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">In linux their are 3 type of owner and 3 type of permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3 type OWNERSHIP</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">1.user</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">2.group</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3.other</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3 type PERMISSION</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">1.Read</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">2.Write</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3.Excute</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">so chmod means change the ownership and permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">sudo chmod 400</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">here 3 digit mention</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">1st position show ownership of USER === Here 4</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">2st position show ownership of GROUP === Here 0</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3st position show ownership of OTHER === Here 0</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">And number say</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">0=&gt;No permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">1=&gt;Excute</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">2=&gt;Write</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">3=&gt;Execute + Write</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">4=&gt;Read</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">5=&gt;Read + Execute</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">6=&gt;Read +Write</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">7=&gt;Read + Write +Execute</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">So by this</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">sudo chmod 400</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">says</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">for USER it is READ permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">for GROUP it is NO permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">for OTHER it is NO permission</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px 0px 1em; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span style="background: none;">Get more Detail On</span></p>
<p class="q-text qu-display--block qu-wordBreak--break-word qu-textAlign--start" style="margin: 0px; padding: 0px; word-break: break-word; color: #282829; font-family: -apple-system, system-ui, BlinkMacSystemFont, ''Segoe UI'', Roboto, Oxygen-Sans, Ubuntu, Cantarell, ''Helvetica Neue'', sans-serif; font-size: 15px; background-color: #ffffff; box-sizing: border-box; overflow-wrap: anywhere; direction: ltr;"><span class="q-inline" style="box-sizing: border-box; display: inline;"><a class="q-box qu-cursor--pointer qu-hover--textDecoration--underline Link___StyledBox-t2xg9c-0 dxHfBI" style="background: none; text-decoration-line: none; color: #195faa; -webkit-tap-highlight-color: rgba(255, 255, 255, 0.6); cursor: pointer; box-sizing: border-box; position: relative; border-radius: inherit;" title="www.guru99.com" href="https://www.guru99.com/file-permissions.html" target="_blank" rel="noopener nofollow">File Permissions in Linux/Unix with Example</a></span></p>',3,'Programming for Industry',11,'codern',6,'1','https://www.quora.com/What-does-chmod-400-mean','https://www.quora.com/What-does-chmod-400-mean'),
 (101,'SSH Secure Shell Explained','<section class="section main-article-chapter" style="padding-top: 0px; margin-top: 27px; background: 0px center #ffffff; color: #323232; font-family: Arial, sans-serif; font-size: 15px;" data-menu-title="What is SSH?">
<h3 class="section-title" style="font-size: 18px; margin: 0px; line-height: 1.08em; position: relative; padding-left: 0px;">What is SSH?</h3>
<p style="margin: 5px 0px 1.5em; font-size: 16px; line-height: 1.75em; color: #666666;">SSH, also known as Secure Shell or Secure Socket Shell, is a network protocol that gives users, particularly system administrators, a secure way to access a computer over an unsecured network.</p>
<p style="margin: 1.5em 0px; font-size: 16px; line-height: 1.75em; color: #666666;">SSH also refers to the suite of utilities that implement the SSH protocol. Secure Shell provides strong password&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchsecurity/definition/authentication">authentication</a>&nbsp;and&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchsecurity/definition/public-key">public key</a>&nbsp;authentication, as well as&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchsecurity/definition/encryption">encrypted</a>&nbsp;data communications between two computers connecting over an open network, such as the internet.</p>
<p style="margin: 1.5em 0px; font-size: 16px; line-height: 1.75em; color: #666666;">In addition to providing strong encryption, SSH is widely used by network administrators to manage systems and applications remotely, enabling them to log in to another computer over a network, execute commands and move files from one computer to another.</p>
<p style="margin: 1.5em 0px; font-size: 16px; line-height: 1.75em; color: #666666;">SSH refers both to the cryptographic network protocol and to the suite of utilities that implement that protocol. SSH uses the&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchnetworking/definition/client-server">client-server model</a>, connecting a Secure Shell client application, which is the end where the session is displayed, with an SSH server, which is the end where the session runs. SSH implementations often include support for application protocols used for terminal emulation or file transfers.</p>
<p style="margin: 1.5em 0px; font-size: 16px; line-height: 1.75em; color: #666666;">SSH can also be used to create secure tunnels for other application protocols, for example, to securely run X Window System graphical sessions remotely. An SSH server, by default, listens on the standard Transmission Control Protocol (TCP) port 22.</p>
</section>
<section class="section main-article-chapter" style="padding-top: 0px; margin-top: 27px; background: 0px center #ffffff; color: #323232; font-family: Arial, sans-serif; font-size: 15px;" data-menu-title="How does SSH work?">
<h3 class="section-title" style="font-size: 18px; margin: 0px; line-height: 1.08em; position: relative; padding-left: 0px;">How does SSH work?</h3>
<p style="margin: 5px 0px 1.5em; font-size: 16px; line-height: 1.75em; color: #666666;">Secure Shell was created to replace insecure terminal emulation or login programs, such as&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchnetworking/definition/Telnet">Telnet</a>,&nbsp;<a style="color: #007cad; transition: color 0.2s ease 0s;" href="https://www.techtarget.com/searchnetworking/definition/rlogin">rlogin</a>&nbsp;(remote login) and rsh (remote shell). SSH enables the same functions -- logging in to and running terminal sessions on remote systems. SSH also replaces file transfer programs, such as File Transfer Protocol (FTP) and rcp (remote copy).</p>
</section>',0,'Programming with Web Technologies',1,'codern',6,'default','SSH Secure Shell Explained','https://www.techtarget.com/searchsecurity/definition/Secure-Shell'),
 (102,'Simple Storage Service','<p>S3 - Simple Storage Buckets</p>
<p>What you need to know</p>
<p>&nbsp;</p>
<p>Where you host static files and websites</p>
<p>Very cheap</p>
<p>Names S3 Buckets are globally unique</p>
<p>&nbsp;</p>
<p>&nbsp;</p>',3,'Programming with Web Technologies',11,'codern',6,'1','Simple Storage Service','https://egghead.io/lessons/aws-overview-of-s3-simple-storage-service'),
 (103,'Lamda Serverless Functions','<p>What you need to know</p>
<p>Serverless functions</p>
<p>Super Cheap</p>
<p>Various ways to trigger - e.g. a row created in db - or a HTTP endpoint</p>',3,'Programming with Web Technologies',11,'codern',6,'1','Egghead Tutorial','https://egghead.io/lessons/aws-overview-of-aws-lambda-and-api-gateway'),
 (104,'Lamda Serverless Functions','<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 0px 0px 1.33333em; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">Lambda functions are incredibly useful. They are affordable and can be triggered in a variety of ways. One of the most common is through an HTTP endpoint.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.33333em 0px 0px; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;"><strong><span style="color: #2dc26b;">You can make an entire API without ever having to manage a server by writing Lambda functions and creating HTTP endpoints for them using API Gateway.</span></strong></p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.33333em 0px 0px; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;"><strong>What you need to know:-</strong></p>
<p>Serverless functions</p>
<p>Super cheap</p>
<p>Various ways to trigger (as a call to an API endpoint [using a API Gateway] or db row add)&nbsp;</p>',3,'Cloud Infrastructure Fundamentals with AWS',30,'codern',6,'1','egghead course part','https://egghead.io/lessons/aws-overview-of-aws-lambda-and-api-gateway'),
 (105,'Create a Lamda function','<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 0px 0px 1.33333em; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">After creating a lambda function you get access to an in-browser editor where you can write, test, and deploy your function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.33333em 0px 0px; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">When testing your function you get access to a menu where you can edit the event body that gets passed to the lambda function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.33333em 0px 0px; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">&nbsp;</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 0px 0px 1.25em; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">Sam Julien: [0:00] Let''s create our first AWS Lambda serverless function. I''m here in the management console. You might see Lambda in your recently visited services. If not, it''s under Services and just under Compute, the third from the top there. I also like to star mine so that Lambda shows up in my Favorites sidebar over here.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:20] I''ll go ahead and go to Lambda. It''s going to list out your functions. I don''t have any currently. You can go over here to this orange button and click Create Function. It doesn''t matter what region that you''re in right now. We''re going to create one wherever you happen to be.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:36] We''re going to leave this as Author from Scratch. There are also lots of blueprints available on AWS for different types of Lambda functions. Feel free to explore those. You can also use container images, or you can browse a serverless application repository. For us, we''re going to leave this as Author from Scratch because we''re just going to show off the basic "Hello, world!" function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:59] We need to enter a function name. I''m going to type, Egghead Hello Lambda. Then you can choose the runtime. We''re going to use Node.js, but notice here that you can also use things like .NET or Go or Java or Python or Ruby. There''s a lot of different options for what you can run on AWS Lambda. I''m going to leave it at Node. We''re going to leave all these other things just as the default and click Create Function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[1:24] It''ll take Lambda a couple of seconds to spin up this function, but once it''s done, it''s going to take us to our Code Editor. If I scroll down, you can see here that I''ve got the index.js, and it''s just going to return a body of "Hello from Lambda!" I can go ahead and test this by using this test event.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[1:45] There''s no body here in this function quite yet, but that''s OK. We can leave this for now and click Create. Let''s add in a name and hit Create. We can run test. You can see here that we get our Status Code of 200 and our response of body "Hello from Lambda!" Let''s add in a parameter there, just so we can see that what we''re passing through will work.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:09] Inside of this JSON.stringify(), I''m going to change this to event.dog and go ahead and deploy that. Then, in our test, let''s click on this Test, go to Configure Test Event, and let''s replace key1 with dog and replace value1 with bark. Then I''ll delete this, and I''ll hit Save.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:32] Now, if I hit Test again, you can see here that the Status Code is 200, but now, the body is bark. Now, we''ve created our very first Lambda function. It''s just a serverless function. We can change this code in index.js to do whatever we want, calculate things, hit another API.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:50] Easy as that, we didn''t have to actually spin up a server and do any sort of provisioning or anything like that.</p>',1,'Cloud Infrastructure Fundamentals with AWS',31,'codern',6,'1','egghead course part','https://egghead.io/lessons/aws-write-and-test-your-first-aws-lambda-function'),
 (106,'Add API Gateway HTTP Endpoint Trigger to a Lamda Function in AWS','<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 0px 0px 1.25em; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">Sam Julien: [0:00] Now we have our Lambda function, but the only way to trigger it right now is just by clicking on the Test button, like we''ve been doing, to see the response.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:11] If we go up here, you can see we have this Add Trigger button over here. There are a number of different ways that you can actually trigger AWS Lambda functions. The most common way for web developers would be through some API endpoint. You can see here, even though we''ve got this unique identifier for this Lambda function, we can''t actually hit that directly in a browser.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:35] To do that, we''re going to need API gateway. If I click on Add Trigger here and go to Select Trigger, you can see that there are just all kinds of things that you can use to trigger AWS Lambda functions. For example, if you wanted to, you could add a record in a database using DynamoDB, and then have that run a Lambda function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[0:56] To use an HTTP endpoint, though, we''re going to need API gateway. I''ll click on API gateway. I don''t have any API gateways currently created. We''re just going to go ahead and use Create API. There are two types of APIs available for API gateway. It''s very confusing. REST API is the older version and HTTP API is the newer version.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[1:21] Technically, the HTTP API has slightly less features. For this purpose, it doesn''t actually matter, and because it''s the newer one, let''s just go with that. We also need to pick a security mechanism for our endpoint.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[1:32] We''re not going to do any authorization with JWTs or anything. We''re just going to choose open and let whoever access this endpoint. Then I can just go ahead and click Add. If we scroll down and look at these triggers, you can see that now I''ve got this endpoint.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[1:49] The problem is, if I try to open this in the new tab, we haven''t passed anything in. That''s because we have a body that we''re trying to pass in. That''s why we don''t see anything over there. Let''s instead use a tool called Insomnia to test this endpoint.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:05] I''m going to go back to the Trigger here and let''s just copy this endpoint. I''m going to hop over to Insomnia, which is basically just a API testing tool. I''m going to paste this into this API gateway request. If I click Send here, something weird happens.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:22] We get our 200 OK, but we actually don''t get our body back. That''s because what''s happening here is that API gateway is actually wrapping the request and response with its own formatting. It''s a little bit magical. You can go check out the documentation.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[2:40] For our purposes, let''s just fix this really quick and I''ll show you what I mean. If I head back over to our code for our Lambda function, go back over to code. Inside of index.js, we need to do something special. I''m going to delete this to do line here. We actually need to parse out the body from our event that''s being passed to the Lambda function.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[3:03] I''m going to say const body = json.parseevent.body. This is basically going to just pull out the body from the event that API gateway has passed along. Let''s go ahead and come down to line five here. We can replace event with body.dog.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[3:27] Then in order to save this and get it out into the world, we just need to hit this Deploy button. What''s annoying about this is now if we try to test this, we''re going to see that it fails. That''s because we''re accounting for the change that API gateway brings to this equation.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[3:44] On the plus side, if I go back over to Insomnia to test out this endpoint, now I can click on our Send button here and you can see we get back body.dog, which is bark. If I changed bark to woof and hit Send again, now you can see woof.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[4:02] If I go back over to our endpoint, I''ll just show you one more time, we''ve got our code here. That code is parsing the body and just returning back one of our properties. That''s happening through this API gateway endpoint that''s right here.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[4:17] That''s how to create a Lambda function, and then also trigger it as an HTTP endpoint. There''s a lot of different things you can do with Lambda and with API gateway. There''s an endless number of combinations you can try.</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.25em 0px 0px; color: #1f2937; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 16px; background-color: #f9fafb;">[4:30] I just wanted to give you a high-level overview just so you understand the basics of what these two services do.</p>',1,'Cloud Infrastructure Fundamentals with AWS',32,'codern',6,'default','egghead course part','https://egghead.io/lessons/aws-add-an-api-gateway-http-endpoint-trigger-to-a-lambda-function-in-aws'),
 (107,'AWS Next Steps','<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 0px 0px 1.33333em; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">Now that you have a high-level understanding of AWS'' most commonly used services, you are ready to move on to more advanced topics!</p>
<p style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin: 1.33333em 0px; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">In this lesson, I recommend that you learn the following:</p>
<ul style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; list-style-position: initial; list-style-image: initial; margin: 0px; padding: 0px 0px 0px 1.55556em; color: #0a0f19; font-family: ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, ''Segoe UI'', Roboto, ''Helvetica Neue'', Arial, ''Noto Sans'', sans-serif, ''Apple Color Emoji'', ''Segoe UI Emoji'', ''Segoe UI Symbol'', ''Noto Color Emoji''; font-size: 18px; background-color: #ffffff;">
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">Route 53&nbsp; - for all things DNS</li>
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">CloudFront - help content and websites be available with low latency - content delivery</li>
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">CloudFormation - meta service (programmatically spin up new services) - Infrastructure-As-Code - e.g Teraform</li>
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">Amplify - Way to develope mobile and web apps that can scale.&nbsp;</li>
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">IAM - groups/users/roles/security</li>
<li style="box-sizing: border-box; border: 0px solid #e5e7eb; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,0.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; margin-top: 0.666667em; margin-bottom: 0.666667em; padding-left: 0.444444em;">Billing and pricing works in AWS</li>
</ul>',3,'Cloud Infrastructure Fundamentals with AWS',33,'codern',6,'1','Where next','https://egghead.io/lessons/aws-course-outro-where-to-go-after-learning-the-cloud-infrastructure-fundamentals'),
 (108,'demo endpoint s3 bucket','<p>http://richardclark.co.nz.s3-website-ap-southeast-2.amazonaws.com</p>',3,'Cloud Infrastructure Fundamentals with AWS',25,'codern',6,'1','endpoint link for richardclark.co.nz aws s3 bucket','http://richardclark.co.nz.s3-website-ap-southeast-2.amazonaws.com'),
 (109,'s3 sync build CLI command','<p>&nbsp;aws s3 sync build/ s3://richardclark.co.nz</p>',1,'Cloud Infrastructure Fundamentals with AWS',29,'codern',6,'1','Goto my aws management console','https://us-east-1.console.aws.amazon.com/console/home?region=us-east-1'),
 (110,'Connect to your Linux instance using SSH','<h1 id="AccessingInstancesLinux" class="topictitle" style="font-size: 2.25em; margin: 30px 0px 10px; color: #16191f; font-weight: 300; line-height: 1.226em; padding: 0px; scroll-margin-top: 100px; font-family: ''Amazon Ember''; background-color: #ffffff;"></h1>
<div class="awsdocs-page-header-container" style="align-items: center; display: flex; flex-flow: row wrap; justify-content: space-between; margin-bottom: 20px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<div class="H+dM-Hvk-bFSb3XTaZZptw==" style="display: flex; flex-flow: row nowrap; padding: 0px 0px 10px;">&nbsp;</div>
</div>
<p style="font-size: 16px; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">After you launch your instance, you can connect to it and use it the way that you''d use a computer sitting in front of you.</p>
<p style="font-size: 16px; line-height: 1.5em; margin: 1em 0px; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">The following instructions explain how to connect to your instance using an SSH client. If you receive an error while attempting to connect to your instance, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshoot connecting to your instance</a>. For more connection options, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstances.html">Connect to your Linux instance</a>.</p>
<h2 id="ssh-prereqs" style="color: #16191f; border-top-width: 1px; border-top-style: solid; border-color: var(--color-background-control-disabled-0y91m8,#d5dbdb); font-size: 1.625em; line-height: 1.226em; margin-bottom: 0.75em; margin-top: 1em; padding: 1em 0px 0px; scroll-margin-top: 100px; font-family: ''Amazon Ember''; background-color: #ffffff;">Prerequisites</h2>
<p style="font-size: 16px; line-height: 1.5em; margin: 1em 0px; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">Before you connect to your Linux instance, complete the following prerequisites.</p>
<div class="variablelist" style="margin-bottom: 10px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<dl style="margin: 0px;">
<dt style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 3.125px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Check your instance status</span></dt>
<dd style="font-size: 1em; line-height: 1.5em; margin: 0px 1em 1em 18.75px; padding: 0px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">After you launch an instance, it can take a few minutes for the instance to be ready so that you can connect to it. Check that your instance has passed its status checks. You can view this information in the&nbsp;<span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Status check</span>&nbsp;column on the&nbsp;<span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Instances</span>&nbsp;page.</p>
</dd>
<dt style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 3.125px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Get the public DNS name and user name to connect to your instance</span></dt>
<dd style="font-size: 1em; line-height: 1.5em; margin: 0px 1em 1em 18.75px; padding: 0px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">To find the public DNS name or IP address of your instance and the user name that you should use to connect to your instance, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html">Prerequisites for connecting to your instance</a>.</p>
</dd>
<dt style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 3.125px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Locate the private key and set the permissions</span></dt>
<dd style="font-size: 1em; line-height: 1.5em; margin: 0px 1em 1em 18.75px; padding: 0px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">To locate the private key that is required to connect to your instance, and to set the key permissions, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-private-key">Locate the private key and set the permissions</a>.</p>
</dd>
<dt style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 3.125px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Install an SSH client on your local computer as needed</span></dt>
<dd style="font-size: 1em; line-height: 1.5em; margin: 0px 1em 1em 18.75px; padding: 0px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px;">Your local computer might have an SSH client installed by default. You can verify this by typing&nbsp;<span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">ssh</span>&nbsp;at the command line. If your computer doesn''t recognize the command, you can install an SSH client.</p>
<div class="itemizedlist" style="margin-bottom: 0px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Recent versions of Windows Server 2019 and Windows 10 - OpenSSH is included as an installable component. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview" target="_blank" rel="noopener noreferrer">OpenSSH in Windows</a>.</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Earlier versions of Windows - Download and install OpenSSH. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://github.com/PowerShell/Win32-OpenSSH/wiki" target="_blank" rel="noopener noreferrer">Win32-OpenSSH</a>.</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Linux and macOS X - Download and install OpenSSH. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://www.openssh.com/" target="_blank" rel="noopener noreferrer">https://www.openssh.com</a>.</p>
</li>
</ul>
</div>
</dd>
</dl>
</div>
<h2 id="AccessingInstancesLinuxSSHClient" style="color: #16191f; border-top-width: 1px; border-top-style: solid; border-color: var(--color-background-control-disabled-0y91m8,#d5dbdb); font-size: 1.625em; line-height: 1.226em; margin-bottom: 0.75em; margin-top: 1em; padding: 1em 0px 0px; scroll-margin-top: 100px; font-family: ''Amazon Ember''; background-color: #ffffff;">Connect to your Linux instance using an SSH client</h2>
<p style="font-size: 16px; line-height: 1.5em; margin: 1em 0px; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">Use the following procedure to connect to your Linux instance using an SSH client. If you receive an error while attempting to connect to your instance, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/TroubleshootingInstancesConnecting.html">Troubleshoot connecting to your instance</a>.</p>
<div class="procedure" style="margin-bottom: 10px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<p class="title" style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">To connect to your instance using SSH</span></p>
<ol style="margin: 0px; padding: 0px 0px 0px 25px;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">In a terminal window, use the&nbsp;<span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">ssh</span>&nbsp;command to connect to the instance. You specify the path and file name of the private key (<code style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">.pem</code>), the user name for your instance, and the public DNS name or IPv6 address for your instance. For more information about how to find the private key, the user name for your instance, and the DNS name or IPv6 address for an instance, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-private-key">Locate the private key and set the permissions</a>&nbsp;and&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-get-info-about-instance">Get information about your instance</a>. To connect to your instance, use one of the following commands.</p>
<ul style="margin: 0px; padding: 5px 0px 0px 25px; list-style-type: disc;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(Public DNS) To connect using your instance''s public DNS name, enter the following command.</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">ssh -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-user-name</code>@<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-public-dns-name</code></code></pre>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(IPv6) Alternatively, if your instance has an IPv6 address, to connect using your instance''s IPv6 address, enter the following command.</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">ssh -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-user-name</code>@<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-IPv6-address</code></code></pre>
</li>
</ul>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">You see a response like the following:</p>
<pre class="screen hljs" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 16px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;">The authenticity of host ''ec2-198-51-100-1.compute-1.amazonaws.com (198-51-100-1)'' can''t be established.
ECDSA key fingerprint is l4UB/neBad9tvkgJf1QZWxheQmR59WgrgzEimCG6kZY.
Are you sure you want to continue connecting (yes/no)?</pre>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(Optional) Verify that the fingerprint in the security alert matches the fingerprint that you previously obtained in&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-fingerprint">(Optional) Get the instance fingerprint</a>. If these fingerprints don''t match, someone might be attempting a "man-in-the-middle" attack. If they match, continue to the next step.</p>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Enter&nbsp;<code class="userinput" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; font-weight: bold; color: #1d8102; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">yes</code>.</p>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">You see a response like the following:</p>
<pre class="screen hljs" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 16px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;">Warning: Permanently added ''ec2-198-51-100-1.compute-1.amazonaws.com'' (ECDSA) to the list of known hosts.</pre>
</li>
</ol>
</div>
<h2 id="AccessingInstancesLinuxSCP" style="color: #16191f; border-top-width: 1px; border-top-style: solid; border-color: var(--color-background-control-disabled-0y91m8,#d5dbdb); font-size: 1.625em; line-height: 1.226em; margin-bottom: 0.75em; margin-top: 1em; padding: 1em 0px 0px; scroll-margin-top: 100px; font-family: ''Amazon Ember''; background-color: #ffffff;">Transfer files to Linux instances using an SCP client</h2>
<p style="font-size: 16px; line-height: 1.5em; margin: 1em 0px; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">One way to transfer files between your local computer and a Linux instance is to use the secure copy protocol (SCP). This section describes how to transfer files with SCP. The procedure is similar to the procedure for connecting to an instance with SSH.</p>
<div class="itemizedlist" style="margin-bottom: 10px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<p class="title" style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Prerequisites</span></p>
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span class="topcom" style="font-weight: bold;">Verify the general prerequisites for transferring files to your instance.</span></p>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">The general prerequisites for transferring files to an instance are the same as the general prerequisites for connecting to an instance. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html">General prerequisites for connecting to your instance</a>.</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span class="topcom" style="font-weight: bold;">Install an SCP client</span></p>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">Most Linux, Unix, and Apple computers include an SCP client by default. If yours doesn''t, the OpenSSH project provides a free implementation of the full suite of SSH tools, including an SCP client. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://www.openssh.com/" target="_blank" rel="noopener noreferrer">https://www.openssh.com</a>.</p>
</li>
</ul>
</div>
<p style="font-size: 16px; line-height: 1.5em; margin: 1em 0px; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;">The following procedure steps you through using SCP to transfer a file using the instance''s public DNS name, or the IPv6 address if your instance has one.</p>
<div class="procedure" style="margin-bottom: 10px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<p class="title" style="font-size: 1em; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">To use SCP to transfer files between your computer and your instance</span></p>
<ol style="margin: 0px; padding: 0px 0px 0px 25px;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Determine the location of the source file on your computer and the destination path on the instance. In the following examples, the name of the private key file is&nbsp;<code style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">key-pair-name.pem</code>, the file to transfer is&nbsp;<code style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">my-file.txt</code>, the user name for the instance is ec2-user, the public DNS name of the instance is&nbsp;<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">instance-public-dns-name</code>, and the IPv6 address of the instance is&nbsp;<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">instance-IPv6-address</code>.</p>
<ul style="margin: 0px; padding: 5px 0px 0px 25px; list-style-type: disc;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(Public DNS) To transfer a file to the destination on the instance, enter the following command from your computer.</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">scp -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/my-file.txt</code> <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">ec2-user</code>@<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-public-dns-name</code>:<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">path/</code></code></pre>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(IPv6) To transfer a file to the destination on the instance if the instance has an IPv6 address, enter the following command from your computer. The IPv6 address must be enclosed in square brackets (<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">[ ]</code>), which must be escaped (<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">\</code>).</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">scp -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/my-file.txt</code> <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">ec2-user</code>@\[<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-IPv6-address</code>\]:<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">path/</code></code></pre>
</li>
</ul>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">If you haven''t already connected to the instance using SSH, you see a response like the following:</p>
<pre class="screen hljs" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 16px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;">The authenticity of host ''ec2-198-51-100-1.compute-1.amazonaws.com (10.254.142.33)''
can''t be established.
RSA key fingerprint is 1f:51:ae:28:bf:89:e9:d8:1f:25:5d:37:2d:7d:b8:ca:9f:f5:f1:6f.
Are you sure you want to continue connecting (yes/no)?</pre>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">(Optional) You can optionally verify that the fingerprint in the security alert matches the instance fingerprint. For more information, see&nbsp;<a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/connection-prereqs.html#connection-prereqs-fingerprint">(Optional) Get the instance fingerprint</a>.</p>
<p style="font-size: 1em; line-height: 1.5em; margin: 5px 0px 0px; padding: 0px;">Enter&nbsp;<code class="userinput" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; font-weight: bold; color: #1d8102; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">yes</code>.</p>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">If the transfer is successful, the response is similar to the following:</p>
<pre class="screen hljs" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 16px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;">Warning: Permanently added ''ec2-198-51-100-1.compute-1.amazonaws.com'' (RSA) 
to the list of known hosts.
my-file.txt                                100%   480     24.4KB/s   00:00</pre>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">To transfer a file in the other direction (from your Amazon EC2 instance to your computer), reverse the order of the host parameters. For example, you can transfer&nbsp;<code style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">my-file.txt</code>&nbsp;from your EC2 instance to the a destination on your local computer as&nbsp;<code style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">my-file2.txt</code>, as shown in the following examples.</p>
<ul style="margin: 0px; padding: 5px 0px 0px 25px; list-style-type: disc;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(Public DNS) To transfer a file to a destination on your computer, enter the following command from your computer.</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">scp -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">ec2-user</code>@<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-public-dns-name</code>:<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">path/my-file.txt path/my-file2.txt</code></code></pre>
</li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">(IPv6) To transfer a file to a destination on your computer if the instance has an IPv6 address, enter the following command from your computer. The IPv6 address must be enclosed in square brackets (<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">[ ]</code>), which must be escaped (<code class="code" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: var(--color-background-layout-main-q0tbxx,#f2f3f3); border-radius: 2px; padding: 0px 3px;">\</code>).</p>
<div class="cPtrdm-7KdwiPXSFFsHVgw== vJiSh2XhSD0llt9UwFq9AA==" style="display: flex; flex-flow: row nowrap; justify-content: flex-end; padding-left: 30px; padding-right: 10px; padding-top: 12px; position: absolute; right: 0px; z-index: 1; color: inherit; background: linear-gradient(90deg, rgba(250, 250, 250, 0) 0px, rgba(250, 250, 250, 0.9) 50%) !important;" data-testid="codeBtnContainer">
<div class="btn-copy-code" title="Copy">&nbsp;</div>
<div class="L0fhW8ft7887mExW5alCXw==" style="border-radius: 3px; cursor: pointer; font-size: 1.6rem; height: 20px; margin: 0px 0px 0px 3px; padding: 2px; text-align: center; transition: opacity 0.08s ease-in-out 0s; width: 20px; background-color: #fafafa; opacity: 1; border: 1px solid #879596;" tabindex="0" data-testid="copyCodeBtn">&nbsp;</div>
</div>
<pre class="programlisting" style="font-family: monospace, monospace; font-size: 1em; line-height: 1.5em; margin-top: 1em; margin-bottom: 1em; padding: 0px; background-color: #f9f9f9; border: 1px solid var(--color-border-divider-default-k96bks,#eaeded); border-radius: 3px; overflow: auto; position: relative;"><code class="nohighlight hljs" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; background-color: #f9f9f9; display: block; padding: 16px 50px 16px 16px; overflow: auto;">scp -i <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">/path/key-pair-name</code>.pem <code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">ec2-user</code>@\[<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">instance-IPv6-address</code>\]:<code class="replaceable" style="font-family: Monaco, Menlo, Consolas, ''Courier Prime'', Courier, ''Courier New'', monospace; font-size: 1em; color: #f5001d; font-style: italic;">path/my-file.txt path/my-f</code></code></pre>
</li>
</ul>
</li>
</ol>
</div>',1,'Cloud Infrastructure Fundamentals with AWS',20,'codern',6,'1','Connecting via (local) SSH & Key Pairs','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33133050#overview'),
 (111,'Scaling and Load Balancing - Auto Scaling and Load Balancer (EC2 Instances)','<h1><strong>Summary</strong></h1>
<h3>Elasticity Scalability and High Availability</h3>
<p>Workloads don''t necessarily have a even load pattern</p>
<p>Too Little or too much capacity can be a big problem</p>
<p>Being able to scale instantly and automatically is important</p>
<p>Load should also be distributed evenly to avoid downtimes</p>
<h3><strong>Auto Scaling</strong></h3>
<p>Automatically add/remove instances</p>
<p>Set clear rules and min/max requirements</p>
<p>Instance count is adjusted to incoming load based on rules</p>
<p>Use launch templates &amp; VPC / subnet settings</p>
<h3><strong>Elastic Load Balancer</strong></h3>
<p>ALB (Application) and NLB (Network) can be used to distribute traffic evenly</p>
<p>Define target groups (in VPCs/Subnets) and forwarding rules</p>
<p>ALB is perfect for HTTP traffic (and feature-rich)</p>
<p>NLB is great for other network traffic</p>
<p>&nbsp;</p>',0,'Programming with Web Technologies',1,'codern',6,'default','Overview','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080784#overview'),
 (112,'File Storage with EBS EFS and S3','<p>Summary</p>
<p>File Storage Services</p>
<p>store application, user and business or personal files</p>
<p>different kinds of storage, hard drives, file systems and object</p>
<p>EBS EFS FSx Lustre (application best for) &amp; S3 are AWS main storage services</p>
<p>&nbsp;</p>
<p>EBS</p>
<p>Attachable block storage (unformatted hard drives)</p>
<p>Format and structure and use manually</p>
<p>For EC2 instances only</p>
<p>Extras - snapshots, elastic volumes and multi-attach</p>
<p>EFS</p>
<p>Attachable pre-configured file system</p>
<p>Built for (dynamic) scalability and multi-access (by different services or instances)</p>
<p>FSx Luster for High-Performance file access tasks</p>',3,'AWS Certified Cloud Practitioner',39,'codern',6,'1','File Storage Section Link','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080792#overview'),
 (113,'S3 details','<p>Advance s3 Features</p>',3,'AWS Certified Cloud Practitioner',40,'codern',6,'1','S3 Advanced Features','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080836#overview'),
 (114,'S3 vs EBS vs EFS','<p>&nbsp;</p>
<table style="border-collapse: collapse; width: 100.049%;" border="1">
<tbody>
<tr>
<td style="width: 29.8272%;">EBS</td>
<td style="width: 29.8272%;">EFS</td>
<td style="width: 29.8272%;">S3</td>
</tr>
<tr>
<td style="width: 29.8272%;">Attachable hard drives</td>
<td style="width: 29.8272%;">Attachable file system</td>
<td style="width: 29.8272%;">Independent object storage</td>
</tr>
<tr>
<td style="width: 29.8272%;">EC2 Only</td>
<td style="width: 29.8272%;">Multiple Services</td>
<td style="width: 29.8272%;">Access with or without services</td>
</tr>
<tr>
<td style="width: 29.8272%;">Automatic scaling &amp; multi attach possible</td>
<td style="width: 29.8272%;">Automatic scaling &amp; multi attach are key features</td>
<td style="width: 29.8272%;">Unlimited scaling built in</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',40,'codern',6,'1','S3 vs EBS vs EFS','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080840#overview'),
 (115,'S3 Simple Storage Service Section Summary','<table style="border-collapse: collapse; width: 100.049%; border-style: dotted;" border="1">
<tbody>
<tr>
<td style="width: 29.8272%;"><strong>S3 - Object Storage</strong></td>
<td style="width: 29.8272%;"><strong>Managing Objects &amp; Storage</strong></td>
<td style="width: 29.8272%;"><strong>Advanced Features</strong></td>
</tr>
<tr>
<td style="width: 29.8272%;">Focus on the objects/files, not the underlying system</td>
<td style="width: 29.8272%;">Different storage classes for different access patterns</td>
<td style="width: 29.8272%;">Inventory overview and data analytics</td>
</tr>
<tr>
<td style="width: 29.8272%;">Organise files into buckets</td>
<td style="width: 29.8272%;">Lifecycle management</td>
<td style="width: 29.8272%;">Static website hosting</td>
</tr>
<tr>
<td style="width: 29.8272%;">Access (upload, delete, retrieve) via services, CLI, HTTP API, e.t.c)</td>
<td style="width: 29.8272%;">Fine-grained permission management</td>
<td style="width: 29.8272%;">Versioning &amp; object lock</td>
</tr>
<tr>
<td style="width: 29.8272%;">&nbsp;</td>
<td style="width: 29.8272%;">Encryption possible</td>
<td style="width: 29.8272%;">Cross-region or single region cross-bucket replication</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',40,'codern',6,'1','Summary Section 8','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080842#overview'),
 (116,'Memory Caching and ElistiCache','<p>A fully managed in-memory caching database</p>
<p>Used for high need ephemeral in memory data storage (e.g. for Gaming)&nbsp;&nbsp;</p>',3,'AWS Certified Cloud Practitioner',41,'codern',6,'1','Caching Data and ElastiCache','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080880#overview'),
 (117,'AWS Database Types Overview with Use Case Examples','<p>Topic links (opens aws site links)</p>
<p style="font-size: 16px; line-height: 1.5em; margin: 0px 0px 1em; padding: 0px; color: #16191f; font-family: ''Amazon Ember''; background-color: #ffffff;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);">Topics</span></p>
<ul style="margin: 0px; padding: 0px 0px 0px 25px; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#compare-database-services">Compare AWS database services</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-aurora">Amazon Aurora</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-dynamodb">Amazon DynamoDB</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-elasticache">Amazon ElastiCache</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-keyspaces">Amazon Keyspaces (for Apache Cassandra)</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-memorydb-for-redis">Amazon MemoryDB for Redis</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-neptune">Amazon Neptune</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-rds">Amazon Relational Database Service</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-rds-vmware">Amazon RDS on VMware</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-quantum">Amazon Quantum Ledger Database (Amazon QLDB)</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-timestream">Amazon Timestream</a></li>
<li style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;"><a style="background-color: transparent; text-decoration-line: none;" href="https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html#amazon-documentdb">Amazon DocumentDB (with MongoDB compatibility)</a></li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table id="w625aac17c27b7b3" style="scroll-margin-top: 100px; border: none; border-spacing: 0px; position: relative; color: #16191f; font-family: ''Amazon Ember''; font-size: 16px; background-color: #ffffff;">
<thead>
<tr>
<th style="background-color: var(--color-background-container-header-g9rg0j,#fafafa); border-color: var(--color-text-home-header-secondary-g5rqe4,#d5dbdb); color: var(--color-text-heading-default-bjds33,#16191f); font-size: 1em; line-height: 1.5em; margin: 0px; border-style: solid; border-width: 0px 1px 1px 0px; padding: 1em 20px; text-align: left; vertical-align: top; position: sticky; top: -1px; z-index: 100; word-break: normal !important;">Database</th>
<th style="background-color: var(--color-background-container-header-g9rg0j,#fafafa); border-color: var(--color-text-home-header-secondary-g5rqe4,#d5dbdb); color: var(--color-text-heading-default-bjds33,#16191f); font-size: 1em; line-height: 1.5em; margin: 0px; border-style: solid; border-width: 0px 1px 1px 0px; padding: 1em 20px; text-align: left; vertical-align: top; position: sticky; top: -1px; z-index: 100; word-break: normal !important;">Use cases</th>
<th style="background-color: var(--color-background-container-header-g9rg0j,#fafafa); border-color: var(--color-text-home-header-secondary-g5rqe4,#d5dbdb); color: var(--color-text-heading-default-bjds33,#16191f); font-size: 1em; line-height: 1.5em; margin: 0px; border-style: solid; border-width: 0px 1px 1px 0px; padding: 1em 20px; text-align: left; vertical-align: top; position: sticky; top: -1px; z-index: 100; word-break: normal !important;">AWS services</th>
</tr>
</thead>
<tbody>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Relational</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Traditional applications, enterprise resource planning (ERP), customer relationship management (CRM), ecommerce</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/rds/aurora/" target="_blank" rel="noopener noreferrer">Amazon Aurora</a></span>&nbsp;&mdash; Designed for unparalleled high performance and availability at global scale with full MySQL and PostgreSQL compatibility</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/rds/" target="_blank" rel="noopener noreferrer">Amazon RDS</a></span>&nbsp;&mdash; Set up, operate, and scale a relational database in the cloud with just a few clicks</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/redshift/" target="_blank" rel="noopener noreferrer">Amazon Redshift</a></span>&nbsp;&mdash; Accelerate your time to insights with fast, easy, and secure cloud data warehousing at scale</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Key-value</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">High-traffic web applications, ecommerce systems, gaming applications</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/dynamodb/" target="_blank" rel="noopener noreferrer">Amazon DynamoDB</a></span>&nbsp;&mdash; Fast, flexible NoSQL database service for single-digit millisecond performance at any scale</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">In-memory</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Caching, session management, gaming leaderboards, geospatial applications</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/elasticache/" target="_blank" rel="noopener noreferrer">Amazon ElastiCache</a></span>&nbsp;&mdash; Unlock microsecond latency and scale with in-memory caching</p>
</li>
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px; padding-top: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/memorydb/" target="_blank" rel="noopener noreferrer">Amazon MemoryDB for Redis</a></span>&nbsp;&mdash; Redis-compatible, durable, in-memory database service for ultra-fast performance</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Document</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Content management, catalogs, user profiles</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/documentdb/" target="_blank" rel="noopener noreferrer">Amazon DocumentDB (with MongoDB compatibility)</a></span>&nbsp;&mdash; Scale JSON workloads with ease using a fully managed document database service</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Wide column</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">High-scale industrial apps for equipment maintenance, fleet management, and route optimization</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/keyspaces/" target="_blank" rel="noopener noreferrer">Amazon Keyspaces</a></span>&nbsp;&mdash; A scalable, highly available, and managed Apache Cassandra&ndash;compatible database service</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Graph</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Fraud detection, social networking, recommendation engines</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/neptune/" target="_blank" rel="noopener noreferrer">Amazon Neptune</a></span>&nbsp;&mdash; Build and run graph applications with highly connected datasets</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Time series</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Internet of Things (IoT) applications, DevOps, industrial telemetry</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/timestream/" target="_blank" rel="noopener noreferrer">Amazon Timestream</a></span>&nbsp;&mdash; Fast, scalable, serverless time series database</p>
</li>
</ul>
</div>
</td>
</tr>
<tr>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">Ledger</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;">Systems of record, supply chain, registrations, banking transactions</p>
</td>
<td style="border-top: none; border-left: none; font-size: 1em; line-height: 1.5em; margin: 0px; border-right-style: solid; border-bottom-style: solid; border-right-width: 1px; border-bottom-width: 1px; padding: 4px 20px; vertical-align: top; word-break: normal !important;">
<div class="itemizedlist" style="margin-bottom: 10px;">
<ul class="itemizedlist" style="margin: 0px; padding: 0px 0px 0px 25px; list-style-position: outside;" type="disc">
<li class="listitem" style="font-size: 1em; line-height: 1.5em; padding-left: 5px;">
<p style="font-size: 1em; line-height: 1.5em; margin: 0px; padding: 0px;"><span style="font-weight: bolder; color: var(--color-text-heading-default-bjds33,#16191f);"><a style="background-color: transparent; text-decoration-line: none;" href="https://aws.amazon.com/qldb/" target="_blank" rel="noopener noreferrer">Amazon Ledger Database Service (QLDB)</a></span>&nbsp;&mdash; Maintain an immutable, cryptographically verifiable log of data changes</p>
</li>
</ul>
</div>
</td>
</tr>
</tbody>
</table>',1,'AWS Certified Cloud Practitioner',41,'codern',6,'1','AWS Database Options Overview','https://docs.aws.amazon.com/whitepapers/latest/aws-overview/database.html'),
 (118,'Database Section 9 Summary','<table style="border-collapse: collapse; width: 99.9186%;" border="1">
<tbody>
<tr>
<td style="width: 29.9051%;"><strong>Different Database Services</strong></td>
<td style="width: 29.9051%;"><strong>RDS, Aurora &amp; ElastiCache</strong></td>
<td style="width: 29.9103%;"><strong>DynamoDB &amp; More</strong></td>
</tr>
<tr>
<td style="width: 29.9051%;">Self-hosted (on EC2) vs managed services</td>
<td style="width: 29.9051%;">Managed relational databases</td>
<td style="width: 29.9103%;">DynamoDB: Managed high-performance key-value database</td>
</tr>
<tr>
<td style="width: 29.9051%;">SQL (RDS,Aurora) vs NoSQL (DynamoDB, DocumentDB,...)</td>
<td style="width: 29.9051%;">Configure database cluster hardware, network, and behaviour</td>
<td style="width: 29.9103%;">Define partition keys &amp; read/write capacity (or on-demand)</td>
</tr>
<tr>
<td style="width: 29.9051%;">Different databases for different workloads/data requirements</td>
<td style="width: 29.9051%;">Leverage built-in scaling and availability (replication) features</td>
<td style="width: 29.9103%;">Access DynamoDB data via AWS API / SDKs</td>
</tr>
<tr>
<td style="width: 29.9051%;">&nbsp;</td>
<td style="width: 29.9051%;">Access databases via HTTP endpoints / SQL queries</td>
<td style="width: 29.9103%;">Other databases for specific use-cases</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',41,'codern',6,'1','Section 9 Databases Summary','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080900#overview'),
 (119,'Global Networking and CDN Content Delivery Networks','<table style="border-collapse: collapse; width: 100.049%;" border="1">
<tbody>
<tr>
<td style="width: 29.8272%;"><strong>Various Networking Services</strong></td>
<td style="width: 29.8272%;"><strong>Route 53 &amp; CloudFront</strong></td>
<td style="width: 29.8272%;"><strong>AWS Network &amp; Acceleration Services</strong></td>
</tr>
<tr>
<td style="width: 29.8272%;">VPC - Cloud internal networking, nothing to do with the delivery of content&nbsp;</td>
<td style="width: 29.8272%;">Register and manage domains with Route 53</td>
<td style="width: 29.8272%;">Local Zones and Wavelength Rin services closer to your customers</td>
</tr>
<tr>
<td style="width: 29.8272%;">Route 53 DNS Service is for registering domains and define route tables</td>
<td style="width: 29.8272%;">Define request forwarding rules for subdomains</td>
<td style="width: 29.8272%;">Outposts: Run services to your infrastructure</td>
</tr>
<tr>
<td style="width: 29.8272%;">CloudFront - CDN using AWS network edge locations</td>
<td style="width: 29.8272%;">Use Cloudfront for distributing cached content globally</td>
<td style="width: 29.8272%;">Accelerate traffic or data (file) transfers with accelerators</td>
</tr>
<tr>
<td style="width: 29.8272%;">Local Zones - Outposts and Wavelength extended region options to improve latency</td>
<td style="width: 29.8272%;">Target and wrap other services with CF/Route 53</td>
<td style="width: 29.8272%;">&nbsp;</td>
</tr>
<tr>
<td style="width: 29.8272%;">Global Accelerator and Transfer Acceleration - traffic speed up using AWS network</td>
<td style="width: 29.8272%;">&nbsp;</td>
<td style="width: 29.8272%;">&nbsp;</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',42,'codern',6,'1','Summary link','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33080958#overview'),
 (120,'Summary Section 11 Serverless and Containers More Compute','<table style="border-collapse: collapse; width: 100%; height: 262.891px;" border="1">
<tbody>
<tr style="height: 22.3906px;">
<td style="width: 32.1822%; height: 22.3906px;">Serverless &amp; Containers</td>
<td style="width: 32.1822%; height: 22.3906px;">AWS Lamda</td>
<td style="width: 32.1847%; height: 22.3906px;">ECS, EKS, ECR</td>
</tr>
<tr style="height: 98.375px;">
<td style="width: 32.1822%; height: 98.375px;">Alternative to EC2 (where you rent entire servers)</td>
<td style="width: 32.1822%; height: 98.375px;">Serverless, event-driven code execution</td>
<td style="width: 32.1847%; height: 98.375px;">Managed container clusters help with running containers</td>
</tr>
<tr style="height: 39.375px;">
<td style="width: 32.1822%; height: 39.375px;"><strong>Serverless:&nbsp;</strong>On-demand code execution (with a timeout)</td>
<td style="width: 32.1822%; height: 39.375px;">Provide code and define event triggers and execution configuration</td>
<td style="width: 32.1847%; height: 39.375px;">Provide images and environment configuration</td>
</tr>
<tr style="height: 48.375px;">
<td style="width: 32.1822%; height: 48.375px;"><strong>Containers:&nbsp;</strong>Packages of code + required execution environment</td>
<td style="width: 32.1822%; height: 48.375px;">Many supported event types (e.g S3 files changes)</td>
<td style="width: 32.1847%; height: 48.375px;">Run on top of EC2 instances or Fargate (serverless)</td>
</tr>
<tr style="height: 54.375px;">
<td style="width: 32.1822%; height: 54.375px;">Different problems benefit from different solutions</td>
<td style="width: 32.1822%; height: 54.375px;">Assign execution role for permissions</td>
<td style="width: 32.1847%; height: 54.375px;">Manage and distribute images with ECR</td>
</tr>
</tbody>
</table>',1,'AWS Certified Cloud Practitioner',43,'codern',6,'1','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33081184#overview','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33081184#overview'),
 (121,'Application Integration with SQS SNS and EventBridge','<table style="border-collapse: collapse; width: 67.2372%;" border="1">
<tbody>
<tr>
<td style="width: 27.9128%;"><strong>Apps Must Be Integrated</strong></td>
<td style="width: 43.9586%;"><strong>SQS SNS &amp; EventBridge</strong></td>
<td style="width: 28.1824%;"><strong>Step Functions</strong></td>
</tr>
<tr>
<td style="width: 27.9128%;">Different apps often need to communicate with each other</td>
<td style="width: 43.9586%;">SQS is a message queuing service (asynchronous)</td>
<td style="width: 28.1824%;">Step Functions can be used to orchestrate (complex workflows&nbsp;</td>
</tr>
<tr>
<td style="width: 27.9128%;">Apps are not necessarily on the same server or network</td>
<td style="width: 43.9586%;">SNS is a push notification service (synchronous)</td>
<td style="width: 28.1824%;">Steps are linked to executable code/tasks</td>
</tr>
<tr>
<td style="width: 27.9128%;">Building custom solutions (API) can be difficult and expensive</td>
<td style="width: 43.9586%;">EventBridge is an event listening &amp; processing service</td>
<td style="width: 28.1824%;">Steps can be combined in various ways (e.g. conditional logic can be used )</td>
</tr>
<tr>
<td style="width: 27.9128%;">AWS offers dedicated integration services</td>
<td style="width: 43.9586%;">&nbsp;</td>
<td style="width: 28.1824%;">&nbsp;</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',46,'codern',6,'1','udemy linke ','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33084924#overview'),
 (122,'Monitoring','<table style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 32.1822%;"><strong>Monitoring: What and Why</strong></td>
<td style="width: 32.1822%;"><strong>Cloudwatch</strong></td>
<td style="width: 32.1847%;"><strong>Monitoring Other Services</strong></td>
</tr>
<tr>
<td style="width: 32.1822%;">Services and workflows might not always work as intended</td>
<td style="width: 32.1822%;">CloudWatch is AWS''s key monitoring service</td>
<td style="width: 32.1847%;">Default metrics or logs are collected by most services</td>
</tr>
<tr>
<td style="width: 32.1822%;">You want to detect and solve problems as early as possible</td>
<td style="width: 32.1822%;">It collects data (logs, metrics) from other AWS services</td>
<td style="width: 32.1847%;">Extra logging (paid) can be turned on for many services</td>
</tr>
<tr>
<td style="width: 32.1822%;">Monitoring allows you to gain insights &amp; solve problems</td>
<td style="width: 32.1822%;">You can create dashboards, chart metrics &amp; perform analyses&nbsp;</td>
<td style="width: 32.1847%;">Cloudwatch Agent or XRay daemon offer more details</td>
</tr>
<tr>
<td style="width: 32.1822%;">Alerts make sure that you get notified about issues early</td>
<td style="width: 32.1822%;">XRAY &amp; other advanced monitoring features are offered</td>
<td style="width: 32.1847%;">&nbsp;</td>
</tr>
</tbody>
</table>',3,'AWS Certified Cloud Practitioner',47,'codern',6,'1','udemy linke ','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33084954#overview'),
 (123,'Bug fix for using set up of handlebars as view engine in node app','<p><span style="background-color: #ffffff; color: #56595a; font-family: Menlo, Consolas, Monaco, ''Lucida Console'', ''Liberation Mono'', ''DejaVu Sans Mono'', ''Bitstream Vera Sans Mono'', ''Courier New'', monospace, serif; font-size: 1.3rem; box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">function</span></span><span style="background-color: #ffffff; color: #56595a; font-family: Menlo, Consolas, Monaco, ''Lucida Console'', ''Liberation Mono'', ''DejaVu Sans Mono'', ''Bitstream Vera Sans Mono'', ''Courier New'', monospace, serif; font-size: 1.3rem; box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> initWebapp() {</span></p>
<pre class="java" style="box-sizing: border-box; border: 0px; margin-top: 0px; margin-bottom: 0px; padding: 0px; font-family: Menlo, Consolas, Monaco, ''Lucida Console'', ''Liberation Mono'', ''DejaVu Sans Mono'', ''Bitstream Vera Sans Mono'', ''Courier New'', monospace, serif; font-size: 1.3rem; color: #56595a; line-height: 1.45; transition: font-size 0.3s ease 0s; background-color: #ffffff;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> express = require(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''express''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> exphbs  = require(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''express-handlebars''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> path = require(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''path''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> app = express();
</span></span>  
<span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  app.use(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">"/static"</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">, express.</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">static</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">(path.join(__dirname, </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''/static''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">)));
</span></span>  
<span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> filmsRoute = require(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''./routes/FilmRoute''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  app.use(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''/films''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">, filmsRoute);
</span></span>  
<span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">var</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"> hbs = exphbs.</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="HovercardTrigger code-tag must" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 1px 2px; cursor: pointer; font-weight: bold; color: #21252b;"><a class="QueryLink" style="box-sizing: border-box; background: transparent; border: 0px; margin: 0px; padding: 0px; text-decoration-line: none; outline: none;" href="https://www.tabnine.com/code/javascript/functions/express-handlebars/ExpressHandlebars/create">create</a></span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">({defaultLayout: </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''main''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">});
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  app.engine(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''handlebars''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">, hbs.</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="HovercardTrigger code-tag must" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 1px 2px; cursor: pointer; font-weight: bold; color: #21252b;"><a class="QueryLink" style="box-sizing: border-box; background: transparent; border: 0px; margin: 0px; padding: 0px; text-decoration-line: none; outline: none;" href="https://www.tabnine.com/code/javascript/functions/express-handlebars/Exphbs/engine">engine</a></span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  app.</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-keyword" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; font-weight: bold; color: #098081;">set</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''view engine''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">, </span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-string" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #e00640;">''handlebars''</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span>    
<span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;"><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">  app.listen(</span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;"><span class="token-number" style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; color: #606ca6;">3000</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px;">);
</span></span><span style="box-sizing: border-box; border: 0px; margin: 0px; padding: 0px; display: block;">}</span></pre>',1,'Programming with Web Technologies',8,'codern',6,'1','extracted from here on 31/8/22','https://www.tabnine.com/code/javascript/modules/express-handlebars'),
 (124,'Summary Section 17 - Migration to the Cloud and Hybrid Operating (on-premise and cloud)','<table style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 32.1895%;">A Challenge: Moving to the cloud</td>
<td style="width: 32.1895%;">Migration</td>
<td style="width: 32.1895%;">Hybrid Cloud</td>
</tr>
<tr>
<td style="width: 32.1895%;">Not all companies start in the cloud</td>
<td style="width: 32.1895%;">Various migration services offered by AWS</td>
<td style="width: 32.1895%;">Instead of going ''all-in''. hybrid solutions could be preferred</td>
</tr>
<tr>
<td style="width: 32.1895%;">Migration processes can be challenging</td>
<td style="width: 32.1895%;">Application &amp; Database Migration Services, DataSync e.t.c</td>
<td style="width: 32.1895%;">Storage gateway, systems manager and outposts etc</td>
</tr>
<tr>
<td style="width: 32.1895%;">AWS offers services that help with migration</td>
<td style="width: 32.1895%;">Transfer data via internet, VPN or Direct Connect</td>
<td style="width: 32.1895%;">Transfer data via internet VPM or Direct Connect</td>
</tr>
<tr>
<td style="width: 32.1895%;">Companies could also aim for hybrid solutions</td>
<td style="width: 32.1895%;">&nbsp;</td>
<td style="width: 32.1895%;">&nbsp;</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>',1,'AWS Certified Cloud Practitioner',49,'codern',6,'1','udemy link','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33085004#overview'),
 (125,'Extract Transform Load (Big Data - Apache Spark and Hadoop) Data Science Software','<p><span style="color: #0e0618; font-family: ''Proxima Nova'', sans-serif; font-size: 18px; background-color: #ffffff;">Apache Spark is designed as an interface for large-scale processing, while Apache Hadoop provides a broader software framework for the distributed storage and processing of big data. Both can be used either together or as standalone services.</span></p>',3,'AWS Certified Cloud Practitioner',50,'codern',6,'1','Apache Spark Apache Hadoop Explainer','https://www.techrepublic.com/article/apache-spark-vs-hadoop/#:~:text=Apache%20Spark%20is%20designed%20as,together%20or%20as%20standalone%20services.'),
 (126,'Section 18 Data Science & Analytics','<table style="border-collapse: collapse; width: 100%;" border="1">
<tbody>
<tr>
<td style="width: 32.1895%;"><strong>Utilizing Data: A Complex Problem</strong></td>
<td style="width: 32.1895%;"><strong>Data Ingestion &amp; Storage</strong></td>
<td style="width: 32.1895%;"><strong>Transformation &amp; Analytics</strong></td>
</tr>
<tr>
<td style="width: 32.1895%;">Data must be ingested, transformed, stored, and analyzed (<strong>E</strong>xtract <strong>L</strong>oad <strong>T</strong>ransform)</td>
<td style="width: 32.1895%;"><strong>Kineses&nbsp;</strong>helps with ingesting high-frequency streaming data&nbsp;</td>
<td style="width: 32.1895%;">Manual big data workloads can be executed with EMR</td>
</tr>
<tr>
<td style="width: 32.1895%;">Date ingestion can be tricky because of frequency/size</td>
<td style="width: 32.1895%;">Data is buffered and (typically) forwarded to other services</td>
<td style="width: 32.1895%;"><strong>Glue</strong> is a managed serverless ETL solution&nbsp;</td>
</tr>
<tr>
<td style="width: 32.1895%;">Transformation &amp; extraction tasks require efficient compute</td>
<td style="width: 32.1895%;">Data is often stored on S3 following a ''Data Lake'' approach</td>
<td style="width: 32.1895%;">Query raw data (e.g. in S3) with SQL &amp; <strong>Athena</strong></td>
</tr>
<tr>
<td style="width: 32.1895%;">Different analytics tasks need different tools (search vs visuals)</td>
<td style="width: 32.1895%;">Data warehouses can be built with Redshift</td>
<td style="width: 32.1895%;">Perform BI with <strong>QuickSigh</strong>t search &amp; visual with <strong>OpenSearch</strong> &amp; <strong>Grafana</strong></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>',3,'AWS Certified Cloud Practitioner',50,'codern',6,'1','udemy link','https://www.udemy.com/course/aws-cloud-practitioner-complete-aws-introduction/learn/lecture/33085030#overview');
