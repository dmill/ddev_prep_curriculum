# HTML and CSS

So far, we've been diving deep into Ruby, which is a full-featured programming language that can be defined as "turing complete" (https://en.wikipedia.org/wiki/Turing_completeness), which basically means that it has the logical complexity to execute any algorithm. All modern programming languages fulfill this requirement, and the skills required to model an algorithm in another programming language like Java or Python is fairly transferrable to Ruby.

Now, we're going to talk about another type of language that is integral to the World Wide Web - HTML (Hypertext Markup Language). HTML is not a programming language, and it does not have logic to execute algorithms. HTML is a markup language - a language used to annotate text in a document. In the case of HTML, tags are included around text, images and other content to tell our web browsers the structure and format of our web pages. That accounts for the "ML" in HTML. The "HT" part of HTML, hypertext, refers to the way that HTML documents contain links to other HTML documents, and these links can exist in the text and other content of the document itself.

CSS (Cascading Stylesheets) is another language that augments HTML to describe the style of an HTML document in greater detail and complexity than is possible with HTML alone. HTML and CSS are the backbones of frontend web development, and it is crucial for a professional web developer to understand how to structure webpages using HTML and style them using CSS. The other main tool of frontend web development, JavaScript, is also a crucial skill that we'll get into later in the DDev course. JavaScript is a full, turing-complete programming language that allows us to inject complex logic and interactivity into our webpages.

## Code Academy Learn HTML & CSS: Part I

<https://www.codecademy.com/learn/learn-html-css>

Head back over to Code Academy and complete their course on HTML/CSS fundamentals.

## Code Academy Make a Website

<https://www.codecademy.com/learn/make-a-website>

This shorter tutorial will expand on the Code Academy intro course.

## Bootstrap

Bootstrap is a CSS framework developed by Twitter to make designing a killer webpage much easier. Bootstrap provides us with a ton of tools out of the box to get our styling looking good quickly. The most important and useful feature of bootstrap is its support for multiple screen sizes (i.e. responsive design). Without a tool like Bootstrap, making your webpage look decent on multiple screen sizes can be a very tedious, bug-prone process. You should have had an intro to Bootstrap in the second Code Academy course above, but if you want to see more check out the following bootstrap tutorials. Some of the them are paid, so you're by no means required to do all of them. We just want to make sure that you have a good idea of the fundamentals of how it works:

<https://teamtreehouse.com/library/bootstrap-4-basics>

<https://www.codeschool.com/courses/blasting-off-with-bootstrap>

<https://www.w3schools.com/bootstrap/>

<https://www.tutorialspoint.com/bootstrap/bootstrap_overview.htm>

## Project

The exercise for this section will provide you with a lot more freedom and creativity than the problems you've been going over in the previous sections. For this part of the prep you're going to build and deploy your own personal website to enhance your understanding of HTML, CSS, and Bootstrap. You can design this website however you want, but if you want an idea of how to build a personal website to use to promote your development services after DDev is over, you can check out my website for some inspiration:

<http://dougmill.com/>

Head on over to Cloud9, and open up the part9 directory. Here, you can see we've laid out a basic HTML page for you (index.html). This file has links to a local css file (styles.css), as well as to bootstrap so this will be included in your page as well. Go ahead and work on your webpage.

**NOTE: I've found that Cloud9 doesn't display the CSS for the local CSS file in the preview for some reason. In order to get a real preview of your webpage, open up the index.html file and hit "run". This should open up a terminal, where you'll see "Starting Apache httpd, serving [SOME LINK]" Click on the link there and you'll get a full preview of your webpage.**

### Deploying your Webpage on the Internet

Once you've finished working on your webpage, you can deploy in on the internet from Cloud9. In order to do this, we'll use a service called Surge (http://surge.sh/). Follow these instructions to deploy your site:

First make sure you're in the exercises/part9 directory:

```
cd ~/workspace/exercises/part9
```
Then, run the following to install surge on your workspace:

```
npm install --global surge
```

Once it finishes, just run surge:

```
surge
```

Follow the instructions, putting in your email address and a password. Hit enter on "project path" for `/home/ubuntu/workspace/exercises/part9/`.

When it finishes you should see:

```
Success! Project is published and running at SOME_LINK.surge.sh
```

Copy and paste that SOME_LINK.surge.sh (it will be a different link for you) into a new browser tab, and you should see your site! Your webpage will be public and available for you to show to anyone.
