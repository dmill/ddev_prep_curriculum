# Refactoring

In many respects, the process of writing software is similar to the process of writing prose. Good programmers write their code in drafts, and the process of producing reliable software is not done when the code runs. The programmer is not even necessarily done if the program is bug free. And, just like with any essay you wrote in high school, the first draft is generally not very good. Refactoring is the process of rewriting our code to make it better. We can refactor our code to make it:

1. **More performant.** We often don't see performance problems with our code until we have real users interacting with it in a live environment. We can refactor our code to make it faster or use less memory.
2. **Bug free.** No matter how many tests you write or how thoroughly you QA your code, it will inevitably have bugs. Rewriting code is crucial to fixing unintended behavior.
3. **Extensible.** Often times, systems will be written with a fairly small scope in mind, and then will become one of the building blocks of a much more complex system. We can change the organization and architecture of our code in order to make it easier to modify and build on top of.
4. **Understandable.** We're not only communicating with the computer with our code - we're also communicating with other developers who will have to read it later. Code should not be esoteric and complicated - it should be clear and simple.
5. **Aesthetically pleasing.** Everyone prefers to read code that adheres to style conventions and is symmetrical on the page. Ruby is known as being one of the most beautiful programming languages - try to keep it that way.

These are just a few of the most common reasons for refactoring code. Now, check out the resources below to learn about some specific concepts you can bring to your code when you look to refactor it.

## DRY

The concept of DRY (Don't Repeat Yourself) is fundamental to writing high-quality programs. If you see yourself writing the same thing over and over again, this is a sign that you are missing an abstraction in your code or could have architected things better. Read more here:

<https://en.wikipedia.org/wiki/Don%27t_repeat_yourself>

<https://code.tutsplus.com/tutorials/3-key-software-principles-you-must-understand--net-25161>

## Single Responsibility Principle

The single responsibility principle states that each unit of our code - be it a function, method, class, or module - should only be responsible for on piece of functionality in a program. The importance of this concept cannot be stressed enough, and if kept in mind can go a long way to improving all 5 of the common rfeactoring considerations listed above. Read more about SRP here:

<https://en.wikipedia.org/wiki/Single_responsibility_principle>

<https://www.sitepoint.com/solid-ruby-single-responsibility-principle/>

<https://robots.thoughtbot.com/back-to-basics-solid>

## Code Style

While a lot about style is subjective, every programming language has style standards that programmers have coalesced around organically. Ruby is no exception. Whenever possible, try to follow the style rules in the guide below, but keep in mind that style has a lot to do with preference. If you have a good reason for not following one of the rules (even if that rule is just that you prefer your code to look a different way), feel free to follow your own aesthetic.

<https://github.com/bbatsov/ruby-style-guide>

## Exercises

There are no specific exercises here for this section. However, you have written a lot of code recently, and I'd be willing to bet you haven't refactored most of it. Take a look at some of your solutions to previous exercises here or elsewhere, and see how you can apply the principles above to improve it.


