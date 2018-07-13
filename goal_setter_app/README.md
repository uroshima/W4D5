# Goal App

* [Live Demo](http://aa-goals.herokuapp.com/)

# Goal Setter App

Today, we're going to create an app to help people keep track of goals
they set for themselves. We'll also add a social element where people
can view and comment on each other's goals, harnessing the power of
*social* to motivate our users toward their hopes and dreams.

## Learning Goals

  * Know how to write model and controller tests using RSpec
  * Know how to write integration tests using Capybara and RSpec
  * Know what and when to test
  * Understand how to test *behavior* rather than *implementation*
  * Learn to develop one feature at a time (the 'slices' approach)
  * Recognize how **concerns** and **polymorphic associations** can
    _dry_ up your code

## Set Up

Remember to set up your app to use RSpec and Capybara.
(See the [RSpec Setup][rspec-setup] and [Capybara][Capybara] readings.)

Make sure that none of the gems `web-console`, `binding_of_caller`, or
`better_errors` is included in the `:test` group in your Gemfile, as
they can give you false positives in your tests.

Also, pick a name for your app that is not "goal" or "goals", or
anything else that will cause a conflict with a model class name.

*You MUST use git* from the beginning with this project. Commit regularly.
Try to commit at least after finishing each phase.

Feel free to consult the [reading on git][git-reading].

[git-reading]: ../../../ruby/readings/git-summary.md
[git-add]:  ../../../ruby/readings/git-add.md

## Phase I: User Creation & Login

### Model and Controller Tests

Today's main focus will be integration tests, but we will write some model and controller specs as an RSpec warm up!

 1. Generate the models and controllers needed for authentication and user creation. If RSpec setup went according to plan, spec files should be generated for you automatically. Do not write out your `User` model just yet - we are going to write this app TDD style!
 2. Write model specs for `User`. Remember, model specs should test your model's validations, associations, and class scope methods (eg. `User::find_by_credentials`). Use `shoulda-matchers` to write tests for each of the validations in your user model. You won't have any associations written on your user model to begin with; go back and fill these in as you go. Refer to the reading on [RSpec Model Testing](../../readings/rspec-models.md) and last night's homework as needed.
 3. Next, write controller tests for each action in your `UsersController`. Refer to the [RSpec Controller reading](../../readings/rspec-controllers.md) and last night's homework as needed.
 Refer to [rails testing docs][rails-testing-controller-docs] to learn how to pass data in the controller tests.

Run your specs and watch them fail. Now, implement `User` and `UsersController` and experience the joy of turning your specs green!

Let's skip any other model or controller specs so we can move on to new material, writing integration tests.

[rails-testing-controller-docs]: http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers

### Integration Tests

For the remainder of the day, we'll be writing integration tests and utilizing the joyous creature that is Capybara!

 1. Write integration tests for just this feature. (Tests should fail at
 beginning.) Write only one test at a time before implementing the
 corresponding feature logic.

  Here is an outline to get you started for the Authentication
  integration tests:

  ```ruby
  # spec/features/auth_spec.rb

  require 'spec_helper'
  require 'rails_helper'

  feature 'the signup process' do
    scenario 'has a new user page'

    feature 'signing up a user' do

      scenario 'shows username on the homepage after signup'

    end
  end

  feature 'logging in' do
    scenario 'shows username on the homepage after login'

  end

  feature 'logging out' do
    scenario 'begins with a logged out state'

    scenario 'doesn\'t show username on the homepage after logout'

  end

  ```

Start filling in the missing test logic, one test at a time.

 1. After you fill in each test, implement enough of the application
 logic to make the test pass. Then go back and write the next test.

 2. Refactor any obvious bugs or flaws which remain.

This is the 'Red, Green, Refactor' approach.

[rails-5-updates]: ../../readings/rails-5-updates.md
[rspec-setup]: ../../readings/rspec-and-rails-setup.md
[capybara]: ../../readings/capybara.md

## Phase II: Goals

Let's move on to the 'goals' feature. Users should be able to CRUD
(create, read, update, and delete) their goals. Goals can be private or
public - other users should not see 'private' goals, but a user should
see all of their own goals.

Implement the feature test-first: red to green!

Think of a way for the user to keep track of which goals are completed.
When writing a test for this, focus on testing the behavior rather than
the feature's implementation. In this case, that means your test should
work if the user can track their goal completion, regardless of how the
code behind that feature works.
