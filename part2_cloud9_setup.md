# Part 2: Cloud9 Setup

<https://c9.io/>

## What is Cloud9?

Cloud9 is a service that provides cloud-based development environments that can be easily accessed and used through a web browser. It includes a text editor and a command line interface so that you can write, run and save your code all in one place. We're going to use Cloud9 as our development environment for the rest of this prep curriculum because it is easy to set up and predictable. Cloud9 will also be useful for us because it is easy to share your workspace, which you'll be able to do to collaborate with your classmates and instructors.

If you already have a basic Ruby development environment set up that you're comfortable with, you're not required to use Cloud9. As long as you can work your way through the curriculum and solve all of the problems, you're free to use any environment you wish. However, for most students following this guide and using Cloud9 will be the easiest way to complete the rest of the material here. At the beginning of Destination: Dev we'll spend time helping each of you to get a functioning environment up-and-running on your laptop, but for now Cloud9 will make it easy for you to focus on the concepts and will ensure that your machine is starting from a blank slate once you arrive here, making our job of helping you get set up easier.

## Creating Your Account

1. Head on over to [Cloud9](https://c9.io/), and click on the "Sign In" button at the top of the homepage.
2. On the [login page](https://c9.io/login), click the Github Octocat logo link at the bottom to sign in using your Github account.
3. Authorize the application for the requested access to your Github account.
4. Click the "Create new Cloud9 account" button.
5. Enter your email address, name, and username.
6. on "Tell Us About Yourself", select that you are a student and will use Cloud9 for coursework.
7. Enter your credit card information, but keep in mind that *Cloud9 will not charge you for any of their services unless you explicitly upgrade your account*. Entering your CC info here is only for verification purposes.
8. Connect your Github account (in case it didn't already go through)

Your Account is now all set up!
(*Note: If you had a preexisting Cloud9 account, you can connect your Github account in Settings > Connected Services*)

## Setting Up A Workspace

1. Click on the button in your dashboard to "Create a new workspace".
2. You can fill in whatever kind of name and description you want for your workspace.
3. Leave your workspace public so you can easily share it with instructors and classmates.
4. In the "Clone from Git or Mercurial URL" section, put in the URL for this repo (<git@github.com:dmill/ddev_prep_curriculum.git>).
5. Under "Choose a template" select "Blank".
6. Wait for your workspace container to fire up.

You should now see the contents of this repository in your workspace!

## Writing Your Code

You Can navigate through the file structure of this repo, and open the contained files or create new ones just as you would in a desktop environment. Cloud9 already has automatic Ruby syntax highlighting for an files that end with the .rb extension. Additionally, for .md (Markdown) files like this one, you can see the nicely rendered version of the file by right clicking it and selecting "Preview".

## Running Your Code

If you open up a .rb file, you can click the "Run" button at the top of the screen to run the code. However, I strongly suggest that you use the command line to run your code to get used to doing this. I've also found that just using the command line on Cloud9 is way faster.

From the command line, you can simply run a ruby file in your current directory by typing `ruby ruby_file.rb`. Navigate around using the `cd` command you learned before, and take a look at where you are using `ls` and `pwd`
