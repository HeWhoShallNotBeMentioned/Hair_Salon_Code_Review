# _Hair Salon Code Review_

##### _Allows a salon to add clients to individual stylists., {8/21/2015}_

#### By _**Chris Underwood**_

## Description
Allows a salon to add clients to individual stylists using a one to many relationship. Data is stored in Postgres, backend is written in Ruby, front end in Sinatra.


## Setup

This does not include Active Record so database tables will need to be setup using the following code:

CREATE DATABASE hair_salon;
CREATE TABLE clients (client_id serial PRIMARY KEY, client_name varchar, stylist_id int);
CREATE TABLE stylists (stylist_id serial PRIMARY KEY, stylist_name varchar);
CREATE DATABASE hair_salon_test TEMPLATE hair_salon;

_{Leave nothing to chance! You want it to be easy for potential employers and collaborators to run your app. Do I need to run a server? How should I set up my databases? Are there other applications this app depends on?}_

## Technologies Used

_{Tell me about the languages you used to create this app. Assume that I know you probably used HTML and CSS. If you did something really cool using only HTML, point that out.}_

### Legal

*{This is boilerplate legal language. Read through it, and if you like it, use it. There are other license agreements online, but you can generally copy and paste this.}*

Copyright (c) 2015 **_{List of contribtors}_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
