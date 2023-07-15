const { addNumbers } = require('../equations.js');

describe('addNumbers function', () => {
  it('should add two positive numbers together', () => {
    // create your sample inputs
    const [mockNum1, mockNum2] = [3,5]

    // assertion to determine pass/fail
    expect(addNumbers(mockNum1, mockNum2)).toBe(8)
  })

  it('should sum positive and negative numbers together', () => {
    expect(addNumbers(1, -2)).toBe(-1);
  });

it('should sum positive and negative decimal numbers together', () => {
  expect(addNumbers(-1.5, 3)).toBe(1.5);
});

it('should sum correctly with only one value passed in', () => {
  expect(addNumbers(3)).toBe(3);
});

it('should sum two strings with a NaN error', () => {
  expect(addNumbers('foo', 'bar')).toBe(NaN);
});
})
