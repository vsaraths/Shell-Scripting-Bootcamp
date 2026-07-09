# 📦 Day 4: The Magic Box Guide to Variables

Welcome to Day 4! Today we are going to learn how to create your own
**"magic boxes" (Variables)** from scratch, how to put things inside
them, and how to look inside them later.

------------------------------------------------------------------------

## 🏷️ Stage 1: Creating Your First Box (`=`)

Imagine you have an empty cardboard box. You tape a label on the outside
that says `toy`. Then, you drop a `"Robot"` inside the box.

In Bash, we do that exact action using the `=` sign:

``` bash
#!/bin/bash

# 1. Label the box and put something inside
toy="Robot"
color="Red"

# 2. Print a message to see what is inside
echo "My favorite toy is a $toy"
echo "It is painted $color"
```

### 🕹️ Try It Yourself!

1.  Create a file named `my_box.sh`.
2.  Copy the code above into it.
3.  Run it in your terminal:

``` bash
chmod +x my_box.sh
./my_box.sh
```

> ⚠️ **The Golden Rule of Bash Variables:**\
> You cannot have spaces around the `=` sign.

``` bash
toy = "Robot"   # ❌ Wrong
toy="Robot"     # ✅ Correct
```

------------------------------------------------------------------------

## 🔀 Stage 2: Changing What's Inside the Box

The cool thing about variable boxes is that you can empty them out and
put something brand new inside whenever you want! The old item
disappears, and the new item takes its place.

### The Swap Script

Create a file named `box_swap.sh`:

``` bash
#!/bin/bash

# First, the box holds a puppy
pet="Puppy 🐶"
echo "Inside the box, there is a: $pet"

# Now, let's swap it for a cat!
pet="Cat 🐱"
echo "Look again! Now the box holds a: $pet"
```

### 🕹️ Run the Swap!

``` bash
chmod +x box_swap.sh
./box_swap.sh
```

------------------------------------------------------------------------

## 🤫 Stage 3: The Secret Empty Box

What happens if you try to open a box that doesn't exist yet?

Bash won't crash or throw a massive error. Instead, it simply prints
**nothing**.

### The Invisible Ghost Script

Create a file named `ghost.sh`:

``` bash
#!/bin/bash

# We create a box for food, but we NEVER create a box named drink
food="Pizza 🍕"

echo "Today I am eating $food"
echo "Today I am drinking $drink"
```

### 🕹️ Run the Ghost Test!

``` bash
chmod +x ghost.sh
./ghost.sh
```

**Output:**

``` text
Today I am eating Pizza 🍕
Today I am drinking
```

Notice how the script still runs completely fine, but the drink space is
left blank because `$drink` has never been assigned a value.

------------------------------------------------------------------------

# 📊 Summary Table

  -----------------------------------------------------------------------
  Action            Bash Syntax              What It Means
  ----------------- ------------------------ ----------------------------
  Create / Assign   `name="Sarath"`          Put the text `"Sarath"`
                                             inside a box labeled `name`.

  Read / Access     `echo "$name"`           Use the `$` sign to look
                                             inside the box and print its
                                             value.

  Overwrite         `name="Alex"`            Replace the old value with
                                             `"Alex"`.
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 🎯 Key Takeaways

-   Variables are like labeled boxes that store information.
-   Use `=` to assign a value.
-   Never put spaces around the `=` sign.
-   Use `$variable` to access the value.
-   Reassigning a variable replaces the old value.
-   Accessing an undefined variable simply returns an empty string.
