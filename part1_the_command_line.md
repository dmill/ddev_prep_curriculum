# Part 1: The Command Line

## CLIs vs. GUIs

Great job getting through Part 0 and the fundamentals of programming in Ruby! Now, we're going to give you a little break from Ruby programming and get you started on practicing with a skillset that is crucial to becoming a successful software developer - the command line.

One of the biggest developments in the history of software and probably the main factor that brought computers to the masses was the development of the [graphical user interface (GUI)](https://en.wikipedia.org/wiki/Graphical_user_interface). Prior to the introduction of GUIs, users interacted with computers primarily through a command line interface (CLI). GUIs make using a computer intuitive, as they place visual abstractions on top of common operations like opening files, running programs, unzipping zip files, etc.

CLIs, on the other hand, are not very intuitive. With a CLI, users interact with their computer by issuing typed text commands from their keyboard. This requires the user to know specific commands that cannot be easily inferred, creating a much steeper learning curve. With a GUI, most operations are initiated with a mouse click, and the operating system or software in use will generally guide the user to the operation they wish to perform. With a CLI this is not the case. For example, if you want to get rid of a file using your operating system GUI, you'll usually drag and drop the file *into* a trash can icon. This abstraction is very intuitive and mirrors an action that undertake every day in the real world. However, deleting a file using a CLI is significantly more complicated. Let's say you want to delete a file on your Desktop in OS X. The first thing you'll do is use your GUI to fire up the terminal program. Then, you'll have to issue the following commands:

    cd Desktop

When you fire up your terminal, you'll start in a particular folder, or **directory**, in your computer's file system. It turns out, to your operating system, the Desktop is just another folder like any other - it just has some special properties applied to it by your GUI. So, the first thing you have to do is enter the `Desktop` folder. We do this in Unix-based operating systems (generally OS X and Linux nowadays) with the `cd` command. `cd` stands for "change directory". Now, if we don't remember the name of our file exactly, we'll have to look around in the Desktop to figure out what it's called. This is how we do that on the command line, where we can't see the contents of the Desktop visually:

    ls

The `ls` command will "list" the contents of our current directory, in this case the Desktop, printing them to the screen. Now we'll be able to see the name of our file, let's say it's `secret_document.txt`. Finally, we can issue the command to delete it:

    rm secret_document.txt

Voila! Finally we're done, but as you can see that took quite a bit more work than the intuitive dragging and dropping we did using our GUI. To make matters worse, let's say we have a folder on our Desktop called `secret_documents`, and we want to delete the whole thing. How do we do that using our GUI? Duh - you just drag and drop the folder into the trash can just like you did with the file. So, on our command line, we can just run `rm secret_documents`, right? Wrong. `rm` can only be used to delete individual files. In order to delete our entire folder, we'll have to run:

    rm -rf secret_documents

We still use `rm`, but we have to pass it the `-r` and `-f` options. `-r` stands for recursive, which essentially means delete every file in this directory, but also if there is a directory inside of this directory delete every file in there as well, all the way down through potentially hundreds of nested directories. `-f` stands for "force". If you don't use `-f`, `rm` will ask you over and over again for confirmation that you want to delete certain files, and this could potentially take forever.

## Why do we care about CLIs then?

Hopefully I've proven to you that using the command line is signficantly more complicated and far less user-friendly for beginners than using a GUI. So why are we talking about them at all? Isn't the CLI just an antiquated technology that stopped being necessary back in the 80s? Well, it turns out no - CLIs are still used extensively by software developers, systems administrators, and other technology professionals. It turns out that even though CLIs are much harder to use for beginners and have a much steeper learning curve than GUIs, once you get experience with the CLI it becomes much faster to use the CLI than the GUI to perform a lot of routine tasks. Furthermore, many operations are not as easy to abstract visually as the example above of deleted a file. In many cases, it becomes far less complicated to use the command line than to navigate through screen after screen of unintuitively placed menus and options. Finally, as developers we often need to work with production servers in environments like Amazon Web Services (AWS) remotely. These servers generally do not have GUIs, as the performance of using a remote GUI can be problematic and/or costly, and everyone who is interacting with the production server should know how to use the command line anyway.

## Code Academy Command Line Course

<https://www.codecademy.com/learn/learn-the-command-line>

Yep, we're back to Code Academy. Unfortunately at this point you're probably going to have to put down your credit card in order to access this course. However, $19.99 for a month is going to be well worth it as you will be gearing up for the summer. You'll have the opportunity to check out even more of their amazing content. So please head to Code Academy, Sign Up and take this course!


## Launch School Introduction to the Command Line

<https://launchschool.com/books/command_line/read/introduction>

Launch School has some great free resources that we'll see more of later. At the beginning of this guide, they're going to ask you to use a cloud service like Cloud9 or Digital Ocean if you don't feel comfortable working directly on your own computer (it is possible to mess things up learning the command line on your own computer, but if you're careful you should be fine. Additionally, if you frequently back up your computer, which you should be doing anyway, this shouldn't be an issue.). If you don't want to use your computer, or if you are not running OS X or some flavor of Linux (i.e. Windows I'm assuming), you can use Cloud9 as they suggest and follow our guide in the next section to get that set up ([Part 2](part2_cloud9_setup.md)).

## Practice

One of the best ways to level-up your skils with the command line is to force yourself to start using it for routine tasks. While you're on your computer and you want to perform some operation - let's say opening Google Chrome, creating a new folder, unzipping a .zip file you downloaded, etc. - see if you can figure out how to do it from the command line. At first it's going to be a lot more tedious, but it will get easier and easier as you learn and memorize commands. The more you can do this the better, and it will prepare you to have a significant productivity advantage when Destination: Dev starts.

## Cheatsheets
<https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/>

<https://www.codecademy.com/articles/command-line-commands>
