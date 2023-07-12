# Unit Testing w/ Jest

[Repo Follow Along](https://github.com/marc-mccarthy/unit-testing-jest)

## Software Testing Intro

- Test Driven Development (TDD)
- Types of Testing
- Unit Testing
- Unit Testing with Jest Example
- Other Test Tools
- Integration Testing (If time permits)

## Test Driven Development - TDD

Test Driven Development (TDD) is a software development approach where tests are written before the code.

Behavior Driven Development (BDD) focuses on describing the behavior of the software rather than the implementation details.

For more information on TDD and BDD, you can refer to this resource: [Link to TDD & BDD](https://codeutopia.net/blog/2015/03/01/unit-testing-tdd-and-bdd/)

## Types of Testing and Reasoning

[Link to Types of Testing](https://www.codeproject.com/Tips/351122/What-is-software-testing-What-are-the-different-ty)

1. [Testing Pyramid](https://cdn-images-1.medium.com/v2/resize:fit:1600/1*6M7_pT_2HJR-o-AXgkHU0g.jpeg)

2. [Testing Pyramid (Alternate)](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.5Pl4ovb8_qXyuAMUSoYl0AHaEK%26pid%3DApi&f=1&ipt=a9f47d9d188275e79c6e6a75ef1f9da7d55eb356d5e1f99bbac7f220720bf2b1&ipo=images)

[Link to Performance Analysis Methodology](https://www.brendangregg.com/methodology.html)

## Unit Testing

Let's identify some positive only test cases for this function:

- Test Suite #1 - Case #1: Pass in two numbers (3 and 5) and expect the sum to be 8.
- Test Suite #1 - Case #2: Pass in two numbers (9 and 20) and expect the sum to be 29.
- Test Suite #1 - Case #3: Pass in two numbers (12 and 21) and expect the sum to be 33.

We will use [Jest](https://jestjs.io/) as our framework for this project.
You can spin up your own [Create React App](https://create-react-app.dev/) which has Jest included. [Vite](https://vitejs.dev/) is also popular but you will need to manually add Jest.

Jest testing was created to address the need for a comprehensive and efficient testing framework for JavaScript applications, particularly those using React. Facebook, being the company behind React, recognized the importance of reliable testing tools to ensure the quality and stability of their applications.

Also, we will utilize the [Jest Snippets](https://marketplace.visualstudio.com/items?itemName=andys8.jest-snippets) extension by andys8 in the Visual Studion Marketplace.

## Unit Testing Example (Live Solve)

**Step 1: Getting Started**

Let's use this sample repo as our place to start: [unit-testing-jest](https://github.com/marc-mccarthy/unit-testing-jest)

To get started with testing, we need to add Jest to our project:

```Shell
npm install jest --save-dev
```

Now create a sub-directory named `equations` and navigate into it with the following commands:

```Shell
mkdir equations
cd equations
```

**Step 2: Write the Test**
So to practice TDD, we're going to write our test first. Then we'll write the code for our actual function.

We'll start by creating a `tests` folder in our project and adding a new JavaScript file called `equations.test.js`.

We'll start by requiring in our code file, then write a test for our first test case in **equations.test.js**

Let' create that file in the `Explorer` tab for our editor and create a test to start us off.

**Step 3: Test Structure**

Jest comes with three different built-in functions for organizing test cases:

- `Describe`

  - Group tests together
  - Helps with readability/organization
  - Can also be nested

- `test` or `it`

  - Encapsulates a "test."
  - Helps with readability/organization
  - Requires a function that will define the actual executable test code to run

- `beforeEach`

  - Runs before each test case in a describe block
  - Sets up preconditions before tests run (if needed)
  - Has a callback function for what code to run before each test

**Step 4: Expect API** We're using a method called `toBe()` to check the equality of values.

[Expect API](https://jestjs.io/docs/en/expect)

**Step 5: Write the Function**

Let's create a `modules` folder in our project and add a `equations.js` file with our function in it. **equations.js**

**Step 6: Run Tests**

Now let's run our test and see if it passes:

```Shell
npm run test
```

**Step 7: Add Script for tests**

Let's add jest to the `test` script now in the `package.json` file.

Run client tests with the following command again:

```Shell
npm run test
```

**Step 8: Refactor some code here**

**Step 9: Add multiple assertions**

**Step 10: Add More Tests (continued)**

There are four more tests to write. We should write a test for each one.

- [x] Pass in two numbers, 3 & 5, and expect it to return 8.
- [ ] Pass in a positive and negative number (1, -2), expect it to still return the sum (-1).
- [ ] Pass in decimal numbers (-1.5, 3), expect it to still return the sum (1.5).
- [ ] Pass in only one value...
  - What do we expect? May need to ask for clarification or make a best guess.
  - Assume the second number is 0 and return the original number.
- [ ] Pass in non-numeric values...
  - What do we expect? Again, may need to get clarification.
  - Try to convert to numbers. If convertable, then return the sum. If not, return `NaN`.

**Quick tips:** If you only want to run one test, you can put `only` after a test initiation in order for it to be the only test ran in that test file. For example:

```JavaScript
it.only('I am Test A', () => {
  expect(addNumbers(1, 2)).toBe(3);
});

it('I am Test B', () => {
  expect(addNumbers(4, 5)).toBe(9);
});
```

will only run the first test. Isolates your test when you execute.

If you have multiple tests in a project, we can target only running a specific test file with this syntax below:

```Shell
npm run test equations.test.js
```

**Continuing with added tests...**

The next test case is about passing in only one value. Let's write the test:

Now, let's run the tests and see the results:

```Shell
npm run test
```

**Step 8: Fixing the Code** The test case for passing in only one value failed. Wn got the wrong value returned than what was expected.

Modify the `addNumbers` function.

Now, let's run the tests and see the results.

**Step 9: Handling Non-numeric Values**

One more test case remains: passing non-numeric values to the `addNumbers` function.

Now, run all the tests to see if they pass...

**Step 8: Fixing the Code**

We need to fix our code to handle this case. Let's modify the `addNumbers` function.

**Step 11: Review Test Results**

In the terminal, if all the tests pass, you should see an output similar to the following:

```Shell
PASS equations/tests/equations.test.js
  equations module
    ✓  should sum two positive numbers together (2 ms)
    ✓  should sum positive and negative numbers together
    ✓  should sum positive and negative decimal numbers together
    ✓  should sum correctly with only one value passed in
    ✓  should sum two strings with a NaN error

Test Suites: 1 passed, 1 total
Tests:       5 passed, 5 total
```

All the tests should pass now!

Last trick for Jest... If you want the tests to continually run without needing to provide the command every time, you can specify `jest --watch` for the `test` script in `package.json`:

```JavaScript
{
  "scripts": {
    "test": "echo Running tests... && jest --watch"
  },
}
```

## Other Test Tools

- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/): Commonly used alongside Jest in React projects for testing components.
- Mocha: A feature-rich JavaScript testing framework that supports both synchronous and asynchronous testing.
- Jasmine: A behavior-driven development (BDD) framework for testing JavaScript code.
- Cypress: A powerful end-to-end testing framework for web applications.
- Selenium: A widely used automated testing framework for web applications.

Based on the nature and complexity of your project, you can choose the most suitable testing tool.

## Integration Testing

Integration Testing is the next step up from Unit Testing. It tests multiple, smaller components together that need to interact in a certain fashion.

Integration testing focuses on verifying that the different parts of the system work together correctly.

```Javascript
// Import the necessary modules or services
const CartService = require('./cartService');
const InventoryService = require('./inventoryService');
const PaymentService = require('./paymentService');

// Integration test example: Placing an order
it('Placing an order should: 1.) deduct items from inventory and 2.) process the payment', () => {
  // Mocked data for the order
  const order = {
    items: [
      { name: 'Shirt', quantity: 2 },
      { name: 'Jeans', quantity: 1 },
    ],
    paymentMethod: 'Credit Card',
  };

  // Create instances of the required services
  const cartService = new CartService();
  const inventoryService = new InventoryService();
  const paymentService = new PaymentService();

  // Place the order
  const placeOrderResult = cartService.placeOrder(order, inventoryService, paymentService);

  // Assertions
  expect(placeOrderResult.success).toBe(true);
  expect(inventoryService.deductItems).toHaveBeenCalledWith([
    { name: 'Shirt', quantity: 2 },
    { name: 'Jeans', quantity: 1 },
  ]);
  // expect.any(Number) will pass with any number
  expect(paymentService.processPayment).toHaveBeenCalledWith('Credit Card', expect.any(Number));
});
```

- Steps above:

  1. Import the necessary modules or services (CartService, InventoryService, PaymentService).

  2. Define the mocked data for the order, including the items and payment method.

  3. Create instances of the required services (cartService, inventoryService, paymentService).

  4. Invoke the placeOrder method of the CartService, passing in the order details and the instances of the other services.

  5. Perform assertions to validate the expected behavior, such as checking the success status of the order, ensuring that the deductItems method of the InventoryService is called with the correct items, and verifying that the processPayment method of the PaymentService is called with the expected payment method.

## Wrap-up

1. Discussed the importance of software testing and introduced the concept of Test Driven Development (TDD).
2. Explored different types of testing and the significance of unit testing in the Testing Pyramid.
3. Wrote and executed unit tests using Jest and learned how integration tests work to test multiple components of a complex application.

Thank you for reading!
