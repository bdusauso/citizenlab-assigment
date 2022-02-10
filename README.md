# CitizenLab Back-End Engineer Assignment

## Introduction

The goal of this assignment is to develop an API that allows citizens to browse through participation projects.

## Assignment

### The model

The app that will use your API displays participation projects. A project can optionally be contained in a folder. A folder can also be contained in a folder. Projects can have associated topics, folders can't.

There's some sample data in `sample_data.json`, which you can use to seed your database, if you want. The sample data is there to save you some time, not to influence you on how to structure your data models. Feel free to model it the best way you see fit.

### The API

- [x] Implement a data model that can be persisted in a database
- [] Load in the sample data

Implement the following API endpoints that return json.

`GET /items?parent=folder_id`
- [x] Returns a single array with a mix of projects and folders
- [x] When the `parent` parameter is passed, only the direct children of the given folder are returned
- [x] If no parent is given, the root items are returned
- [x] All returned items are sorted from newest to oldest

`GET /tree?search=sometext`
- [ ] Returns a tree structure with all the folders and projects
- [ ] When no search parameter is passed, the complete tree should be returned
- [ ] When the `search` parameter is passed, the tree is only populated with items that contain the given text. Folders that have descendents that contain the text should also be included. Folders that don't contain the text and have no descendents that do, should not be included.

Issues and blockers can't always be predicted and writing software under time pressure is hard. It's okay if you don't get everything done. Include this checklist in your own README file and cross (`[x]`) the things you were able to do.

### Bonus

We prefer that you focus on covering the base requirements. Quality over quantity. In case you'd have time left, here are some bonus things you could amaze us with.

- [+/-] Make your solution work in Docker
- [ ] Surprise us :)

## Rules

* You have **3 hours** to get as far as you can. We'll only take commits within the 3 hour limit into account.
* You can use **any mix of languages, libraries or frameworks** you want. Pick whatever you're comfortable with, it won't affect your evaluation. When in doubt, at CitizenLab we love Ruby.
* If you base some of your work on **specific code snippets**, StackOverflow answers, gists or tutorials, add a link to them in your code comments. We don't consider this a weakness.
* You've **written** all code that doesn't include such a comment **yourself**.

## Getting started

1. This repository is yours alone to work in. You can clone it on your local machine and start committing to it.

2. Make sure to update the README with instructions on how to run your solution and the filled out above checklist.

3. Make sure all your work is commited and pushed at the end of the 3 hours.

## Evaluation

We will evaluate your solution over these axis:

* **Requirements** Does the solution conform to our description?
* **Engineering** Does your architecture make sense? Is the data model sane? Is it fast enough? How does it scale?
* **Maintainability** Is your code simple enough? How did you name things? Have you written any tests? Are you correctly applying dependencies?

We'll discuss your work in the following interview. The conversation about the way you've got there will be at least as important as the result of the assignment itself.

Thank you and good luck!
