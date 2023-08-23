/* array함수 :
*   매개변수가 0개일때 : length가 0인 배열을 return
*   매개변수가 1개일때 : length가 매개변수만큼의 크기를 가지는 배열 return
*   매개변수가 2개 이상일 때는 매개변수로 배열을 생성하여 return
*/
var arr1 = array();
var arr2 = array(3);
var arr3 = array(273, 2, 'hello');
var arr3 = array(273, 2, 2, 4, 'h1');
console.log('arr1(빈배열) = ', arr1);
console.log('arr2 = ', arr2);
console.log('arr3 = ', arr3);
console.log('arr4 = ', arr4);
function array(){ //arguments 배열에 실행시의 매개변수 들어옴
    let result = [];
    if(arguments.length == 1){ //length가 arguments[0]인 배열 : array(2)
        for(let cnt=1; cnt<=arguments[0]; cnt++){
            result.push(null);
    }
    }else if(arguments.length >= 2) {
        for(let idx=0; idx<arguments.length; idx++){
            result.push(arguments[idx]);
        }
    }
    return result;
} 
