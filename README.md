# fruitbasket

Run FruitBasket.rb with your "basket.csv" as an argument. No other arguments are necessary or will be accepted.

  $ FruitBasket.rb basket.csv

"basket.csv" must be named exactly and have the following fields: name,size,color,shape,days

See the basket_TEMPLATE.csv file for reference.

When run, FruitBasket.rb will return the following data based on your basket.csv file:
1 - The total number of fruits in basket.csv
2 - How many types of fruit (i.e. names) are in basket.csv
3 - The number of each type (name) of fruit, in descending order of quantity
4 - The number of fruits of each unique character profile (the same name, color, and shape)
5 - How many and which types (names) of fruit have been in your basket for over 3 days

For best results, all strings should be singular and all lowercase (i.e. apple not apples, red not RED)
