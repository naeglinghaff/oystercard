# Oystercard

A program simulating the oystercard system in London.


## How to test

```
rspec
````

or

```
ruby feature_test.rb
```


## User Story

```
In order to use public transport
As a customer
I want money on my card
```

Feature test:

```
card.balance
```

This should not return any errors and it should return the amount of money we have on the card.

We created a unit test to see if it would accept the method and then match it to an attribute of the Oystercard class.


## User Story

```
In order to keep using public transport
As a customer
I want to add money to my card
```

Feature test

```
card.top_up(100.00)
```

This should give us a no method error and then tell us off for passing a parameter if we haven't specified one in the method.

The next unit test should check to see if the balance instance variable is updated with the correct amount.

## User Story

```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```

Feature test

```
card.top_up(95.00)
```

This shouldn't throw an error at first so we need to write a unit test that will throw one for us.

The exception needs to go into the code to raise the error when the limit is exceeded.

## User Story

```
In order to get through the barriers.
As a customer
I need to touch in and out.
```

Feature test

```
card.touch_in

card.touch_out

card.in_journey?
```

Updated unit tests feature tests all pass. In_journey toggles between true and false when touch_in and touch_out are called.

## User Story
```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```

Feature tests

```
card.touch_in => Error raised if balance isn't sufficient
```
Added a MINIMUM_BALANCE and updated touch_in to raise an error when balance is lower than the MINIMUM_BALANCE
