#include <stdio.h>

// 4. global variable
int global_variable = 28374;

// 5. own function
int is_even(int num) {
  return num % 2 == 0;
}

int main() {
  // 1. array elements and actions (division, substraction)
  int arr[] = { 5, 3, 8, 1 };
  int res1 = arr[0] - arr[2];
  int res2 = arr[1] / arr[3];

  // 2. if statement
  if (arr[1] == 42) {
    arr[1] = 24;
  }

  // 3. switch on 4 cases
  switch (arr[0]) {
    case 1:
      arr[0]++;
      break;
    case 2:
      arr[1]--;
      break;
    case 4:
      arr[3]--;
    case 5:
      arr[2]++;
      break;
  }

  // 4. print global variable
  printf("%d\n", global_variable);

  // 5. while cycle
  while (arr[0] > 0) {
    arr[0]--;
  }

  // 6. function call
  is_even(arr[3]);

  // 7. array with specific elements
  int arr2[] = { 12, 13, 14, 15, 16 };

  return 0;
}
