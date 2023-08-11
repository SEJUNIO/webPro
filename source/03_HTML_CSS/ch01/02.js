/* 동적인 부분(DB연결X) = 자바스크립트(jQuery, react)문법 */
var name = prompt("이름은 ?", "박세준");  // 취소를 클릭하면 'null'리턴
if (name != "null" && name != "") { 
    document.write(name + "님 반갑습니다.<br>");
}