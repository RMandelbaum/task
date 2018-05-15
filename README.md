## Task Fields

There are many categories of tasks in the world. We would like to give the user the choice of what they need done and then ask them the right questions based on that choice. At the moment, however, we are only asking them for a title and due date.

## Task Categories

The following are a few task categories in the system. Based on what the user needs done, we need to ask her to provide more information by adding fields.

  * Shopping: Store Name (string), List (text), Expected Expenses (dollars)
  * Donation Pickup: Size of vehicle needed (options: bike, car, truck), Address, Receipt needed (boolean)
  * Moving Help: Number of people required (integer), Address
  * House Cleaning: Address, Number of bathrooms (integer), Type of cleaning (options: light, normal, heavy)
  * Other: Title (string), Description (text) 

All fields are required. Each category also has the due date as a required field.

## Considerations

We will have to decide which of the following is important and how to deal with it if it is.

  * Forms Change: some time in the feature, we are likely to ask different questions for each category
  * Adding Categories: many more categories/forms will exist in the system
  * Syncing: we have an iPhone app that will need to ask the same questions
  * Statistics: we may want to understand data about specific fields (are cleanings with 2 bathrooms more common than those with 3)

## Technology

This project has set up a (very) simple Rails app with a Task model using sqlite and a few tests. We're not really stuck on this testing suite or storage mechanism, so please use whatever you like or a hybrid. Sticking with Rails would be helpful, though.

Whatever the system uses needs to be installed by running the setup.sh script.

## Extra Credit

The goal is to just get the creation of these tasks going and create a way to scale this out into many categories. There are plenty of other cool (or obvious) things to try if so inclined.

  * Editing tasks after creation
  * User authentication and per-user tasks
  * Fancy Javascript (jquery/react/backbone/ember) situation
  * Dynamic task category (form) builder
  * An API for an app
# task
