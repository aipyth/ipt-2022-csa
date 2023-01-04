---
title: Лабораторна робота №1
author: ФІ-91 Житкевич Іван
published: true
---

## Стан регістрів на кожному пункті

1. Массив елементів та дії віднімання та ділення на них

![disassembly instrument](images/1-start.png)

За цей пункт відповідає код на C:
```c
int arr[] = { 5, 3, 8, 1 };
int res1 = arr[0] - arr[2];
int res2 = arr[1] / arr[3];
```
Йому відповідає така діляка дизассембльованого коду

![1-disassm](images/1-disassm2.png)

Як елементи масиву дебагер показує локальні змінні `var_30h`, `var_2ch`, `var_28h`, `var_24h`, що відповідають елементам 0, 1, 2 та 3 массиву. 

Також ми бачимо:

- запис (адреси `67`, `6e`, `75`, `7c`) захардкожених даних у елементи масиву 

- процес віднімання та запису результату виконання опкоду `sub` з регістру `edx` у область змінної `var_38h` по адресам `83`, `86`, `89`, `8b`. Для віднімання викорстовуються регістри `edx` (data register) та `eax` (primary accumulator).

- за ділення відповідають команди за адресами `8e`, `91`, `94`, `95`. `idiv` записує результат у регістри `eax` та `edx`

Значення у регістрах:
- на момент запису нульового та другого елементів у `edx` та `eax` перед відніманням
та після операції віднімання результат у регістрі `rdx`

  ![1-pre-substr](images/1-pre-substr.png){ width=50% }
  ![1-post-substr](images/1-post-substr.png){ width=50% }

- запис даних у регістри `eax` та `ecx` для ділення, після ділення

![1-pre-div](images/1-pre-div.png){ width=50% }
![1-post-div](images/1-post-div.png){ width=50% }


2. Блок `if`
```c
if (arr[1] == 42) {
  arr[1] = 24;
}
```
Йому відповідає

![2-disassm](images/2-disassm.png)

Де записується значення першого елементу масиву у регістр `eax` та далі порівнюємо
це значення із значенням `0x2a` (42). Якщо ж два значення не рівні, то виконуємо
перехід на адресу `0x5622b6d2d1a9`, інакше записуємо у перший елемент масиву `0x18` (24).

![2-reg1](images/2-reg1.png){ width=25% }
![2-reg2](images/2-reg2.png){ width=25% }
![2-reg3](images/2-reg3.png){ width=25% }
![2-reg4](images/2-reg4.png){ width=25% }


3. `switch`
```c
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
```

Значення у регістрах:

![3-reg1](images/3-reg1.png){ width=16% }
![3-reg2](images/3-reg2.png){ width=16% }
![3-reg3](images/3-reg3.png){ width=16% }
![3-reg4](images/3-reg4.png){ width=16% }
![3-reg5](images/3-reg5.png){ width=16% }
![3-reg6](images/3-reg6.png){ width=16% }

Та дизассембльований код

![3 disassm](images/image_2022-09-18-15-49-59.png)

---


4. Global variable

Вивід значення змінної (виклик `printf`)

![4-printf-disassm](images/4-printf-disassm.png)

Значення глобальної змінної знаходиться за адресою `0x556ccd28f020`

![4-global-var-hexdump](images/4-global-var-hexdump.png)

5. Цикл `while`
```c
// 5. while cycle
while (arr[0] > 0) {
  arr[0]--;
}
```
![5-disassm](images/5-disassm.png)

Перевіряється умова циклу

![5-reg1](images/5-reg1.png){ width=25% }
![5-reg2](images/5-reg2.png){ width=25% }
![5-reg3](images/5-reg3.png){ width=25% }
![5-reg4](images/5-reg4.png){ width=25% }

Перейшли у тіло циклу

![5-reg5](images/5-reg5.png){ width=25% }
![5-reg6](images/5-reg6.png){ width=25% }
![5-reg7](images/5-reg7.png){ width=25% }

Та знову перейшли на область перевірки умови

![5-reg8](images/5-reg8.png){ width=25% }


6. Реалізована функція `is_even`, що перевіряє `int` число на подільність
на 2.

Її виклик в `main`

![6-call-disassm](images/6-call-disassm.png)

Значення регістрів при виклику

![6-call-reg1](images/6-call-reg1.png){ width=25% }
![6-call-reg2](images/6-call-reg2.png){ width=25% }
![6-call-reg3](images/6-call-reg3.png){ width=25% }

Функція `is_even`

![6-func-disassm](images/6-func-disassm.png)

Та значення регістрів при її виконанні

![6-func-reg1](images/6-func-reg1.png){ width=18% }
![6-func-reg2](images/6-func-reg2.png){ width=18% }
![6-func-reg3](images/6-func-reg3.png){ width=18% }
![6-func-reg4](images/6-func-reg4.png){ width=18% }
![6-func-reg5](images/6-func-reg5.png){ width=18% }
![6-func-reg6](images/6-func-reg6.png){ width=18% }
![6-func-reg7](images/6-func-reg7.png){ width=18% }
![6-func-reg8](images/6-func-reg8.png){ width=18% }
![6-func-reg9](images/6-func-reg9.png){ width=18% }

7. Список зі значеннями
```c
// 7. array with specific elements
int arr2[] = { 12, 13, 14, 15, 16 };
```

![7-disassm](images/7-disassm.png)



## Дерево програми (функція main)

![main tree](./graph.png)

## Лістинг програми на C

```c
#include <stdio.h>

// 4. global variable
int global_variable = 28374;

// 6. own function
int is_even(int num) {
  return num % 2 == 0;
}

int main() {
  // 1. array elements and actions (division, substraction)
  int arr[] = { 5, 3, 8, 1 };
  int res1 = arr[0] - arr[2]; int res2 = arr[1] / arr[3];

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
```
