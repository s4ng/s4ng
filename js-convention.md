# JavaScript 코딩 컨벤션

## 중괄호

중괄호는 이집션(Egyptian) 스타일을 따라 새로운 줄이 아닌 상응하는 키워드와 같은 줄에 작성합니다.

여기에 더하여 여는 중괄호 앞엔 공백이 하나 있어야 합니다

```jsx
if (condition) {
  // 코드 1
  // 코드 2
  // ...코드 n...
}
```

`if (condition) doSomething()` 과 같은 단 한 줄짜리 구문은 중요하게 다뤄야 할 예지케이스입니다.

이런 예외상황에는 

```jsx
if (condition) doSomething();
```

같이 붙여 쓰거나

```jsx
if (condition) { 
	doSomething();
}
```

같이 중괄호와 함께 씁니다.

## 가로 길이

가로 길이는 80자 제한으로 정합니다.

## 들여쓰기

들여쓰기는 스페이스 두 개로 정합니다.

## 세미콜론

모든 구문 끝에 세미콜론을 쓰는 것으로 정합니다.

## 변수

변수를 선언할 때는 const를 사용합니다.

단, 변수의 값이 바뀌는 경우 let을 사용다.

```jsx
const a;
let b = 5;

// 😡 don't!!
var a = 10;
```

### 변수 선언 위치

변수는 구문의 시작 부분에 한꺼번에 선언하지 않고, 필요할 때마다 직전에 선언하기로 합니다.

또 한 줄에 하나의 변수만 선언합니다.

```jsx
// 😡 bad
function run(isRight) {
	let a, b;
	
	...

	if(isRight) {
		return a + b;
	}
}

// 😀 good
function run(isRight) {
	
	...

	let a;
	let b;

	if(isRight) {
		return a + b;
	}
}
```

변수를 선언할 떄나 값을 대입할 떄 등 사용되는 모든 연산자에는 앞과 뒤에 공백을 한 칸씩 둡니다.

```jsx
a = b;

a *= b;

a = b + c;
```

## 긴 메소드 체인

각 메소드마다 들여씁니다. 

만약 점( . )을 사용하여 체인처럼 늘어지는 경우 각 메소드 앞에 점을 씁니다.

```jsx
// good
$('#items')
  .find('.selected')
  .highlight()
  .end()
  .find('.open')
  .updateCount();
```

## 줄 공백

줄 공백의 경우 자유롭게, 하지만 깔끔하게 사용합니다.

하지만 2줄 이상 사용하지 않습니다.

## 문자열

문자열의 경우 작은 따옴표( ' )를 사용하여 선언합니다.

```jsx
const str = 'Hello World!';
```

문자열 내에 작은 따옴표가 포함되거나, 변수가 포함되거나 등등 상황에 따라서 **템플릿 리터럴**( ` ) 을 사용할 수 있습니다.

문자열이 길어도 사용할 수 있음.

```jsx
const greeting = `Hello ${name}`

const errorMessage = 'This is a super long error that was thrown because ' +
  'of Batman. When you stop to think about how Batman had anything to do ' +
  'with this, you would get nowhere fast.';

const errorMessage = `This is a super long error that was thrown because
  of Batman. When you stop to think about how Batman had anything to do
  with this, you would get nowhere fast.`;
```

## 배열

배열을 선언할 때는 Array 생성자가 아닌 **리터럴 구문**을 사용합니다

```jsx
// bad
const items = new Array();

// good
const items = [];
```

배열을 복사할 때는 배열의 확장연산자( ... )를 사용합니다.

```jsx
// bad
const len = items.length;
const itemsCopy = [];
let i;

for (i = 0; i < len; i++) {
  itemsCopy[i] = items[i];
}

// good
const itemsCopy = [...items];
```

## 객체

객체를 생성할 때도 마찬가지로 Object 생성자가 아닌 리터럴 구문을 사용합니다.

```jsx
// bad
const item = new Object();

// good
const item = {};
```

## 함수

함수를 선언할 때는 함수 이름 옆에 소괄호는 붙이고, 중괄호는 한 칸 띄웁니다.

```jsx
function someFunction() {
	console.log("메롱");
}
```

### Arrow Function

논의해보고 결정. 

써야 할 지 쓰지 말아야 할 지 모르겠음.

```jsx
const someFunction() => {
	console.log("Hello");
}
```

함수 바디가 하나의 식으로 구성된 경우, 중괄호와 return문을 생략할 수 있습니다.

중괄호를 생략하지 않을 경우 return을 포함시켜야 합니다.

```jsx
[1, 2, 3].reduce((y, x) => x + y);

// 예시입니다. 만약 하나의 식이라면 중괄호는 생략해야 합니다.
[1, 2, 3].reduce((y, x) => {
	return x + y
});
```

## 로그

console.log() 를 사용했다면 커밋 할 때는 주석처리 하거나 지워야 합니다.

```jsx
//console.log(err);
```
