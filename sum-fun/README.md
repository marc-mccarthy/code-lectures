# Testing Lecture

## Personal Intro

Hello everyone! I hope you're doing well. Today, I want to congratulate each one of you on your solo projects and wish you the best of luck with your client projects. I also want to express my gratitude to Chris for giving me the opportunity to deliver this lecture.

## Software Testing Intro

Let's start by discussing the fundamentals of software testing. In this section, we will cover the following topics:

- Test Driven Development (TDD)
- Types of Testing
- Unit Testing
- Unit Testing with Jest Example
- Other Test Tools
- Integration Testing (If time permits)

## Test Driven Development - TDD

Test Driven Development (TDD) is a software development approach where tests are written before the code. This methodology encourages thinking about the code in advance, leading to improved code quality.

TDD often goes hand in hand with Behavior Driven Development (BDD). BDD focuses on describing the behavior of the software rather than the implementation details. It emphasizes stating what a function should do in the test.

For more information on TDD and BDD, you can refer to this resource: [Link to TDD & BDD](https://codeutopia.net/blog/2015/03/01/unit-testing-tdd-and-bdd/)

## Types of Testing and Reasoning

Let's explore the various types of software testing. You can refer to this resource for an overview of different testing types: [Link to Types of Testing](https://www.codeproject.com/Tips/351122/What-is-software-testing-What-are-the-different-ty)

To understand the importance of unit testing, we'll discuss the Testing Pyramid concept. The Testing Pyramid illustrates the ideal distribution of different types of tests, with unit tests at the base. Unit tests form the foundation of the Testing Pyramid, providing validation of individual components prior to grouping those components together.

You can refer to these resources for visual representations of the Testing Pyramid:

1. [Testing Pyramid](https://cdn-images-1.medium.com/v2/resize:fit:1600/1*6M7_pT_2HJR-o-AXgkHU0g.jpeg)

2. [Testing Pyramid (Alternate)](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.5Pl4ovb8_qXyuAMUSoYl0AHaEK%26pid%3DApi&f=1&ipt=a9f47d9d188275e79c6e6a75ef1f9da7d55eb356d5e1f99bbac7f220720bf2b1&ipo=images)

Additionally, I'll share some of my experience with the Drunk Man Anti-Method, a performance analysis methodology. I'm sure you all will know exactly what I'm talking about right now!

You can find more information on performance analysis methodology here: [Link to Performance Analysis Methodology](https://www.brendangregg.com/methodology.html)

## Unit Testing

Now, let's dive into unit testing, which is a crucial task for developers. Unit testing involves writing tests to ensure that individual functions or units of code behave as expected. Best practice is to test small, isolated pieces of code, typically single functions or methods.

To demonstrate unit testing, we'll create and test a simple function that takes two numbers and returns their sum. Let's identify some test cases for this function:

- Test Suite #1 - Case #1: Pass in two numbers (3 and 5) and expect the sum to be 8.
- Test Suite #1 - Case #2: Pass in two numbers (9 and 20) and expect the sum to be 29.
- Test Suite #1 - Case #3: Pass in two numbers (12 and 21) and expect the sum to be 33.

We will use [Jest](https://jestjs.io/), a popular testing framework for JavaScript, to write and execute our unit tests. Jest provides a simple and intuitive API for creating test cases and assertions. You can spin up your own [Create React App](https://create-react-app.dev/) which has Jest included. [Vite](https://vitejs.dev/) is also popular but you will need to manually add Jest.

Also, we will utilize the [Jest Snippets](https://marketplace.visualstudio.com/items?itemName=andys8.jest-snippets) extension by andys8 in the Visual Studion Marketplace.

Let's write our test cases using Jest!

## Unit Testing Example (Live Solve)

**Step 1: Getting Started** Let's make a new directory and node project:

To get started with testing, we need to add Jest to our project. We'll use npm to get the Jest package and add it to our project as a dependency.

```Shell
npm install jest --save-dev
```

This will add the jest dependencies under your development dependencies in your package.json. Just for a little context, you specify the packages your project depends on as either a "dependencies" or "devDependencies" in your package's package.json file.

- **Dependencies (dependencies):**

  - Dependencies listed under the dependencies section are the packages required for the normal runtime or production use of the project.
  - These packages are necessary for the project to function properly when it is deployed or used in a production environment.
  - They are installed by default when someone installs or runs your project as a dependency.

- **Development Dependencies (devDependencies):**
  - Dependencies listed under the devDependencies section are packages that are only required during the development process.
  - These packages are used for tasks such as testing, building, linting, or development-specific utilities.
  - They are not necessary for the normal runtime or production use of the project and should not be deployed in a production environment.

By adding `--save-dev` we told npm to add this as a development dependency to our project. Look at your `package.json` file now. Notice that a new property `devDependencies` was added:

```JavaScript
{
  "name": "unit-testing-jest",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "jest": "^29.5.0"
  }
}
```

Now create a sub-directory named `equations` and navigate into it with the following commands:

```Shell
mkdir equations
cd equations
```

**Step 2: Write the Test**
So to practice TDD, we're going to write our test first. Then we'll write the code for our actual function.

We'll start by creating a **equations.js** file in our repo folder.

Next, we will create a **__tests__** folder in the same place. 

Add a new JavaScript file called **equations.test.js** into the **__tests__** folder.

We'll start by working in our test file, **equations.test.js**, that we just created.

Let's require in our **equations.js** file at the top, then write a test for our first test case.

```JavaScript
const { addNumbers } = require('../equations.js');

describe('addNumbers function', () => {
  it('should add two positive numbers together', () => {
    // create your sample inputs
    const mockNum1 = 3
    const mockNum2 = 5

    // acting Logic
    const result = addNumbers(mockNum1, mockNum2)

    // assertion to determine pass/fail
    expect(result).toBe(8)
  })
})
```

**Step 3: Test Structure** Notice how we have structured this test code. Jest comes with three different built-in functions for organizing test cases. Describe is often the outermost organization function for Jest tests. It can group tests together, making them serve as ongoing unit tests and documentation/comments at the same time. It takes in text that can be used as a descriptor for why the tests are grouped. `describe` functions can also be nested when it makes sense.

`test` or `it` functions are other global functions provided by Jest that will encapsulate a "test." We can give it a string of descriptive text. It also requires a function that will define the actual executable test code to run.

- `beforeEach` function which allows you to initialize common variables, set up mock objects, establish database connections, or perform any necessary setup actions that are required by one, or multiple, test cases.

**Step 4: Expect API** We're using a method called `toBe()` to check the equality of values. There are alot of other methods used in Jest. It's extensive, but for this example, we will just use `toBe()`. It works similarly to using `===` but also handles objects pretty well. There are a whole slew of specific methods for testing other things, like Booleans, Arrays, NaN, etc.

[Expect API](https://jestjs.io/docs/en/expect)

**Step 5: Write the Function** Now let's write the code for our function in a way that we expect it to pass the test.

Let's add the below code to the **equations.js** file to create our function.

```JavaScript
function addNumbers(num1, num2) {
  // add two numbers that were provided
  const result = num1 + num2;

  // return the sum of both numbers
  return result;
}

module.exports = {
  addNumbers
};
```

**Step 6: Run Tests** Now let's run our test and see if it passes.

Run client tests with the following command:

```Shell
npm run test
```

Notice how we aren't running Jest yet. Node is only referencing text when we run `test` as a script.

Let's add jest to the `test` script now in the `package.json` file. We are going to concatenate with some helpful text in our terminal whenever we run this script:

```JavaScript
{
  "scripts": {
    "test": "echo Running Tests... && jest"
  },
}
```

This tells Node to run Jest, which will go through your project and look for test files to run. It's looking for the `*.test.js` files and running theme specifically.

Run client tests with the following command:

```Shell
npm run test
```

You should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.268 s, estimated 1 s
Ran all test suites.
```

Once it passes, let's refactor some of this code to be simpler.

Refactor our **equations.test.js** file:

```JavaScript
const { addNumbers } = require('../equations.js');

describe('addNumbers function', () => {
  it('should add two positive numbers together', () => {
    // create your sample inputs
    const [mockNum1, mockNum2] = [3,5]

    // assertion to determine pass/fail
    expect(addNumbers(mockNum1, mockNum2)).toBe(8)
  })
})
```

Refactor our **equations.js** file:

```JavaScript
function addNumbers(num1, num2) {
  // return the evaluation of adding the two numbers that were provided
  return num1 + num2;
}

module.exports = {
  addNumbers
};
```

You should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.265 s, estimated 1 s
Ran all test suites.
```

Now, you can also add multiple `expect` assertions to one test. Let's try and add all the test cases above that we identified above. Your whole test should end up looking like this:

```JavaScript
const { addNumbers } = require('../equations.js');

describe('equations function', () => {
  describe('addNumbers function', () => {
    it('should sum two positive numbers together', () => {
      // create your sample inputs
      const [mockNum1, mockNum2, mockNum3, mockNum4, mockNum5, mockNum6] = [3, 5, 9, 20, 12, 21];

      // assertion to determine pass/fail
      expect.assertions(3);
      expect(addNumbers(mockNum1, mockNum2)).toBe(8);
      expect(addNumbers(mockNum3, mockNum4)).toBe(29);
      expect(addNumbers(mockNum5, mockNum6)).toBe(33);
    });
  })
})
```

You should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)

Test Suites: 1 passed, 1 total
Tests:       1 passed, 1 total
Snapshots:   0 total
Time:        0.274 s, estimated 1 s
Ran all test suites.
```

**Step 7: Add More Tests (continued)** We had a lot of test cases identified earlier.

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

The next two test cases test our sum with different types of numbers - negative and decimal values.

Let's write the tests at the end (inside) our only `describe` block:

```JavaScript
it('should sum positive and negative numbers together', () => {
  expect(addNumbers(1, -2)).toBe(-1);
});

it('should sum positive and negative decimal numbers together', () => {
  expect(addNumbers(-1.5, 3)).toBe(1.5);
});
```

You should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)
    √ should sum positive and negative numbers together
    √ should sum positive and negative decimal numbers together (1 ms)

Test Suites: 1 passed, 1 total
Tests:       3 passed, 3 total
Snapshots:   0 total
Time:        0.394 s, estimated 1 s
Ran all test suites.
```

Quick tip: If you only want to run one test, you can put `only` after a test initiation in order for it to be the only test ran in that test file. For example:

```JavaScript
it.only('should sum positive and negative numbers together', () => {
  expect(addNumbers(1, -2)).toBe(-1);
});

it('should sum positive and negative decimal numbers together', () => {
  expect(addNumbers(-1.5, 3)).toBe(1.5);
});
```

This will only run the first test. This is a great way to target a broken test for further trial and error without having to run all the tests.

You should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)
    ○ skipped should add two positive numbers together
    ○ skipped should sum positive and negative decimal numbers together

Test Suites: 1 passed, 1 total
Tests:       2 skipped, 1 passed, 3 total
Snapshots:   0 total
Time:        0.413 s, estimated 1 s
Ran all test suites.
```

Remove the `only` from the test file that we just previously added. Now all tests should be run with our command.

Taking this a bit further, if we had multiple tests in a project, we can target only running a specific test file. For example, lets create `random.test.js` and copy/paste all the code from `equations.test.js` into this new file. Then run the test command.

Notice how we got two suites, with six total tests like so:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
 PASS  __tests__/random.test.js

Test Suites: 2 passed, 2 total
Tests:       6 passed, 6 total
Snapshots:   0 total
Time:        0.52 s, estimated 1 s
Ran all test suites.
```

It ran both test files. It also doesn't give you any of the verbose dialog that can be very helpful. That's what happens when you run more than one test at a time.

If we only wanted to run `equations.test.js`, we can do that by specifying with our script command:

```Shell
npm run test equations.test.js
```

You'll notice that now only one suite and three tests have been run for evaluation. You will also see the specification you made reflected at the bottom of your output like below:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2ms)
    √ skipped should add two positive numbers together
    √ skipped should sum positive and negative decimal numbers together

Test Suites: 1 passed, 1 total
Tests:       3 passed, 3 total
Snapshots:   0 total
Time:        0.264 s, estimated 1 s
Ran all test suites matching /equations.test.js/i.
```

Let's go ahead and delete the **random.test.js** file now.

**Continuing with added tests...**

The next test case is about passing in only one value. Let's add this test to the end of our `describe` statement:

```JavaScript
it('should sum correctly with only one value passed in', () => {
  expect(addNumbers(3)).toBe(3);
});
```

Now, let's run the tests and you should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 FAIL  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2 ms)
    √ should sum positive and negative numbers together
    √ should sum positive and negative decimal numbers together
    × should sum correctly with only one value passed in (2 ms)

  ● addNumbers function › should sum correctly with only one value passed in
  
    expect(received).toBe(expected) // Object.is equality

    Expected: 3
    Received: NaN

      19 |
      20 |   it.only('should sum correctly with only one value passed in', () => {
    > 21 |     expect(addNumbers(3)).toBe(3);
         |                           ^
      22 |   });
      23 | })
      24 |

      at Object.toBe (__tests__/equations.test.js:21:27)

Test Suites: 1 failed, 1 total
Tests:       1 failed, 3 passed, 4 total
Snapshots:   0 total
Time:        0.291 s, estimated 1 s
Ran all test suites.
```

**Step 8: Fixing the Code** The test case for passing in only one value failed. The test log shows that the expected value was 3, but the received value was NaN.

We need to fix our code to handle this case. Let's modify the `addNumbers` function:

```JavaScript
function addNumbers(num1, num2 = 0) {
  // return the evaluation of adding the two numbers that were provided
  return num1 + num2;
}

module.exports = {
  addNumbers
};
```

Now, let's run the tests again and check if they pass. Result should look like below:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2 ms)
    √ should sum positive and negative numbers together
    √ should sum positive and negative decimal numbers together
    √ should sum correctly with only one value passed in  

Test Suites: 1 passed, 1 total
Tests:       4 passed, 4 total
Snapshots:   0 total
Time:        0.28 s, estimated 1 s
Ran all test suites.
```

**Step 9: Handling Non-numeric Values** One more test case remains: passing non-numeric values to the `addNumbers` function. Let's write the test:

```JavaScript
it('should sum two strings with a NaN error', () => {
  expect(addNumbers('foo', 'bar')).toBe(NaN);
});
```

Now, let's run the tests and you should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests... 
 FAIL  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2 ms)
    √ should sum positive and negative numbers together (1 ms)
    √ should sum positive and negative decimal numbers together
    √ should sum correctly with only one value passed in
    × should sum two strings with a NaN error (2 ms)

  ● addNumbers function › should sum two strings with a NaN error

    expect(received).toBe(expected) // Object.is equality

    Expected: NaN
    Received: "foobar"

      23 |
      24 | it('should sum two strings with a NaN error', () => {
    > 25 |   expect(addNumbers('foo', 'bar')).toBe(NaN);
         |                                    ^
      26 | });
      27 | })
      28 |

      at Object.toBe (__tests__/equations.test.js:25:36)

Test Suites: 1 failed, 1 total
Tests:       1 failed, 4 passed, 5 total
Snapshots:   0 total
Time:        0.432 s, estimated 1 s
Ran all test suites.
```

**Step 8: Fixing the Code** The test case for adding the strings together failed as it added strings together, which is incorrect for our application. We want NaN to be returned so we need to convert our numbers using `Number()` and return based on a conditional.

We need to fix our code to handle this case. Let's modify the `addNumbers` function:

```JavaScript
function addNumbers(num1, num2 = 0) {
  // convert to numbers
  num1 = Number(num1);
  num2 = Number(num2);

  // check if either number is NaN, and return accordingly
  if (isNaN(num1) || isNaN(num2)) {
    return NaN;
  } else {
    return num1 + num2;
  }
}

module.exports = {
  addNumbers
};
```

Now, let's run the tests and you should expect something like the following in your console:

```Shell
$ npm run test

> unit-testing-jest@1.0.0 test
> echo Running Tests... && jest

Running Tests...
 PASS  __tests__/equations.test.js
  addNumbers function
    √ should add two positive numbers together (2 ms)
    √ should sum positive and negative numbers together
    √ should sum positive and negative decimal numbers together (1 ms)
    √ should sum correctly with only one value passed in
    √ should sum two strings with a NaN error
    
Test Suites: 1 passed, 1 total
Tests:       5 passed, 5 total
Snapshots:   0 total
Time:        0.4 s, estimated 1 s
Ran all test suites.
```

All the tests are passing now, and you can confidently use the `addNumbers` function knowing that it behaves as expected. The tests also serve as documentation for the expected behavior of the code, so we can remove comments if they duplicate what the test is telling us.

Last trick for Jest... If you want the tests to continually run without needing to provide the command every time, you can specify `jest --watch' for the `test`script in`package.json`:

```JavaScript
{
  "scripts": {
    "test": "echo Uh oh! No test framework added yet! && jest --watch"
  },
}
```

**Step 12: Conclusion**

By following the test-driven development (TDD) approach, you first defined the desired behavior of your code (similar to sudo code or thinking about it), and then implemented the code to pass those tests. This approach helps ensure that your code works as intended and allows for easier maintenance and debugging in the future.

Additionally, the tests serve as documentation, providing examples of how to use the `addNumbers` function and what results to expect in different scenarios.

You can now confidently use the `addNumbers` function in your projects, knowing that it has been thoroughly tested and validated.

## Other Test Tools

Apart from Jest, there are various other testing tools and libraries available that you can explore based on your project requirements. Some popular options include:

- [React Testing Library](https://testing-library.com/docs/react-testing-library/intro/): Commonly used alongside Jest in React projects for testing.
- Mocha: A feature-rich JavaScript testing framework that supports both synchronous and asynchronous testing.
- Jasmine: A behavior-driven development (BDD) framework for testing JavaScript code.
- Cypress: A powerful end-to-end testing framework for web applications.
- Selenium: A widely used automated testing framework for web applications.

Based on the nature and complexity of your project, you can choose the most suitable testing tool.

## Integration Testing

Integration Testing is the next step up from Unit Testing. It tests multiple, smaller components together that need to interact in a certain fashion.

You want to ensure that it works in that way, just like with a unit test. You `expect` it to function in a certain way. There could be bugs in the interactions for instance.. Or the components could run in a different order than what you are intending, which would cause an error. These are all scenarios that are pertinent to your application doing what it is designed for.

Integration testing focuses on verifying that the different parts of the system work together correctly, ensuring the overall functionality and behavior of the integrated components.

Let's go over an example below:

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
	const placeOrderResult = cartService.placeOrder(
		order,
		inventoryService,
		paymentService
	);

	// Assertions
	expect(placeOrderResult.success).toBe(true);
	expect(inventoryService.deductItems).toHaveBeenCalledWith([
		{ name: 'Shirt', quantity: 2 },
		{ name: 'Jeans', quantity: 1 },
	]);
	// expect.any(Number) will pass with any number
	expect(paymentService.processPayment).toHaveBeenCalledWith(
		'Credit Card',
		expect.any(Number)
	);
});
```

Steps above:

1. Import the necessary modules or services (CartService, InventoryService, PaymentService).

2. Define the mocked data for the order, including the items and payment method.

3. Create instances of the required services (cartService, inventoryService, paymentService).

4. Invoke the placeOrder method of the CartService, passing in the order details and the instances of the other services.

5. Perform assertions to validate the expected behavior, such as checking the success status of the order, ensuring that the deductItems method of the InventoryService is called with the correct items, and verifying that the processPayment method of the PaymentService is called with the expected payment method.

## Wrap-up

So to recap on tonight, we discussed the importance of software testing and introduced the concept of Test Driven Development (TDD). We explored different types of testing and the significance of unit testing in the Testing Pyramid. We wrote and executed unit tests using Jest and learned how integration tests work to test multiple components of a complex application.

That's it for me tonight folks. Thanks for letting me hang out with ya'll!
