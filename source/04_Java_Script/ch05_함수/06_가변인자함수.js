//가변인자함수 : 매개변수의 갯수에 따라 변하는 함수. 화살표 함수에서는 불가
//ex. array()
var arr1 = [273, 2, 3, 'hello', ];
var arr2 = Array(273, 2, 3, 'hello', );
var arr3 = [ , , ,]; //방3개짜리 빈배열
var arr4 = Array(3);
var arr5 = [];
var arr6 = Array();

console.log('arr=1', arr1, '-방의 갯수=', arr1.length);
console.log('arr=2', arr2, '-방의 갯수=', arr2.length);
console.log('arr=3', arr3, '-방의 갯수=', arr3.length);
console.log('arr=4', arr4, '-방의 갯수=', arr4.length);
console.log('arr=5', arr5, '-방의 갯수=', arr5.length);
console.log('arr=6', arr6, '-방의 갯수=', arr6.length);
