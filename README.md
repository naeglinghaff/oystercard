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
